import 'package:built_collection/built_collection.dart';
import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:splasher_flutter/models/app_state.dart';
import 'package:splasher_flutter/models/photo.dart';

class PhotoListConnector extends StatelessWidget {
  final Function(BuildContext context, List<Photo> photos) builder;
  PhotoListConnector({@required this.builder});
  @override
  Widget build(BuildContext context) {
    return StoreConnector<AppState, _ViewModel>(
      converter: (store) => _ViewModel(store.state),
      builder: (context, vm) => builder(context, vm.state.photos.toList()),
    );
  }
}

class _ViewModel {
  AppState state;
  _ViewModel(this.state);
}
