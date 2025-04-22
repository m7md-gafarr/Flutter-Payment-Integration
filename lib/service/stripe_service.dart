import 'package:dio/dio.dart';
import 'package:flutter_stripe/flutter_stripe.dart';
import 'package:payment_test/constant/keys.dart';
import 'package:payment_test/model/Stripe%20model/customer_model/customer_model.dart';
import 'package:payment_test/model/Stripe%20model/ephemeral_key_model/ephemeral_key_model.dart';
import 'package:payment_test/model/Stripe%20model/payment_intent_model/payment_intent_model.dart';

class StripeService {
  final Dio dio = Dio();

  Future<CustomerModel?> registerCustomer({
    required String name,
    required String email,
  }) async {
    try {
      const String secretKey = Keys.stripeSECRITKEY;

      dio.options.headers = {
        "Authorization": "Bearer $secretKey",
        "Content-Type": "application/x-www-form-urlencoded",
      };

      Response response = await dio.post(
        "https://api.stripe.com/v1/customers",
        data: {"name": name, "email": email},
      );

      return CustomerModel.fromJson(response.data);
    } catch (e) {
      print('Error creating payment intent: $e');
      return null;
    }
  }

  Future<EphemeralKeyModel?> getEphemeralKey({
    required String customerId,
  }) async {
    try {
      const String secretKey = Keys.stripeSECRITKEY;

      dio.options.headers = {
        "Authorization": "Bearer $secretKey",
        "Content-Type": "application/x-www-form-urlencoded",
        "Stripe-Version": "2025-01-27.acacia",
      };

      Response response = await dio.post(
        "https://api.stripe.com/v1/ephemeral_keys",
        data: {"customer": customerId},
      );

      return EphemeralKeyModel.fromJson(response.data);
    } catch (e) {
      print('Error creating payment intent: $e');
      return null;
    }
  }

  Future<PaymentIntentModel?> getPaymentIntent({
    required int amount,
    required String currency,
    required String customerId,
  }) async {
    try {
      const String secretKey = Keys.stripeSECRITKEY;

      dio.options.headers = {
        "Authorization": "Bearer $secretKey",
        "Content-Type": "application/x-www-form-urlencoded",
      };

      Response response = await dio.post(
        "https://api.stripe.com/v1/payment_intents",
        data: {
          "amount": amount,
          "currency": currency,
          "automatic_payment_methods[enabled]": true,
          "customer": customerId,
        },
      );

      return PaymentIntentModel.fromJson(response.data);
    } catch (e) {
      print('Error creating payment intent: $e');
      return null;
    }
  }

  Future<void> initPaymentSheet({
    required int amount,
    required String currency,
  }) async {
    try {
      PaymentIntentModel? model = await getPaymentIntent(
        amount: amount,
        currency: currency,
        customerId: "cus_S9WLX4BQZApqL6",
      );
      EphemeralKeyModel? ephemeralKey = await getEphemeralKey(
        customerId: "cus_S9WLX4BQZApqL6",
      );
      if (model?.clientSecret == null) {
        throw Exception("Invalid client secret");
      }
      if (ephemeralKey?.secret == null) {
        throw Exception("Invalid ephemeralKey secret");
      }
      await Stripe.instance.initPaymentSheet(
        paymentSheetParameters: SetupPaymentSheetParameters(
          merchantDisplayName: 'Aoun',
          paymentIntentClientSecret: model?.clientSecret ?? '',
          customerEphemeralKeySecret: ephemeralKey?.secret ?? '',
          customerId: "cus_S9WLX4BQZApqL6",
        ),
      );
    } catch (e) {
      print('Error creating payment intent: $e');
      null;
    }
  }

  Future<void> displayPaymentSheet() async {
    await Stripe.instance.presentPaymentSheet();
  }

  Future<void> makePayment({
    required int amount,
    required String currency,
  }) async {
    await initPaymentSheet(amount: amount * 100, currency: currency);
    await displayPaymentSheet();
  }
}
