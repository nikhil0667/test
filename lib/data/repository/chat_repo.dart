import 'package:test_architecture/core/api/base_response/base_response.dart';

import '../model/response/chat.dart';

abstract class ChatRepo {
  Future<BaseResponse<Chat>> getChatList();
}
