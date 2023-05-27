import 'dart:io';
import 'package:path/path.dart';
import 'package:path_provider/path_provider.dart';
import 'package:sembast/sembast.dart';
import 'package:sembast/sembast_io.dart';

class PlayerNameDB {
  String dbPlayerName;

  PlayerNameDB(this.dbPlayerName);

  Future<Database> openDatabase() async {
    Directory appDirectory = await getApplicationDocumentsDirectory();
    String dbLocation = join(appDirectory.path, dbPlayerName);
    DatabaseFactory dbFactory = databaseFactoryIo;
    Database db = await dbFactory.openDatabase(dbLocation);
    return db;
  }

  Future<void> saveName(String name) async {
    print("message from PlayerName_DB RECEIVED : $name");
  final database = await openDatabase();
  final store = stringMapStoreFactory.store('namestore');

  final data = {'name': name}; // Wrap name in a Map

  await store.record('name').put(database, data); // Pass the data Map

  await database.close();
}

  Future<String?> getName() async {
    final database = await openDatabase();
    final store = stringMapStoreFactory.store('namestore');

    final nameData = await store.record('name').get(database);
    final name = nameData != null ? nameData['name'] as String? : null;
    await database.close();

    return name;
  }
}