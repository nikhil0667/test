import 'package:auto_route/auto_route.dart';
import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:test_architecture/data/model/response/chat.dart';
import 'package:test_architecture/ui/chat/store/chat_store.dart';
import 'package:test_architecture/widget/profile_section.dart';

import '../../core/locator/locator.dart';
import '../../data/model/response/user.dart';
import '../../util/app_image.dart';
import '../../values/colors.dart';
import '../auth/store/auth_store.dart';

@RoutePage()
class ChatPage extends StatefulWidget {
  const ChatPage({super.key});

  @override
  State<ChatPage> createState() => _ChatPageState();
}

class _ChatPageState extends State<ChatPage> {
  final chatStore = locator<ChatStore>();
  final authStore = locator<AuthStore>();

  @override
  void initState() {
    chatStore.getChatList();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final User? user = authStore.user?.data;
    return Scaffold(
      backgroundColor: AppColor.white,
      body: Observer(
        builder: (context) {
          return Column(
            children: [40.verticalSpace, _onlineMember(user!), _recentChat()],
          );
        },
      ),
    );
  }

  Widget _recentChat() {
    return Expanded(
      child: roundedContainer(
        padding: EdgeInsets.all(20),
        width: double.infinity,
        color: Colors.black,
        radius: BorderRadius.only(
          topLeft: Radius.circular(50),
          topRight: Radius.circular(50),
        ),
        child: Column(
          children: [
            Expanded(
              child: ListView.builder(
                itemCount: chatStore.recentChatList.length,
                shrinkWrap: true,
                itemBuilder: (context, index) {
                  var chat = chatStore.recentChatList[index];
                  return ListTile(
                    leading: Badge(
                      offset: Offset(-2, -14),
                      backgroundColor: Colors.transparent,
                      label: Icon(
                        Icons.circle,
                        color: chat.isOnline! ? Colors.red : Colors.green,
                        size: 12,
                      ),
                      alignment: .bottomRight,
                      child: ClipOval(
                        child: Image.network(
                          chat.avatar!,
                          width: 53,
                          height: 53,
                          fit: BoxFit.fill,
                        ),
                      ),
                    ),
                    title: Text(
                      chat.name!,
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                      ),
                    ),
                    subtitle: Row(
                      spacing: 5,
                      children: [
                        Icon(Icons.done, color: Colors.green, size: 20),
                        //Api seen not send to default set green Color
                        Expanded(
                          child: Text(
                            chat.lastMessage!,
                            maxLines: 1,
                            overflow: TextOverflow.ellipsis,
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              color: Colors.grey,
                            ),
                          ),
                        ),
                      ],
                    ),
                    trailing: Column(
                      spacing: 5,
                      children: [
                        chat.unreadCount! > 0
                            ? roundedContainer(
                                padding: .symmetric(
                                  horizontal: 7,
                                  vertical: 2.5,
                                ),
                                color: Colors.green,
                                child: Text(
                                  chat.unreadCount!.toString(),
                                  style: TextStyle(color: AppColor.black),
                                ),
                              )
                            : SizedBox(height: 0, width: 0),
                        Text(
                          chat.time!,
                          style: TextStyle(color: AppColor.grey),
                        ),
                      ],
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _horizontalList() {
    return ListView.builder(
      scrollDirection: Axis.horizontal,
      itemCount: chatStore.onlineMemberList.length,
      itemBuilder: (context, index) {
        OnlineMember onlineMember = chatStore.onlineMemberList[index];
        return Row(
          children: [
            index == 0
                ? Padding(
                    padding: const EdgeInsets.all(5.0),
                    child: Column(
                      children: [
                        Container(
                          width: 70,
                          height: 70,

                          alignment: Alignment.center,
                          clipBehavior: Clip.hardEdge,
                          decoration: BoxDecoration(
                            image: DecorationImage(
                              image: AssetImage(AppImage.backgroundImage),
                              fit: BoxFit.fill,
                            ),

                            borderRadius: BorderRadiusGeometry.circular(50),
                          ),
                          child: DottedBorder(
                            options: RoundedRectDottedBorderOptions(
                              padding: const EdgeInsets.all(15),
                              color: Colors.black,
                              strokeWidth: 2,
                              dashPattern: [2, 2],
                              radius: Radius.circular(100),
                            ),

                            child: Icon(
                              Icons.add,
                              size: 30,
                              color: Colors.black,
                            ),
                          ),
                        ),
                        5.verticalSpace,
                        Text(
                          "Add",
                          style: const TextStyle(
                            color: Colors.grey,
                            fontWeight: FontWeight.w400,
                          ),
                        ),
                        Text(
                          "Chat",
                          style: const TextStyle(
                            color: Colors.black,
                            fontWeight: FontWeight.w400,
                          ),
                        ),
                      ],
                    ),
                  )
                : SizedBox(height: 0, width: 0),

            Padding(
              padding: const EdgeInsets.all(5.0),
              child: Column(
                spacing: 5,
                children: [
                  Badge(
                    offset: Offset(-5, -15),
                    backgroundColor: Colors.transparent,
                    label: Icon(Icons.circle, color: Colors.green, size: 12),
                    alignment: .bottomRight,
                    child: Container(
                      width: 70,
                      height: 70,
                      clipBehavior: Clip.hardEdge,
                      decoration: BoxDecoration(
                        image: DecorationImage(
                          image: NetworkImage(onlineMember.avatar!),
                          fit: BoxFit.fill,
                        ),
                        borderRadius: BorderRadiusGeometry.circular(50),
                      ),
                    ),
                  ),
                  Text(
                    onlineMember.name ?? "",
                    style: const TextStyle(
                      color: Colors.black,
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                ],
              ),
            ),
          ],
        );
      },
    );
  }

  Widget _onlineMember(User user) {
    return Column(
      children: [
        ProfileSection(),

        SizedBox(height: 150, child: _horizontalList()),
      ],
    );
  }

  Widget roundedContainer({
    EdgeInsetsGeometry? padding,
    double? width,
    double? height,
    Widget? child,
    Color? color,
    BorderRadius? radius,
    double? borderRadius,
  }) {
    return Container(
      width: width,
      padding: padding,
      height: height,
      clipBehavior: Clip.hardEdge,
      decoration: BoxDecoration(
        color: color,

        borderRadius: radius ?? BorderRadius.circular(borderRadius ?? 100),
      ),

      child: child,
    );
  }
}
