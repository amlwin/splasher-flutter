import 'package:built_collection/built_collection.dart';
import 'package:splasher_flutter/models/app_state.dart';
import 'package:splasher_flutter/models/photo.dart';

BuiltList<Photo> photosSelector(AppState appState) => appState.photos;

bool loadingSelector(AppState appState) => appState.isLoading;
