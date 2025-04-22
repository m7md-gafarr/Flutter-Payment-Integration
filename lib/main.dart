import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_paymob/flutter_paymob.dart';
import 'package:flutter_stripe/flutter_stripe.dart';
import 'package:payment_test/constant/keys.dart';
import 'package:payment_test/presentation/view/checkout_screen_ui.dart';
import 'package:payment_test/presentation/view%20model/payment%20cubit/payment_cubit.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  FlutterPaymob.instance.initialize(
    apiKey: Keys.paymobAPIKEY,
    integrationID: int.parse(Keys.paymobPaymentIntegrationsCARD),
    walletIntegrationId: int.parse(Keys.paymobPaymentIntegrationsWALLET),
    iFrameID: 915226,
  );
  Stripe.publishableKey = Keys.stripePUBLICKEY;

  runApp(BlocProvider(create: (context) => PaymentCubit(), child: MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: CheckOutScreen(),
    );
  }
}
