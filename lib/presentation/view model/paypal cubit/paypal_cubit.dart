import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'paypal_state.dart';

class PaypalCubit extends Cubit<PaypalState> {
  PaypalCubit() : super(PaypalInitial());
}
