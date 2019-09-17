import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:http/http.dart';
import 'package:redux/redux.dart';
import 'package:redux_logging/redux_logging.dart';
import 'package:splasher_flutter/actions/actions.dart';
import 'package:splasher_flutter/middlewares/photo_list_middleware.dart';
import 'package:splasher_flutter/repository/photo_repository.dart';
import 'package:splasher_flutter/state/app_state.dart';
import 'package:splasher_flutter/presentation/home_page.dart';
import 'package:splasher_flutter/reducers/app_reducer.dart';
import 'package:splasher_flutter/repository/photo_repository_impl.dart';

class SplasherApp extends StatelessWidget {
  static final Client _client = Client();
  static final PhotoRepository _repository = PhotoRepositoryImpl(_client);
  final store = Store<AppState>(
    AppReducer(),
    initialState: AppState.initial(),
    middleware: [
      LoggingMiddleware.printer(),
      PhotoListMiddleware(repository: _repository)
    ],
  );

  @override
  Widget build(BuildContext context) {
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
