import 'package:redux/redux.dart';
import 'package:splasher_flutter/reducers/photo_list_reducer.dart';
import 'package:splasher_flutter/state/app_state.dart';

/*final Reducer<PhotoListState> appReducers = combineReducers([
  TypedReducer<PhotoListState, PhotoLoadedAction>(_onPhotoListLoaded),
  TypedReducer<PhotoListState, PhotoLoadFailedAction>(_onPhotoListLoadFailed)
]);

PhotoListState _onPhotoListLoaded(
    PhotoListState state, PhotoLoadedAction action) {
  return PhotoListState(isLoading: false, photos: action.photos);
}

PhotoListState _onPhotoListLoadFailed(
    PhotoListState state, PhotoLoadFailedAction action) {
  return PhotoListState(isLoading: false, photos: BuiltList.from([]));
}*/

class AppReducer extends ReducerClass<AppState> {
  @override
  AppState call(AppState state, action) {
    return AppState(photoListReducer(state.photoListState, action));
  }
}
