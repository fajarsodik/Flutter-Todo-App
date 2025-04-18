part of 'intro_bloc.dart';

abstract class IntroEvent extends Equatable {
  const IntroEvent();

  @override
  List<Object> get props => [];
}

class CheckFirstLaunchEvent extends IntroEvent {}

class CompleteIntroEvent extends IntroEvent {}
