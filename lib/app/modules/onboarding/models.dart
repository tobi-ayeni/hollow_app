import 'package:riverpod/riverpod.dart';

class UserModel {
  UserModel(
      {this.id,
      required this.name,
      required this.lastName,
      required this.email,
      required this.phone,
      required this.userName,
      required this.emailAddress,
      required this.password});

  int? id;
  String? name;
  String? lastName;
  String? email;
  String? phone;
  String? userName;
  String? emailAddress;
  String? password;

  @override
  String toString() {
    return 'UserModel{name: $name, lastName: $lastName, email: $email, phone: $phone, userName: $userName, emailAddress: $emailAddress, password: $password}';
  }
}

class ServiceResponse<T> {
  T? data;
  String? message;
  bool success;

  ServiceResponse({this.data, this.message, this.success = false});

  @override
  String toString() {
    return 'ServiceResponse{data: $data, message: $message, success: $success}';
  }
}

final serviceProvider =
    Provider.autoDispose<UserService>((ref) => UserService(ref));

class UserService {
  final ProviderRef ref;

  UserService(this.ref);

  Future<ServiceResponse<UserModel>> createUser(UserModel userModel) {
    userModel.id = DateTime.now().millisecondsSinceEpoch;
    ServiceResponse<UserModel> _response = ServiceResponse(
        data: userModel, success: true, message: "Successfully created user");

    return Future.delayed(const Duration(milliseconds: 800),
        () => Future<ServiceResponse<UserModel>>.value(_response));
  }
}
