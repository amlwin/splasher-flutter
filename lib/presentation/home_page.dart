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
import 'package:splasher_flutter/selectors/selector.dart';

class HomePage extends StatefulWidget {
  final void Function() onInit;

  HomePage({@required this.onInit});

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  ScrollController _pagingController;
  @override
  void initState() {
    widget.onInit();
    super.initState();
    _pagingController = ScrollController()
      ..addListener(() {
        if (_pagingController.position.pixels ==
            _pagingController.position.maxScrollExtent) {
          //do pagination here
          print("called pagination");
        }
      });
  }

  @override
  void dispose() {
    super.dispose();
    _pagingController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: StoreConnector<AppState, _ViewModel>(
      converter: (store) => _ViewModel.fromStore(store),
      builder: (context, vm) {
        if (vm.loading) {
          return Center(child: CircularProgressIndicator());
        } else {
          return _buildList(vm.photos);
        }
      },
    ));
  }

  Widget _buildList(BuiltList<Photo> photos) {
    return GridView.builder(
        controller: _pagingController,
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 3, mainAxisSpacing: 3, crossAxisSpacing: 3),
        itemCount: photos.length,
        itemBuilder: (context, index) {
          return InkWell(
            onTap: () {},
            child: Image.network(
              photos[index].urls.small,
              fit: BoxFit.cover,
            ),
          );
        });
  }
}

class _ViewModel {
  final bool loading;
  final BuiltList<Photo> photos;
  _ViewModel({this.loading, this.photos});
  static _ViewModel fromStore(Store<AppState> store) {
    return _ViewModel(
        loading: loadingSelector(store.state),
        photos: photosSelector(store.state));
  }
}
