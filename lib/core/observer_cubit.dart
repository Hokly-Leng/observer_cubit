import 'package:bloc/bloc.dart';
import 'package:flutter/cupertino.dart';

class ObserverCubit extends Cubit<int> {
  ObserverCubit({this.initailData = 0}) : super(initailData);
  int initailData;

  int? currentData;
  int? nextData;

  void increment() {
    emit(state + 1);
  }

  void decrement() {
    emit(state - 1);
  }

  @override
  void onChange(Change<int> change) {
    super.onChange(change);
    debugPrint('$change');
    currentData = change.currentState;
    nextData = change.nextState;
    debugPrint('Current: $currentData');
    debugPrint('Next: $nextData');
  }

  @override
  void onError(Object error, StackTrace stackTrace) {
    super.onError(error, stackTrace);
    debugPrint('Error: $error, $stackTrace');
  }
}
