import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:payment_test/service/stripe_service.dart';

part 'payment_state.dart';

class PaymentCubit extends Cubit<PaymentState> {
  PaymentCubit() : super(PaymentInitial());

  startPayment({required int amount, required String currency}) async {
    emit(PaymentLoading());
    try {
      await StripeService().makePayment(amount: amount, currency: currency);
      emit(PaymentSuccess());
    } catch (e) {
      emit(PaymentFailure(e.toString()));
    }
  }
}
