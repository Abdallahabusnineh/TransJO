
import 'package:transjo/core/network/network_model/error_message_model.dart';

class ServerExceptions implements Exception {
  final ErrorMessageModel errorMessageModel;

  ServerExceptions({required this.errorMessageModel});
}
