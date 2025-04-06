part of 'intro_bloc.dart';

sealed class IntroState extends Equatable {
  const IntroState();

  @override
  List<Object> get props => [];
}

class IntroInitial extends IntroState {}

class IntroShow extends IntroState {}

class IntroSkip extends IntroState {}
