import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:redux/redux.dart';
import 'package:redux_logging/redux_logging.dart';
import 'package:splasher_flutter/actions/actions.dart';
import 'package:splasher_flutter/container/home_page.dart';
import 'package:splasher_flutter/middlewares/middleware.dart';
import 'package:splasher_flutter/models/app_state.dart';
import 'package:splasher_flutter/reducers/app_reducer.dart';

class SplasherApp extends StatelessWidget {
  final Store store = Store<AppState>(
    appReducers,
    middleware: appMiddleware,
  );
  @override
  Widget build(BuildContext context) {
    return StoreProvider<AppState>(
      store: store,
      child: MaterialApp(
        home: HomePage(() =>
            StoreProvider.of<AppState>(context).dispatch(PhotoLoadAction())),
      ),
    );
  }
}
