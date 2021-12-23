import 'package:bloc/bloc.dart';
import 'package:flutter/rendering.dart';

class SimpleBlocObserver extends BlocObserver {
  @override
  void onTransition(Bloc bloc, Transition transition) {
    super.onTransition(bloc, transition);
    debugPrint('${bloc.state}');
  }

  @override
  void onError(BlocBase bloc, Object error, StackTrace stackTrace) {
    debugPrint('${bloc.state}');
    debugPrint(error.toString());
    super.onError(bloc, error, stackTrace);
  }
}
