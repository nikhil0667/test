import 'package:hive_ce/hive_ce.dart';

import '../../data/model/response/users.dart';

class HiveService {
  static const _appDbBox = '_appDbBox';
  static const fcmKey = 'fcm_key';
  static const platform = 'platform';
  static final _usersBox = Hive.box<Users>(_appDbBox);

  static void openBox() async {
    await Hive.openBox<Users>(_appDbBox);
  }

  static void addNewUsers(Users users) {
    _usersBox.add(users);
  }

  static List<Users> getAllUsers() {
    return _usersBox.values.toList();
  }

  static Users? getUsers(int index) {
    return _usersBox.getAt(index);
  }

  static void updateUsers(int index, Users users) {
    _usersBox.putAt(index, users);
  }

  static void deleteUsers(int index) {
    _usersBox.deleteAt(index);
  }
}
