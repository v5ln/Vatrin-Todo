const String taskTable = 'tasks';

class TaskFields {
  static final List<String> values = [
    id,
    name,
    description,
    date,
    isChecked,
    categoryId
  ];

  static const String id = "_id";
  static const String name = "name";
  static const String description = "description";
  static const String date = "date";
  static const String isChecked = "isChecked";
  static const String categoryId = "categoryId";
}

class Task {
  final int? id;
  final String name;
  final String description;
  final DateTime date;
  final bool isChecked;
  final int categoryId;

  const Task(
      {this.id,
      required this.name,
      required this.date,
      required this.isChecked,
      required this.categoryId,
      required this.description});

  Task copy(
          {int? id,
          String? name,
          String? description,
          DateTime? date,
          bool? isChecked,
          int? categoryId}) =>
      Task(
        id: id ?? this.id,
        name: name ?? this.name,
        description: description ?? this.description,
        date: date ?? this.date,
        isChecked: isChecked ?? this.isChecked,
        categoryId: categoryId ?? this.categoryId,
      );

  static Task fromJson(Map<String, Object?> json) => Task(
        id: json[TaskFields.id] as int?,
        isChecked: json[TaskFields.isChecked] == 1,
        categoryId: json[TaskFields.categoryId] as int,
        name: json[TaskFields.name] as String,
        description: json[TaskFields.description] as String,
        date: DateTime.parse(json[TaskFields.date] as String),
      );

  Map<String, Object?> toJson() => {
        TaskFields.id: id,
        TaskFields.name: name,
        TaskFields.description: description,
        TaskFields.date: date.toIso8601String(),
        TaskFields.isChecked: isChecked ? 1 : 0,
        TaskFields.categoryId: categoryId,
      };
}
