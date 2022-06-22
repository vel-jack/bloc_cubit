import 'package:bloc/bloc.dart';

class ObserverCounterCubit extends Cubit<int> {
  ObserverCounterCubit() : super(0);
  void increment() => emit(state + 1);
  void decrement() => emit(state - 1);
}
