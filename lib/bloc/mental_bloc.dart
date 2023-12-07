import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';

part 'mental_event.dart';
part 'mental_state.dart';

class MentalBloc extends Bloc<MentalEvent, MentalState> {
  MentalBloc() : super(MentalInitial()) {
    on<MentalEvent>((event, emit) {
      // TODO: implement event handler
    });

    on<SetMentalIndex>((event, emit) async {
      int mentalIndex = event.mentalIndex;

      emit(MentalIndexState(mentalIndex: mentalIndex));
    });
  }
}
