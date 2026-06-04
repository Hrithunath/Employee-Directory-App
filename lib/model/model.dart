class Employee {
  final int id;
  final String name;
  final String email;
  final String phone;
  final String companyName;
  final String address;

  Employee({
    required this.id,
    required this.name,
    required this.email,
    required this.phone,
    required this.companyName,
    required this.address,
  });

  factory Employee.fromJson(Map<String, dynamic> json) {
    final addressMap = json['address'] as Map<String, dynamic>;
    final street = addressMap['street'] as String;
    final suite = addressMap['suite'] as String;
    final city = addressMap['city'] as String;
    final zipcode = addressMap['zipcode'] as String;
    final companyMap = json['company'] as Map<String, dynamic>;
    return Employee(
      id: json['id'] as int,
      name: json['name'] as String,
      email: json['email'] as String,
      phone: json['phone'] as String,
      companyName: companyMap['name'] as String,
      address: '$street, $suite, $city, $zipcode',
    );
  }
}
