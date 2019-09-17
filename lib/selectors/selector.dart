import 'package:built_collection/built_collection.dart';
import 'package:splasher_flutter/state/app_state.dart';
import 'package:splasher_flutter/models/photo.dart';
import 'package:splasher_flutter/state/photo_list_state.dart';

BuiltList<Photo> photosSelector(PhotoListState appState) => appState.photos;

bool loadingSelector(PhotoListState appState) => appState.isLoading;
