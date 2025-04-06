import 'package:todo/features/intro/domain/repositories/intro_repository.dart';

class CheckIntroSeen {
  final IntroRepository introRepository;

  CheckIntroSeen(this.introRepository);

  Future<bool> call() => introRepository.isFirstLaunch();
}
