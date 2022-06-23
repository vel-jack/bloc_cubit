import 'dart:async';
import 'package:uuid/uuid.dart';
import 'models/model.dart';

class UserRepository {
  User? _user;

  Future<User?> getUser() async {
    if (_user != null) return _user;
    return Future.delayed(
        Duration(seconds: 1), () => _user = User(Uuid().v4()));
  }
}
