part of 'timer_bloc.dart';

class TimerState extends Equatable {
  const TimerState(this.duration);
  final int duration;
  @override
  List<Object?> get props => [int];
}

class TimerInitial extends TimerState {
  const TimerInitial(int duration) : super(duration);

  @override
  String toString() => 'TimerInitial { duration : $duration}';
}

class TimerRunPause extends TimerState {
  const TimerRunPause(int duration) : super(duration);

  @override
  String toString() => 'TimerRunPause { duration : $duration}';
}

class TimerRunInProgress extends TimerState {
  const TimerRunInProgress(int duration) : super(duration);

  @override
  String toString() => 'TimerRunInProgress { duration : $duration}';
}

class TimerRunComplete extends TimerState {
  const TimerRunComplete() : super(0);
}