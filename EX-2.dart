class BankAccount {
  //TODO
  final int _accID;
  final String _accName;
  double _balance;

  BankAccount({
    required this._accID,
    required this._accName,
    this._balance = 0.0,
  }) {
    // balance();
    // withdraw(100);
    // credit(50);
  }

  //getter for private attributes
  int get accountID => _accID;
  String get accountOwner => _accName;
  double get balance => _balance;

  //withdraw
  withdraw(double amount) {
    if (balance < amount) {
      throw Exception("Insufficient balance for withdrawal!");
    }
    _balance = _balance - amount;
    return _balance;
  }

  //credit
  double credit(double amount) {
    _balance = _balance + amount;
    return _balance;
  }
}

class Bank {
  // TODO
  String name;
  List<BankAccount> bankAccount = [];

  Bank({required this.name}) {
    // createAccount();
  }

  BankAccount createAccount(int accountID, String accountOwner) {
    // declare and set new account to input value
    //then add it to account list
    BankAccount newAccount = BankAccount(
      accID: accountID,
      accName: accountOwner,
    );
    for (BankAccount acc in bankAccount) {
      if (accountID == acc._accID) {
        throw Exception("Account with ID ${accountID} already exists!");
      }
    }

    bankAccount.add(newAccount);
    return newAccount;
  }
}

void main() {
  Bank myBank = Bank(name: "CADT Bank");
  BankAccount ronanAccount = myBank.createAccount(100, 'Ronan');

  print(ronanAccount.balance); // Balance: $0
  ronanAccount.credit(100);
  print(ronanAccount.balance); // Balance: $100
  ronanAccount.withdraw(50);
  print(ronanAccount.balance); // Balance: $50

  try {
    ronanAccount.withdraw(75); // This will throw an exception
  } catch (e) {
    print(e); // Output: Insufficient balance for withdrawal!
  }

  try {
    myBank.createAccount(100, 'Honlgy'); // This will throw an exception
  } catch (e) {
    print(e); // Output: Account with ID 100 already exists!
  }
}
