import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:payment_test/presentation/view/payment_message.dart';
import 'package:payment_test/service/paypal_servise.dart';
import 'package:webview_flutter/webview_flutter.dart';

class PaypalWebView extends StatefulWidget {
  final String iFrameUrl;
  final String token;

  const PaypalWebView({
    super.key,
    required this.iFrameUrl,
    required this.token,
  });

  @override
  _PaymentWebViewState createState() => _PaymentWebViewState();
}

class _PaymentWebViewState extends State<PaypalWebView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Paypal Payment')),
      body: WebViewWidget(
        controller:
            WebViewController()
              ..setJavaScriptMode(JavaScriptMode.unrestricted)
              ..setNavigationDelegate(
                NavigationDelegate(
                  onProgress: (int progress) {
                    log('Loading progress: $progress%');
                  },
                  onPageStarted: (String url) {
                    log('Page started: $url');
                  },
                  onPageFinished: (String url) {
                    log('Page finished: $url');
                  },
                  onHttpError: (HttpResponseError error) {
                    log('HTTP error: $error');
                  },
                  onWebResourceError: (WebResourceError error) {
                    log('Web resource error: ${error.description}');
                  },
                  onNavigationRequest: (NavigationRequest request) async {
                    if (request.url.startsWith(
                      'https://your-app.com/success',
                    )) {
                      Uri uri = Uri.parse(request.url);
                      String? paymentId = uri.queryParameters['paymentId'];
                      String? payerId = uri.queryParameters['PayerID'];
                      log('Navigating to: ${request.url}');
                      log("********************${payerId!}");
                      log("********************${paymentId!}");

                      if (paymentId != null && payerId != null) {
                        bool? isSuccess = await PaypalService().executePayment(
                          payerId: payerId,
                          paymentId: paymentId,
                          accessToken: widget.token,
                        );

                        if (isSuccess!) {
                          Navigator.pop(context);
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => OrderCompleted(),
                            ),
                          );
                        } else {
                          Navigator.pop(context);
                          ScaffoldMessenger.of(context).showSnackBar(
                            SnackBar(content: Text('Payment Failed')),
                          );
                        }
                      }

                      return NavigationDecision.prevent;
                    }
                    return NavigationDecision.navigate;
                  },
                ),
              )
              ..loadRequest(Uri.parse(widget.iFrameUrl)),
      ),
    );
  }
}
