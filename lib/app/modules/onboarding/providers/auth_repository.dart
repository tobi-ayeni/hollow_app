class AuthRepository {
  Future<void> login() async {
    await Future.delayed(const Duration(seconds: 3));
    // throw Exception('failed log in');
  }
}