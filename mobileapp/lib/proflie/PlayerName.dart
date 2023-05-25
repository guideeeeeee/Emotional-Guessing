import 'package:flutter/foundation.dart';
import '../record/database/PlayerName_db.dart';

class PlayerName extends ChangeNotifier {
  final PlayerNameDB _playerNameDB;

  PlayerName(String dbName)
      : _playerNameDB = PlayerNameDB(dbName);

  Future<void> savePlayerName(String name) async {
    await _playerNameDB.saveName(name);
    notifyListeners();
  }

  Future<String?> getPlayerName() async {
    final name = await _playerNameDB.getName();
    return name;
  }
}
