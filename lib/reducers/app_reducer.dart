import 'package:redux/redux.dart';
import 'package:splasher_flutter/actions/actions.dart';
import 'package:splasher_flutter/models/app_state.dart';

final Reducer<AppState> appReducers = combineReducers(
    [TypedReducer<AppState, PhotoLoadedAction>(_onPhotoListLoaded)]);

AppState _onPhotoListLoaded(AppState state, PhotoLoadedAction action) {
  print("from reducers");
  return AppState(isLoading: false);
}
