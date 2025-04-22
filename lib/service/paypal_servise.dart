import 'dart:convert';
import 'dart:developer';
import 'package:dio/dio.dart';
import 'package:payment_test/constant/keys.dart';

class PaypalService {
  final Dio dio = Dio();

  Future<String?> getAuthenticationToken() async {
    const String clientId = Keys.paypalCLINTID;
    const String secret = Keys.paypalSECRTKEY;

    final String basicAuth =
        'Basic ${base64Encode(utf8.encode('$clientId:$secret'))}';

    try {
      final Dio dio = Dio();
      Response response = await dio.post(
        'https://api-m.sandbox.paypal.com/v1/oauth2/token',
        data: {'grant_type': 'client_credentials'},
        options: Options(
          headers: {
            'Authorization': basicAuth,
            'Content-Type': 'application/x-www-form-urlencoded',
          },
        ),
      );

      if (response.statusCode == 200) {
        return response.data['access_token'];
      } else {
        log('Failed to get token: ${response.statusCode}');
        return null;
      }
    } on DioException catch (e) {
      log('DioException getting authentication token: ${e.message}');
      return null;
    } catch (e) {
      log('Error getting authentication token : $e');
      return null;
    }
  }

  Future<String?> createPayment({
    required String amount,
    required String currency,
    required String accessToken,
  }) async {
    try {
      final response = await dio.post(
        "https://api-m.sandbox.paypal.com/v1/payments/payment",
        options: Options(
          headers: {
            'Authorization': 'Bearer $accessToken',
            'Content-Type': 'application/json',
          },
        ),
        data: {
          "intent": "sale",
          "payer": {"payment_method": "paypal"},
          "transactions": [
            {
              "amount": {"total": amount, "currency": currency},
              "description": "Payment for goods/services",
            },
          ],
          "redirect_urls": {
            "return_url": "https://your-app.com/success",
            "cancel_url": "https://your-app.com/cancel",
          },
        },
      );

      if (response.statusCode == 201) {
        final links = response.data['links'] as List<dynamic>;
        for (var link in links) {
          if (link['rel'] == 'approval_url') {
            return link['href'];
          }
        }
        log('Approval URL not found');
        return null;
      } else {
        log('Failed to create payment: ${response.data}');
        return null;
      }
    } on DioException catch (e) {
      log(
        'DioException  create payment Status code: ${e.response?.statusCode}',
      );
      log(
        'DioException  create payment Response data: ${jsonEncode(e.response?.data)}',
      );
      log(
        'DioException  create payment Request data: ${jsonEncode(e.requestOptions.data)}',
      );
      return null;
    } catch (e) {
      log('Error  create payment : $e');
      return null;
    }
  }

  Future<List<String>?> paymentWithPaypal({
    required String amount,
    required String currency,
  }) async {
    String? token = await getAuthenticationToken();
    String? Url = await createPayment(
      amount: amount,
      currency: currency,
      accessToken: token!,
    );

    return [Url!, token];
  }

  Future<bool?> executePayment({
    required String paymentId,
    required String payerId,
    required String accessToken,
  }) async {
    try {
      final Dio dio = Dio();
      final response = await dio.post(
        'https://api-m.sandbox.paypal.com/v1/payments/payment/$paymentId/execute',
        data: {'payer_id': payerId},
        options: Options(
          headers: {
            'Authorization': 'Bearer $accessToken',
            "Content-Type": "application/json",
          },
        ),
      );

      if (response.statusCode == 200) {
        return true;
      } else {
        log('Failed to execute payment: ${response.statusCode} ');
        return false;
      }
    } on DioException catch (e) {
      log(
        'DioException  execute payment Status code: ${e.response?.statusCode}',
      );
      log(
        'DioException  execute payment Response data: ${jsonEncode(e.response?.data)}',
      );
      log(
        'DioException  execute payment Request data: ${jsonEncode(e.requestOptions.data)}',
      );
      return null;
    } catch (e) {
      log('Error  execute payment : $e');
      return null;
    }
  }
}
