import 'package:fire_base_second/main.dart';
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

class SubscriptionDBHelper {
  SubscriptionDBHelper._();

  static final SubscriptionDBHelper subscriptionDBHelper =
      SubscriptionDBHelper._();

  String subTable1 = "sub1";
  String subTable2 = "sub2";
  String subTable3 = "sub3";
  String subTable4 = "sub4";

  String sub1ColId = "id";
  String sub1ColName = "name";
  String sub1ColPrice = "price";
  String sub1ColImage = "image";

  String sub2ColId = "id";
  String sub2ColName = "name";
  String sub2ColPrice = "price";
  String sub2ColImage = "image";

  String sub3ColId = "id";
  String sub3ColName = "name";
  String sub3ColPrice = "price";
  String sub3ColImage = "image";

  String sub4ColId = "id";
  String sub4ColName = "name";
  String sub4ColPrice = "price";
  String sub4ColImage = "image";
  Database? db;

  Future<Database> initDatabase1() async {
    var db = await openDatabase("myDbS.db");

    String dataBasePath = await getDatabasesPath();

    String path = join(dataBasePath, "myDBS.db");

    db = await openDatabase(
      path,
      version: 1,
      onCreate: (Database db, int vision) async {
        await db.execute(
            "CREATE TABLE IF NOT EXISTS $subTable1($sub1ColId TEXT,$sub1ColName TEXT,$sub1ColPrice TEXT,$sub1ColImage BLOB);");
      },
    );
    return db;
  }

  Future<Database> initDatabase2() async {
    var db = await openDatabase("myDbS2.db");

    String dataBasePath = await getDatabasesPath();

    String path = join(dataBasePath, "myDBS2.db");

    db = await openDatabase(
      path,
      version: 1,
      onCreate: (Database db, int vision) async {
        await db.execute(
            "CREATE TABLE IF NOT EXISTS $subTable2($sub2ColId TEXT,$sub2ColName TEXT,$sub2ColPrice TEXT,$sub2ColImage BLOB);");
      },
    );
    return db;
  }

  Future<Database> initDatabase3() async {
    var db = await openDatabase("myDbS3.db");

    String dataBasePath = await getDatabasesPath();

    String path = join(dataBasePath, "myDBS3.db");

    db = await openDatabase(
      path,
      version: 1,
      onCreate: (Database db, int vision) async {
        await db.execute(
            "CREATE TABLE IF NOT EXISTS $subTable3($sub3ColId TEXT,$sub3ColName TEXT,$sub3ColPrice TEXT,$sub3ColImage BLOB);");
      },
    );
    return db;
  }

  Future<Database> initDatabase4() async {
    var db = await openDatabase("myDbS4.db");

    String dataBasePath = await getDatabasesPath();

    String path = join(dataBasePath, "myDBS4.db");

    db = await openDatabase(
      path,
      version: 1,
      onCreate: (Database db, int vision) async {
        await db.execute(
            "CREATE TABLE IF NOT EXISTS $subTable4($sub4ColId TEXT,$sub4ColName TEXT,$sub4ColPrice TEXT,$sub4ColImage BLOB);");
      },
    );
    return db;
  }

  Future<int> insertData1() async {
    db = await initDatabase1();
    String query =
        "INSERT INTO $subTable1($sub1ColId,$sub1ColName,$sub1ColPrice,$sub1ColImage) VALUES (?,?,?,?);";
    List args = ["1", "Week\nSubscription", "\$1.99", animalPic[1]];

    return await db!.rawInsert(query, args);
  }

  Future<int> insertData2() async {
    db = await initDatabase2();
    String query =
        "INSERT INTO $subTable2($sub2ColId,$sub2ColName,$sub2ColPrice,$sub2ColImage) VALUES (?,?,?,?);";
    List args = ["2", "1 Month\nSubscription", "\$4.39", animalPic[2]];

    return await db!.rawInsert(query, args);
  }

  Future<int> insertData3() async {
    db = await initDatabase3();
    String query =
        "INSERT INTO $subTable3($sub3ColId,$sub3ColName,$sub3ColPrice,$sub3ColImage) VALUES (?,?,?,?);";
    List args = ["3", "3 Month\nSubscription", "\$9.99", animalPic[3]];

    return await db!.rawInsert(query, args);
  }

  Future<int> insertData4() async {
    db = await initDatabase4();
    String query =
        "INSERT INTO $subTable4($sub4ColId,$sub4ColName,$sub4ColPrice,$sub4ColImage) VALUES (?,?,?,?);";
    List args = ["4", "6 Month\nSubscription", "\$13.50", animalPic[1]];

    return await db!.rawInsert(query, args);
  }

  Future fetchAllData1() async {
    db = await initDatabase1();

    String query = "SELECT * FROM $subTable1";

    return await db!.rawQuery(query);
  }

  Future<List> fetchAllData2() async {
    db = await initDatabase2();

    String query = "SELECT * FROM $subTable2";

    return await db!.rawQuery(query);
  }

  Future<List> fetchAllData3() async {
    db = await initDatabase3();

    String query = "SELECT * FROM $subTable3";

    return await db!.rawQuery(query);
  }

  Future<List> fetchAllData4() async {
    db = await initDatabase4();

    String query = "SELECT * FROM $subTable4";

    return await db!.rawQuery(query);
  }

  Future<int> deleteAllData1() async {
    db = await initDatabase1();

    String query = "DELETE FROM $subTable1";

    return await db!.rawDelete(query);
  }

  Future<int> deleteAllData2() async {
    db = await initDatabase2();

    String query = "DELETE FROM $subTable2";

    return await db!.rawDelete(query);
  }

  Future<int> deleteAllData3() async {
    db = await initDatabase3();

    String query = "DELETE FROM $subTable3";

    return await db!.rawDelete(query);
  }

  Future<int> deleteAllData4() async {
    db = await initDatabase4();

    String query = "DELETE FROM $subTable4";

    return await db!.rawDelete(query);
  }
}
