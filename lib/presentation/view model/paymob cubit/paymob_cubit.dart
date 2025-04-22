import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'paymob_state.dart';

class PaymobCubit extends Cubit<PaymobState> {
  PaymobCubit() : super(PaymobInitial());
}
