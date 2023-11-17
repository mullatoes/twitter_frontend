import 'package:logger/logger.dart';

const String BASE_URL = 'http://192.168.100.8:2101/api/users';
// final Logger logger = Logger();
final Logger logger = Logger(
  level: Level.debug, // Set the logging level (debug, info, warning, error)
  printer: PrettyPrinter(), // Customize log output format
);
