import 'package:dio/dio.dart';
import 'package:mobx/mobx.dart';

import '../../../core/api/base_response/base_response.dart';
import '../../../core/exceptions/dio_exception_util.dart';
import '../../../core/locator/locator.dart';
import '../../../data/model/response/chat.dart';
import '../../../data/remote/chat_api.dart';

part 'chat_store.g.dart';

class ChatStore = _ChatStore with _$ChatStore;

abstract class _ChatStore with Store {
  final ChatApi chatApi = locator<ChatApi>();

  @observable
  bool isVisible = false;
  @observable
  bool isLoading = false;
  @observable
  bool isLeft = true;

  @observable
  String error = "";
  @observable
  ObservableList<OnlineMember> onlineMemberList = ObservableList();
  @observable
  ObservableList<RecentChat> recentChatList = ObservableList();

  @action
  Future getChatList() async {
    try {
      error = "";
      isLoading = true;
      BaseResponse<Chat> response = await chatApi.getChatList();

      if (response.code == "200") {
        onlineMemberList = ObservableList.of(
          response.data!.onlineMembers as Iterable<OnlineMember>,
        );
        recentChatList = ObservableList.of(
          response.data!.recentChats as Iterable<RecentChat>,
        );
      }
    } on DioException catch (e) {
      error = DioExceptionUtil.handleError(e);
    } catch (e) {
      error = e.toString();
    } finally {
      isLoading = false;
    }
  }
}
