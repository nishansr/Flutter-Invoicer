class Customer {
  final String name;
  final String address;

  Customer({
    required this.name,
    required this.address,
  });

  Map<String, dynamic> toJson() {
    return {
      'name': name,
      'address': address,
    };
  }
}
