import 'dart:async';

enum AuthState { unknown, authendicated, unauthendicated }

class AuthRepository {
  final _controller = StreamController<AuthState>();

  Stream<AuthState> get state async* {
    await Future.delayed(Duration(seconds: 1));
    yield AuthState.unauthendicated;
    yield* _controller.stream;
  }

  Future<void> login(
      {required String username, required String password}) async {
    await Future.delayed(Duration(milliseconds: 100),
        () => _controller.add(AuthState.authendicated));
  }

  void logOut() {
    _controller.add(AuthState.unauthendicated);
  }

  void dispose() => _controller.close();
}
