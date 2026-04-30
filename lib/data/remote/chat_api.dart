import 'package:dio/dio.dart';
import 'package:retrofit/retrofit.dart';
import 'package:test_architecture/data/model/response/chat.dart';
import 'package:test_architecture/data/model/response/tasks.dart';

import '../../core/api/base_response/base_response.dart';

part 'chat_api.g.dart';

@RestApi()
abstract class ChatApi {
  factory ChatApi(Dio dio) = _ChatApi;

  @GET("/tasks/chat/recent")
  Future<BaseResponse<Chat>> getChatList();

}
