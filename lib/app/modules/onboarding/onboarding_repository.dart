import 'package:hollow/app/modules/onboarding/models.dart';

abstract class OnBoardingRepository{
  Future<UserModel> createAccount(UserModel userModel);
}

// class FakeOnBoardingRepository implements OnBoardingRepository{
//
// }