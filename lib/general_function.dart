//! Packages
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mongkhon_lens/bloc/mental_bloc.dart';

class GeneralFunction {
  GeneralFunction._();

  //! Bloc
  static dispatchMentalBloc(BuildContext context, MentalEvent event) =>
      BlocProvider.of<MentalBloc>(context).add(event);
}
