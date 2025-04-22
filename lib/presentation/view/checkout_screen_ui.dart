import 'dart:developer' show log;

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_paymob/flutter_paymob.dart';
import 'package:flutter_paypal_payment/flutter_paypal_payment.dart';
import 'package:flutter_stripe/flutter_stripe.dart';
import 'package:payment_test/constant/keys.dart';
import 'package:payment_test/model/Paypal%20model/amount_model/amount_model.dart';
import 'package:payment_test/model/Paypal%20model/amount_model/details.dart';
import 'package:payment_test/model/Paypal%20model/item_list_model/item.dart';
import 'package:payment_test/model/Paypal%20model/item_list_model/item_list_model.dart';
import 'package:payment_test/presentation/view%20model/payment%20cubit/payment_cubit.dart';
import 'package:payment_test/presentation/view/WebViewPaymob.dart';
import 'package:payment_test/presentation/view/WebViewPaypal.dart';
import 'package:payment_test/service/paymob_service.dart';
import 'package:payment_test/service/paypal_servise.dart';

import 'payment_message.dart';

enum PaymentMethod { creditCard, applePay, payPal }

class CheckOutScreen extends StatefulWidget {
  const CheckOutScreen({super.key});

  @override
  State<CheckOutScreen> createState() => _CheckOutScreenState();
}

class _CheckOutScreenState extends State<CheckOutScreen> {
  PaymentMethod? paymentMethod;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Payment Methods", style: TextStyle(fontSize: 30.0)),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          children: [
            const SizedBox(height: 100.0),

            //Stripe Button
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                fixedSize: Size(MediaQuery.of(context).size.width - 50, 50),
                backgroundColor: Color(0xff635bff),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(15),
                ),
              ),
              onPressed: () {
                BlocProvider.of<PaymentCubit>(
                  context,
                ).startPayment(amount: 2000, currency: "usd");
              },
              child: BlocConsumer<PaymentCubit, PaymentState>(
                listener: (context, state) {
                  if (state is PaymentSuccess) {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => OrderCompleted()),
                    );
                  } else if (state is PaymentFailure) {
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(
                        content: Text(state.errorMessage),
                        backgroundColor: Colors.green,
                      ),
                    );
                  }
                },
                builder: (context, state) {
                  if (state is PaymentLoading) {
                    return CircularProgressIndicator();
                  } else {
                    return Text(
                      "Pay with stripe sheet",
                      style: TextStyle(color: Colors.white, fontSize: 20),
                    );
                  }
                },
              ),
            ),
            const SizedBox(height: 30.0),
            // Paypal
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                fixedSize: Size(MediaQuery.of(context).size.width - 50, 50),
                backgroundColor: Color(0xff003087),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(15),
                ),
              ),
              onPressed: () async {
                List<String>? list = await PaypalService().paymentWithPaypal(
                  amount: "${100 * 100}",
                  currency: "USD",
                );

                log(list![1]);
                if (list != null) {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder:
                          (context) =>
                              PaypalWebView(iFrameUrl: list[0], token: list[1]),
                    ),
                  );
                } else {
                  log('Failed to get PayPal approval URL or token');
                }
              },
              child: Text(
                'Pay with paypal',
                style: TextStyle(color: Colors.white, fontSize: 20),
              ),
            ),
            const SizedBox(height: 15.0),
            // Paypal package
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                fixedSize: Size(MediaQuery.of(context).size.width - 50, 50),
                backgroundColor: Color(0xff003087),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(15),
                ),
              ),
              onPressed: () {
                Navigator.of(context).push(
                  MaterialPageRoute(
                    builder:
                        (BuildContext context) => PaypalCheckoutView(
                          sandboxMode: true,
                          clientId: Keys.paypalCLINTID,
                          secretKey: Keys.paypalSECRTKEY,
                          transactions: [
                            {
                              "amount":
                                  AmountModel(
                                    currency: "EUR",
                                    total: 100,
                                    details: Details(
                                      shipping: 0,
                                      shippingDiscount: 0,
                                      subtotal: 100,
                                    ),
                                  ).toJson(),
                              "description":
                                  "The payment transaction description.",

                              "item_list":
                                  ItemListModel(
                                    items: [
                                      Item(
                                        currency: "EUR",
                                        name: "Apple",
                                        price: 10,
                                        quantity: 4,
                                      ),
                                      Item(
                                        currency: "EUR",
                                        name: "Apple",
                                        price: 12,
                                        quantity: 5,
                                      ),
                                    ],
                                  ).toJson(),
                            },
                          ],
                          note: "Contact us for any questions on your order.",
                          onSuccess: (Map params) async {
                            log("onSuccess: $params");
                            Navigator.pop(context);
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => OrderCompleted(),
                              ),
                            );
                          },
                          onError: (error) {
                            log("onError: $error");
                            Navigator.pop(context);
                          },
                          onCancel: () {
                            print('cancelled:');
                            Navigator.pop(context);
                          },
                        ),
                  ),
                );
              },
              child: Text(
                'Pay with paypal package',
                style: TextStyle(color: Colors.white, fontSize: 20),
              ),
            ),
            const SizedBox(height: 30.0),
            // paymob card
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                fixedSize: Size(MediaQuery.of(context).size.width - 50, 50),
                backgroundColor: Color(0xff0784f9),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(15),
                ),
              ),
              onPressed: () async {
                String? paymentKey = await PaymobService()
                    .paymentWithPaymobCard(amount: "${36 * 100}");
                if (paymentKey != null) {
                  String iFrameUrl =
                      'https://accept.paymob.com/api/acceptance/iframes/915226?payment_token=$paymentKey';

                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => PaymobWebView(iFrameUrl: iFrameUrl),
                    ),
                  );
                } else {
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(content: Text('Failed to get payment key')),
                  );
                }
              },
              child: Text(
                'Pay with paymob card',
                style: TextStyle(color: Colors.white, fontSize: 20),
              ),
            ),
            const SizedBox(height: 15.0),
            // paymob wallet
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                fixedSize: Size(MediaQuery.of(context).size.width - 50, 50),
                backgroundColor: Color(0xff0784f9),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(15),
                ),
              ),
              onPressed: () async {
                String? paymentKey = await PaymobService()
                    .paymentWithPaymobWallet(amount: "${300 * 100}");
                if (paymentKey != null) {
                  String iFrameUrl =
                      'https://accept.paymob.com/api/acceptance/iframes/915230?payment_token=$paymentKey';

                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => PaymobWebView(iFrameUrl: iFrameUrl),
                    ),
                  );
                } else {
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(content: Text('Failed to get payment key')),
                  );
                }
              },
              child: Text(
                'Pay with paymob wallet',
                style: TextStyle(color: Colors.white, fontSize: 20),
              ),
            ),
            const SizedBox(height: 15.0),
            // paymob card package
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                fixedSize: Size(MediaQuery.of(context).size.width - 50, 50),
                backgroundColor: Color(0xff0784f9),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(15),
                ),
              ),
              onPressed: () async {
                FlutterPaymob.instance.payWithCard(
                  context: context,
                  currency: "EGP",
                  amount: 200,

                  onPayment: (response) {
                    if (response.success == true) {
                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(content: Text(response.message ?? "Success")),
                      );
                    }
                  },
                );
              },
              child: Text(
                'Pay with paymob card package',
                style: TextStyle(color: Colors.white, fontSize: 20),
              ),
            ),
            const SizedBox(height: 15.0),
            // paymob wallet package
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                fixedSize: Size(MediaQuery.of(context).size.width - 50, 50),
                backgroundColor: Color(0xff0784f9),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(15),
                ),
              ),
              onPressed: () async {
                FlutterPaymob.instance.payWithWallet(
                  context: context,
                  currency: "EGP",
                  amount: 150,
                  number: "01010101010",
                  onPayment: (response) {
                    if (response.success == true) {
                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(content: Text(response.message ?? "Success")),
                      );
                    }
                  },
                );
              },
              child: Text(
                'Pay with paymob wallet package',
                style: TextStyle(color: Colors.white, fontSize: 20),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
