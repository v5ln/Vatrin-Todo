import 'package:sqflite/sqflite.dart';
// ignore: depend_on_referenced_packages
import 'package:path/path.dart';
import 'package:vatrin_to_do/model/category.dart';
import 'package:vatrin_to_do/model/task.dart';

class Services {
  static final Services instance = Services._init();
  static Database? _database;

  Services._init();
  Future<Database> get database async {
    if (_database != null) {
      return _database!;
    }
    _database = await _initDB("tasks.db");
    return _database!;
  }

  Future<Database> _initDB(String filePath) async {
    final dbPath = await getDatabasesPath();
    final path = join(dbPath, filePath);
    return await openDatabase(path, version: 1, onCreate: _createDB);
  }

  Future _createDB(Database db, int version) async {
    const idType = 'INTEGER PRIMARY KEY AUTOINCREMENT';
    const textType = 'TEXT NOT NULL';
    const boolType = 'BOOLEAN NOT NULL';

    await db.execute('''
CREATE TABLE $categoryTable ( 
  ${CategoryFields.id} $idType, 
  ${CategoryFields.name} $textType,
  ${CategoryFields.icon} $textType,
  ${CategoryFields.color} $textType,
  )
''');

    for (var category in defaultCategory) {
      createCategory(category);
    }

    await db.execute('''
CREATE TABLE $taskTable ( 
  ${TaskFields.id} $idType, 
  ${TaskFields.name} $textType,
  ${TaskFields.description} $textType,
  ${TaskFields.isChecked} $boolType,
  ${TaskFields.date} $textType,
  FOREIGN KEY (${TaskFields.categoryId}) REFERENCES $categoryTable(${TaskFields.categoryId})
  )
''');
  }

  Future<Task> createTask(Task task) async {
    final db = await instance.database;

    final id = await db.insert(taskTable, task.toJson());
    return task.copy(id: id);
  }

  Future<Task?> readTask(int id) async {
    final db = await instance.database;

    final maps = await db.query(
      taskTable,
      columns: TaskFields.values,
      where: '${TaskFields.id} = ?',
      whereArgs: [id],
    );

    if (maps.isNotEmpty) {
      return Task.fromJson(maps.first);
    } else {
      return null;
    }
  }

  Future<List<Task>> readAllTask() async {
    final db = await instance.database;

    const orderBy = '${TaskFields.date} ASC';

    final result = await db.query(taskTable, orderBy: orderBy);

    return result.map((json) => Task.fromJson(json)).toList();
  }

  Future<int> updateTask(Task task) async {
    final db = await instance.database;
    return db.update(
      taskTable,
      task.toJson(),
      where: '${TaskFields.id} = ?',
      whereArgs: [task.id],
    );
  }

  Future<int> deleteTask(int id) async {
    final db = await instance.database;
    return await db.delete(
      taskTable,
      where: '${TaskFields.id} = ?',
      whereArgs: [id],
    );
  }

  Future<Category> createCategory(Category category) async {
    final db = await instance.database;

    final id = await db.insert(taskTable, category.toJson());
    return category.copy(id: id);
  }

  Future<Category?> readCategory(int id) async {
    final db = await instance.database;

    final maps = await db.query(
      taskTable,
      columns: CategoryFields.values,
      where: '${CategoryFields.id} = ?',
      whereArgs: [id],
    );

    if (maps.isNotEmpty) {
      return Category.fromJson(maps.first);
    } else {
      return null;
    }
  }

  Future<List<Category>> readAllCategory() async {
    final db = await instance.database;

    const orderBy = '${CategoryFields.id} ASC';

    final result = await db.query(categoryTable, orderBy: orderBy);

    return result.map((json) => Category.fromJson(json)).toList();
  }

  Future close() async {
    final db = await instance.database;
    db.close();
  }
}
