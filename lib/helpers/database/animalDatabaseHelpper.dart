import 'package:fire_base_second/helpers/animal_api_helper.dart';
import 'package:fire_base_second/models/animal.dart';
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

class AnimalDBHelper {
  AnimalDBHelper._();

  static final AnimalDBHelper animalDBHelper = AnimalDBHelper._();

  String tableName = "animal";

  String colName = "name";
  String colImage = "image";
  String colLocation = "location";
  String colCommonName = "commonName";
  String colHeight = "height";
  String colWeight = "weight";
  String colTopSpeed = "topSpeed";
  String colMostDistinctiveFeature = "mostDistinctiveFeature";

  Database? db;
  List<String> animalName = [
    "Dog",
    "Cat",
    "Kangaroo",
    "Snake",
  ];

  Future<Database> initDatabase() async {
    var db = await openDatabase("myDb.db");

    String dataBasePath = await getDatabasesPath();

    String path = join(dataBasePath, "myDB.db");

    db = await openDatabase(
      path,
      version: 1,
      onCreate: (Database db, int vision) async {
        await db.execute(
            "CREATE TABLE IF NOT EXISTS $tableName($colName TEXT,$colLocation TEXT,$colCommonName TEXT,$colTopSpeed TEXT,$colMostDistinctiveFeature TEXT,$colHeight TEXT,$colWeight TEXT,$colImage BLOB);");
      },
    );
    return db;
  }

  Future<int> insertData(
      {required List<Animal?> animal, required List<String> image}) async {
    db = await initDatabase();
    //log(allQuotes.toString(),name: "all Quotes");
    int res = 0;

    for (int i = 0; i < animalName.length; i++) {
      animal.add(await AnimalHelper.animalHelper
          .fetchAnimalData(animalName: animalName[i]));
    }

    for (int i = 0; i < animal.length; i++) {
      String query =
          "INSERT INTO $tableName($colName,$colMostDistinctiveFeature,$colTopSpeed,$colCommonName,$colLocation,$colHeight,$colWeight,$colImage) VALUES (?,?,?,?,?,?,?,?);";
      List args = [
        animal[i]!.name,
        animal[i]!.DistinctiveFeature,
        animal[i]!.topSpeed,
        animal[i]!.commonName,
        animal[i]!.location,
        animal[i]!.height,
        animal[i]!.weight,
        image[i]
      ];
      res = await db!.rawInsert(query, args);
    }
    return res;
  }

  Future<List<Animal>> fetchAllData() async {
    db = await initDatabase();

    String query = "SELECT * FROM $tableName";

    List<Map<String, dynamic>> res = await db!.rawQuery(query);

    List<Animal> animalData =
        res.map((e) => Animal.fromDatabase(data: e)).toList();

    return animalData;
  }

  Future<List<Animal>> searchData({required String val}) async {
    db = await initDatabase();

    String query = "SELECT * FROM $tableName WHERE $colName LIKE '%$val%';";

    List<Map<String, dynamic>> res = await db!.rawQuery(query);

    List<Animal> searchedAnimalData =
        res.map((e) => Animal.fromDatabase(data: e)).toList();

    return searchedAnimalData;
  }

  Future<int> deleteAllData() async {
    db = await initDatabase();

    String query = "DELETE FROM $tableName";

    return await db!.rawDelete(query);
  }
}
