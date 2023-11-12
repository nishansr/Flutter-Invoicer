class JsonData {
  final Map<String, dynamic> customer;
  final DateTime date;
  final List<Map<String, dynamic>> items;
  final double sum;

  JsonData({
    required this.customer,
    required this.date,
    required this.items,
    required this.sum,
  });
}
