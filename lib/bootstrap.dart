import 'dart:async';

import 'package:flutter/foundation.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:logger/logger.dart';

Future<void> bootstrap(FutureOr<Widget> Function() builder) async {
  var logger = Logger();
  FlutterError.onError = (details) {
    logger.d(details.exception.toString(), stackTrace: details.stack);
  };

  PlatformDispatcher.instance.onError = (error, stack) {
    logger.e('Uncaught error: $error', stackTrace: stack);
  };

  final appBuilder = await builder();

  // Bloc.observer =
}

class MyBlocObserver extends BlocObserver {
  @override
  void onEvent(Bloc bloc, Object? event) {
    super.onEvent(bloc, event);
  }

  @override
  void onError(BlocBase bloc, Object error, StackTrace stackTrace) {
    super.onError(bloc, error, stackTrace);
  }

  @override
  void onChange(BlocBase bloc, Change change) {
    super.onChange(bloc, change);
  }

  @override
  void onTransition(Bloc bloc, Transition transition) {
    super.onTransition(bloc, transition);
  }
}
