import 'package:bloc/bloc.dart';
// import 'package:flutter/rendering.dart';

class SimpleBlocObserver extends BlocObserver {
  @override
  // ignore: unnecessary_overrides
  void onTransition(Bloc bloc, Transition transition) {
    super.onTransition(bloc, transition);
  }

  @override
  // ignore: unnecessary_overrides
  void onError(BlocBase bloc, Object error, StackTrace stackTrace) {
    super.onError(bloc, error, stackTrace);
  }
}
