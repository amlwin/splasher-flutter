import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:redux/redux.dart';
import 'package:splasher_flutter/models/app_state.dart';

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
        body: StoreConnector<AppState, HomePageViewModel>(
      converter: (Store<AppState> store) {
        return HomePageViewModel(store.state);
      },
      builder: (BuildContext context, HomePageViewModel vm) {
        return showLoading(vm.state.isLoading);
      },
    ));
    /* body: Container(),
    );*/
  }

  Widget showLoading(bool _isLoading) {
    return AnimatedOpacity(
      opacity: _isLoading ? 1.0 : 0.0,
      duration: Duration(milliseconds: 100),
      child: Center(
        child: CircularProgressIndicator(),
      ),
    );
  }
}

class HomePageViewModel {
  final AppState state;

  HomePageViewModel(this.state);
}
