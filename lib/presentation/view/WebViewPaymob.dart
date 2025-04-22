import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:payment_test/presentation/view/payment_message.dart';
import 'package:webview_flutter/webview_flutter.dart';

class PaymobWebView extends StatefulWidget {
  final String iFrameUrl;

  const PaymobWebView({super.key, required this.iFrameUrl});

  @override
  _PaymentWebViewState createState() => _PaymentWebViewState();
}

class _PaymentWebViewState extends State<PaymobWebView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Paymob Payment')),
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
                  onNavigationRequest: (NavigationRequest request) {
                    if (request.url.contains('success')) {
                      log('Payment Response URL: ${request.url}');

                      bool isSuccess = request.url.contains('success=true');
                      // String? transactionId =
                      //     Uri.parse(request.url).queryParameters['id'] ?? '';
                      // ScaffoldMessenger.of(context).showSnackBar(
                      //   SnackBar(
                      //     content: Text(
                      //       isSuccess
                      //           ? 'Payment Successful! Transaction ID: $transactionId'
                      //           : 'Payment Failed',
                      //     ),
                      //   ),
                      // );
                      isSuccess
                          ? Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => OrderCompleted(),
                            ),
                          )
                          : Navigator.pop(context);
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
