import 'package:todo/features/intro/data/datasources/intro_local_datasource.dart';
import 'package:todo/features/intro/domain/repositories/intro_repository.dart';

class IntroRepositoryImpl implements IntroRepository {
  final IntroLocalDatasource localDatasource;
  IntroRepositoryImpl(this.localDatasource);

  @override
  Future<void> completeIntro() => localDatasource.completeIntro();

  @override
  Future<bool> isFirstLaunch() => localDatasource.isFirstLaunch();
}
