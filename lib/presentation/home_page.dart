import 'package:built_collection/built_collection.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:redux/redux.dart';
import 'package:splasher_flutter/container/app_loading.dart';
import 'package:splasher_flutter/container/photo_connector.dart';
import 'package:splasher_flutter/models/app_state.dart';
import 'package:splasher_flutter/models/photo.dart';
import 'package:splasher_flutter/presentation/loading_indicator.dart';

class HomePage extends StatefulWidget {
  final void Function() onInit;

  HomePage({@required this.onInit});

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  void initState() {
    widget.onInit();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: StoreConnector<AppState, _ViewModel>(
      converter: (store) => _ViewModel(store.state),
      builder: (context, vm) {
        if (vm.state.isLoading) {
          return Center(child: CircularProgressIndicator());
        } else {
          return _buildList(vm.state.photos);
        }
      },
    ));
  }

  Widget _buildList(BuiltList<Photo> photos) {
    return GridView.builder(
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 3, mainAxisSpacing: 2, crossAxisSpacing: 2),
        itemCount: photos.length,
        itemBuilder: (context, index) {
          return Image.network(
            photos[index].urls.small,
            fit: BoxFit.cover,
          );
        });
  }
}

class _ViewModel {
  AppState state;
  _ViewModel(this.state);
}
