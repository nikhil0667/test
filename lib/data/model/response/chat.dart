

class Chat {
  List<OnlineMember>? onlineMembers;
  List<RecentChat>? recentChats;

  Chat({this.onlineMembers, this.recentChats});

  factory Chat.fromJson(Map<String, dynamic> json) => Chat(
    onlineMembers: json["online_members"] == null
        ? []
        : List<OnlineMember>.from(
            json["online_members"]!.map((x) => OnlineMember.fromJson(x)),
          ),
    recentChats: json["recent_chats"] == null
        ? []
        : List<RecentChat>.from(
            json["recent_chats"]!.map((x) => RecentChat.fromJson(x)),
          ),
  );

  Map<String, dynamic> toJson() => {
    "online_members": onlineMembers == null
        ? []
        : List<dynamic>.from(onlineMembers!.map((x) => x.toJson())),
    "recent_chats": recentChats == null
        ? []
        : List<dynamic>.from(recentChats!.map((x) => x.toJson())),
  };
}

class OnlineMember {
  int? id;
  String? name;
  String? avatar;
  bool? isOnline;

  OnlineMember({this.id, this.name, this.avatar, this.isOnline});

  factory OnlineMember.fromJson(Map<String, dynamic> json) => OnlineMember(
    id: json["id"],
    name: json["name"],
    avatar: json["avatar"],
    isOnline: json["is_online"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "name": name,
    "avatar": avatar,
    "is_online": isOnline,
  };
}

class RecentChat {
  int? userId;
  String? name;
  String? avatar;
  String? lastMessage;
  String? time;
  int? unreadCount;
  bool? isOnline;

  RecentChat({
    this.userId,
    this.name,
    this.avatar,
    this.lastMessage,
    this.time,
    this.unreadCount,
    this.isOnline,
  });

  factory RecentChat.fromJson(Map<String, dynamic> json) => RecentChat(
    userId: json["user_id"],
    name: json["name"],
    avatar: json["avatar"],
    lastMessage: json["last_message"],
    time: json["time"],
    unreadCount: json["unread_count"],
    isOnline: json["is_online"],
  );

  Map<String, dynamic> toJson() => {
    "user_id": userId,
    "name": name,
    "avatar": avatar,
    "last_message": lastMessage,
    "time": time,
    "unread_count": unreadCount,
    "is_online": isOnline,
  };
}
