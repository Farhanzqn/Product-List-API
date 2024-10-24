class Product {
  final int id;
  final String name;
  final int year;
  final String color;
  final String pantoneValue;

  Product({
    required this.id,
    required this.name,
    required this.year,
    required this.color,
    required this.pantoneValue,
  });

  factory Product.fromJson(Map<String, dynamic> json) {
    return Product(
      id: json['id'] as int,
      name: json['name'] ?? 'No Name',
      year: json['year'] as int,
      color: json['color'] ?? '#FFFFFF',
      pantoneValue: json['pantone_value'] ?? 'Unknown',
    );
  }
}
