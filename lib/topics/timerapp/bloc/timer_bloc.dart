import 'package:bloc_cubit/topics/timerapp/ticker.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'timer_state.dart';
part 'timer_event.dart';

class TimerBloc extends Bloc<TimerEvent, TimerState> {
  static const int _duration = 60;
  final Ticker _ticker;
  TimerBloc({required ticker})
      : _ticker = ticker,
        super(const TimerInitial(_duration));
}
