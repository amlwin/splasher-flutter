import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:redux/redux.dart';
import 'package:splasher_flutter/state/app_state.dart';
import 'package:splasher_flutter/state/photo_list_state.dart';

class AppLoading extends StatelessWidget {
  final Function(BuildContext context, bool isLoading) builder;
  AppLoading({@required this.builder});
  @override
  Widget build(BuildContext context) {
    return StoreConnector<AppState, bool>(
      converter: (Store<AppState> store) {
        return isLoadingSelector(store.state.photoListState);
      },
      builder: builder,
    );
  }
}

bool isLoadingSelector(PhotoListState state) {
  return state.isLoading;
}
