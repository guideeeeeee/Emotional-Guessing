import 'dart:io';

import 'package:path/path.dart';
import 'package:path_provider/path_provider.dart';
import 'package:sembast/sembast.dart';
import 'package:sembast/sembast_io.dart';

import '../model/replayModel.dart';

class ReplayDB {
  String dbReplay;
  ReplayDB(this.dbReplay);
  Future<Database> openDatabase() async {
    Directory appDirectory = await getApplicationDocumentsDirectory();
    String dbLocation = join(appDirectory.path, dbReplay);
    DatabaseFactory dbFactory = databaseFactoryIo;
    Database db = await dbFactory.openDatabase(dbLocation);
    return db;
  }

  Future<int> InsertData(replayModel statement) async {
    var db = await this.openDatabase();
    var store = intMapStoreFactory.store("expense1");

    //json
    var records = {
      "score": statement.score,
      "date": statement.dateandTime.toIso8601String()
    };
    var KeyID = await store.add(db, records);
    db.close();
    return KeyID;
  }

//ใหม่ไปเก่า false
//เก่าไปใหม่ true
  Future<List<replayModel>> loadAllData() async {
    var db = await this.openDatabase();
    var store = intMapStoreFactory.store("expense1");
    var records = await store.find(db,
        finder: Finder(sortOrders: [SortOrder(Field.key, false)]));
    List<replayModel> dataReplay = [];
    for (var record in records) {
      dataReplay.add(replayModel(/*record["name"] as String,*/
          record["score"] as int, DateTime.parse(record["date"] as String)));
    }
    return dataReplay;
  }

  Future deleteData() async {
    var db = await openDatabase();
    var store = intMapStoreFactory.store("expense1");
    await store.delete(db);
    db.close();
  }
}
