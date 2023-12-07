part of 'mental_bloc.dart';

@immutable
abstract class MentalEvent extends Equatable {
  const MentalEvent();

  @override
  List<Object> get props => [];
}

class MentalEventInit extends MentalEvent {
  const MentalEventInit() : super();
  @override
  List<Object> get props => [];
}

class SetMentalIndex extends MentalEvent {
  final int mentalIndex;
  const SetMentalIndex({
    required this.mentalIndex,
  }) : super();
  @override
  List<Object> get props => [mentalIndex];
}
