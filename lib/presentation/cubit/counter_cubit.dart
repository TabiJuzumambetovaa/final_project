import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_final_project/presentation/model/weather_model.dart';
import 'package:flutter_final_project/presentation/repository/repositories.dart';

part 'counter_state.dart';

class CounterCubit extends Cubit<CounterState> {
  CounterCubit({required this.repositories})
      : super(CounterInitial(increment: 0));
  final Repositories repositories;

  void increment() {
    emit(CounterLoading());
    try {
      final int increment = repositories.incrementCounter();
      emit(CounterSuccess(increment: increment));
    } catch (e) {
      emit(CounterError());
    }
  }

  void decrement() {
    emit(CounterLoading());
    try {
      final int decrement = repositories.decrementCounter();
      emit(CounterSuccess(increment: decrement));
    } catch (e) {
      emit(CounterError());
    }
  }
  Future<void> getweat()async{
    emit(CounterLoading());
    try{
      final WeatherModel weatherModel=await repositories.getWeather();
      emit(CounterSuccess(weatherModel: weatherModel));
    }catch(e){
      emit(CounterError());
    }

  }
}
