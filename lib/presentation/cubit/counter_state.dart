part of 'counter_cubit.dart';

sealed class CounterState {}

final class CounterInitial extends CounterState {
  final int increment;
  CounterInitial({required this.increment});
}
final class CounterLoading extends CounterState {}
final class CounterSuccess extends CounterState {
  final int? increment;
  final int? decrement;
  final WeatherModel? weatherModel;
  CounterSuccess({this.increment, this.decrement,this.weatherModel});

}
final class CounterError extends CounterState {}

