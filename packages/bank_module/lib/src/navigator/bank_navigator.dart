import 'package:bank_contract/bank_contract.dart';

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
