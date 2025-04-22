import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:payment_test/constant/keys.dart';
import 'package:payment_test/model/Paymob%20model/generate_token_model/generate_token_model.dart';

class PaymobService {
  final Dio dio = Dio();

  Future<String?> getAuthanticationToken() async {
    try {
      Response response = await dio.post(
        "https://accept.paymob.com/api/auth/tokens",
        data: {"api_key": Keys.paymobAPIKEY},
      );

      return response.data['token'];
    } catch (e) {
      print('Error creating payment intent: $e');
      return null;
    }
  }

  Future<int?> getOrderId({
    required String amount,
    required String currency,
    required String authanticationToken,
  }) async {
    try {
      Response response = await dio.post(
        "https://accept.paymob.com/api/ecommerce/orders",
        data: {
          "auth_token": authanticationToken,
          "amount_cents": amount,
          "currency": currency,
          "delivery_needed": "false",
          "items": [],
        },
      );

      return response.data['id'];
    } catch (e) {
      log('Error creating payment intent: $e');
      return null;
    }
  }

  Future<String?> getPaymentKey({
    required String authanticationToken,
    required String orderId,
    required String amount,
    required String currency,
    required String integrationID,
  }) async {
    try {
      Response response = await dio.post(
        "https://accept.paymob.com/api/acceptance/payment_keys",
        data: {
          "expiration": 3600,

          "auth_token": authanticationToken,
          "order_id": orderId,
          "integration_id": integrationID,
          "amount_cents": amount,
          "currency": currency,

          "billing_data": {
            //Have To Be Values
            "first_name": "Clifford",
            "last_name": "Nicolas",
            "email": "claudette09@exa.com",
            "phone_number": "+86(8)9135210487",

            //Can Set "NA"
            "apartment": "NA",
            "floor": "NA",
            "street": "NA",
            "building": "NA",
            "shipping_method": "NA",
            "postal_code": "NA",
            "city": "NA",
            "country": "NA",
            "state": "NA",
          },
        },
      );
      GenerateTokenModel generateTokenModel = GenerateTokenModel.fromJson(
        response.data,
      );

      return generateTokenModel.token;
    } catch (e) {
      log('Error creating payment intent: $e');
      return null;
    }
  }

  Future<String?> paymentWithPaymobCard({required String amount}) async {
    try {
      String? token = await getAuthanticationToken();
      if (token == null) {
        log('Failed to get token');
        return null;
      }

      int? orderId = await getOrderId(
        amount: amount,
        authanticationToken: token,
        currency: "EGP",
      );
      if (orderId == null) {
        log('Failed to get order ID');
        return null;
      }

      String? paymentKey = await getPaymentKey(
        amount: amount,
        authanticationToken: token,
        currency: "EGP",
        orderId: orderId.toString(),
        integrationID: Keys.paymobPaymentIntegrationsCARD,
      );
      if (paymentKey == null) {
        log('Failed to get payment key');
        return null;
      }

      log('Payment Key: $paymentKey');
      return paymentKey;
    } catch (e) {
      log('Error in paymentWithPaymob: $e');
      return null;
    }
  }

  Future<String?> paymentWithPaymobWallet({required String amount}) async {
    try {
      String? token = await getAuthanticationToken();
      if (token == null) {
        log('Failed to get token');
        return null;
      }

      int? orderId = await getOrderId(
        amount: amount,
        authanticationToken: token,
        currency: "EGP",
      );
      if (orderId == null) {
        log('Failed to get order ID');
        return null;
      }

      String? paymentKey = await getPaymentKey(
        amount: amount,
        authanticationToken: token,
        currency: "EGP",
        orderId: orderId.toString(),
        integrationID: Keys.paymobPaymentIntegrationsWALLET,
      );
      if (paymentKey == null) {
        log('Failed to get payment key');
        return null;
      }

      log('Payment Key: $paymentKey');
      return paymentKey;
    } catch (e) {
      log('Error in paymentWithPaymob: $e');
      return null;
    }
  }
}
