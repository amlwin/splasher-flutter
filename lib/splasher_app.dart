import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:http/http.dart';
import 'package:redux/redux.dart';
import 'package:splasher_flutter/actions/actions.dart';
import 'package:splasher_flutter/container/home_page.dart';
import 'package:splasher_flutter/middlewares/middleware.dart';
import 'package:splasher_flutter/models/app_state.dart';
import 'package:splasher_flutter/reducers/app_reducer.dart';
import 'package:splasher_flutter/repository/photo_repository_impl.dart';

class SplasherApp extends StatelessWidget {
  /*static final Client _client = Client();
  static final PhotoRepository _repository = PhotoRepositoryImpl(_client);*/
  final store = Store<AppState>(
    appReducers,
    initialState: AppState.loading(),
    middleware: appMiddleware(PhotoRepositoryImpl(Client())),
  );

  @override
  Widget build(BuildContext context) {
    print("store type is $store and type is ${store.state}");
    return StoreProvider(
      store: store,
      child: MaterialApp(
        routes: {
          '/': (context) {
            return HomePage(
              onInit: () {
                StoreProvider.of<AppState>(context).dispatch(PhotoLoadAction());
              },
            );
          }
        },
      ),
    );
  }
}
