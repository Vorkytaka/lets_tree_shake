import '../model/bank_registration_result.dart';

abstract class BankNavigator {
  Future<BankRegistrationResult> startRegistrationFlow();

  Future<void> openProfile();
}

class BankNavigatorMock implements BankNavigator {
  @override
  Future<void> openProfile() {
    throw UnimplementedError();
  }

  @override
  Future<BankRegistrationResult> startRegistrationFlow() {
    throw UnimplementedError();
  }
}
