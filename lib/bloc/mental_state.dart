part of 'mental_bloc.dart';

@immutable
abstract class MentalState extends Equatable {
  const MentalState();

  @override
  List<Object> get props => [];
}

class MentalInitial extends MentalState {}

class MentalIndexState extends MentalState {
  final int mentalIndex;

  const MentalIndexState({
    required this.mentalIndex,
  }) : super();
  @override
  List<Object> get props => [mentalIndex];
}
