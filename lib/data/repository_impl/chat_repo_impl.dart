import 'package:test_architecture/core/api/base_response/base_response.dart';
import 'package:test_architecture/data/model/response/chat.dart';
import 'package:test_architecture/data/remote/chat_api.dart';
import 'package:test_architecture/data/repository/chat_repo.dart';

class ChatRepoImpl extends ChatRepo {
  ChatApi chatApi;

  ChatRepoImpl({required this.chatApi});

  @override
  Future<BaseResponse<Chat>> getChatList() async {
    return await chatApi.getChatList();
  }}
