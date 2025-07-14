import 'package:nest_loop_mobile/network/api/base/base_error.dart';

class ObjectParseException extends BaseError {
  ObjectParseException();

  @override
  String get message =>
      'We encountered a problem trying to reach the server. We are working to fix it...';
}
