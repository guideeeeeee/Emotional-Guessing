import 'package:flutter/foundation.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:mobileapp/record/model/replayModel.dart';
class replay with ChangeNotifier{
  List<replayModel> replays =[];

  List<replayModel> getReplay(){
    return replays;
  }
  

  void addReplay(replayModel newReplay){
    replays.add(newReplay);
    notifyListeners();
  }
}