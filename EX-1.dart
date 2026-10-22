enum Skill { FLUTTER, DART, OTHER }

class Employee {
  // Make all attribute private
  String _name;
  double _baseSalary;
  late Skill _skill;
  late Address _address;
  late int _yearOfExperience;

  // getter to access private attribute
  String get name => _name;
  double get baseSalary => _baseSalary;
  Skill get skill => _skill;
  Address get address => _address;
  int get yearOfExperience => _yearOfExperience;

  Employee(this._name, this._baseSalary);
  //named constructor
  Employee.flutterDeveloper(
    this._name,
    this._baseSalary,
    this._address,
    this._skill,
    this._yearOfExperience,
  );

  void printDetails() {
    print('Employee: $_name, Base Salary: \$${_baseSalary}');
  }

  //Compute the salary acording to skill
  double computeSalary() {
    double totalSalary = _baseSalary;
    totalSalary += _yearOfExperience * 2000;
    if (_skill == Skill.FLUTTER) {
      totalSalary += 5000;
    } else if (_skill == Skill.DART) {
      totalSalary += 3000;
    } else {
      totalSalary += 1000;
    }
    return totalSalary;
  }
}

// Add address class
class Address {
  final String street;
  final String city;
  final String zipCode;

  Address(this.street, this.city, this.zipCode);
}

void main() {
  Address address = Address("6A", "Phnom Penh", "111000");
  var emp1 = Employee('Sokea', 40000);
  emp1.printDetails();

  var emp2 = Employee('Ronan', 45000);
  emp2.printDetails();
  emp2.printDetails();

  var emp3 = Employee.flutterDeveloper(
    "Nika",
    30000,
    address,
    Skill.FLUTTER,
    2,
  );
  emp3.printDetails();
  double salary = emp3.computeSalary();
  print("Salary: \$${salary}");
}
