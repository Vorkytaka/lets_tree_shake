import '../model/bank_profile.dart';

abstract class BankRepository {
  Future<double?> getBalance();

  Future<BankAccount?> getAccount();
}

class BankRepositoryMock implements BankRepository {
  @override
  Future<BankAccount?> getAccount() {
    throw UnimplementedError();
  }

  @override
  Future<double?> getBalance() {
    throw UnimplementedError();
  }
}
