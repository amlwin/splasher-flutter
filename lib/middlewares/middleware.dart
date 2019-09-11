import 'package:redux/redux.dart';
import 'package:redux_logging/redux_logging.dart';

final List<Middleware> appMiddleware = [LoggingMiddleware.printer()];
