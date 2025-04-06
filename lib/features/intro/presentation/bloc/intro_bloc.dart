import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:todo/features/intro/domain/repositories/intro_repository.dart';

part 'intro_event.dart';
part 'intro_state.dart';

class IntroBloc extends Bloc<IntroEvent, IntroState> {
  final IntroRepository repository;

  IntroBloc(this.repository) : super(IntroInitial()) {
    on<CheckFirstLaunchEvent>((event, emit) async {
      final isFirst = await repository.isFirstLaunch();
      emit(isFirst ? IntroShow() : IntroSkip());
    });

    on<CompleteIntroEvent>((event, emit) async {
      await repository.completeIntro();
      emit(IntroSkip());
    });
  }
}
