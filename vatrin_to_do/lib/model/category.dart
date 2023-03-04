const String categoryTable = 'category';
final List<Category> defaultCategory = [
  Category(id: 1, name: "Grocery", color: "#CCFF80", icon: "bakery_dining"),
  Category(id: 2, name: "Work", color: "#FF9680", icon: "work"),
  Category(id: 3, name: "Sport", color: "#80FFFF", icon: "sports_soccer"),
  Category(id: 4, name: "Design", color: "#80FFD9", icon: "design_services"),
  Category(id: 5, name: "University", color: "#809CFF", icon: "school"),
  Category(id: 6, name: "Social", color: "#FF80EB", icon: "people"),
  Category(id: 7, name: "Music", color: "#FC80FF", icon: "music_note"),
  Category(id: 8, name: "Health", color: "#80FFA3", icon: "local_hospital"),
  Category(id: 9, name: "Movie", color: "#80D1FF", icon: "movie"),
  Category(id: 10, name: "Home", color: "#FF8080", icon: "home"),
];

class CategoryFields {
  static final List<String> values = [
    id,
    name,
    icon,
    color,
  ];

  static const String id = "_id";
  static const String name = "name";
  static const String icon = "icon";
  static const String color = "color";
}

class Category {
  final int? id;
  final String name;
  final String icon;
  final String color;

  Category(
      {this.id, required this.name, required this.color, required this.icon});

  Category copy({
    int? id,
    String? name,
    String? icon,
    String? color,
  }) =>
      Category(
        id: id ?? this.id,
        name: name ?? this.name,
        color: color ?? this.color,
        icon: icon ?? this.icon,
      );

  static Category fromJson(Map<String, Object?> json) => Category(
        id: json[CategoryFields.id] as int?,
        name: json[CategoryFields.name] as String,
        icon: json[CategoryFields.icon] as String,
        color: json[CategoryFields.color] as String,
      );

  Map<String, Object?> toJson() => {
        CategoryFields.id: id,
        CategoryFields.name: name,
        CategoryFields.icon: icon,
        CategoryFields.color: color,
      };
}
