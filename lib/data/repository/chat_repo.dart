import 'package:test_architecture/core/api/base_response/base_response.dart';

import '../model/response/chat.dart';
import '../model/response/tasks.dart';

abstract class ChatRepo {
  Future<BaseResponse<Chat>> getChatList();
}
