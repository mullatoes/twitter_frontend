import 'package:logger/logger.dart';

const String BASE_URL = 'http://localhost:2101';
// final Logger logger = Logger();
final Logger logger = Logger(
  level: Level.debug, // Set the logging level (debug, info, warning, error)
  printer: PrettyPrinter(), // Customize log output format
);
