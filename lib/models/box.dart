import 'package:hive/hive.dart';

import 'hive_model.dart';

class Boxes {
   static Box<HiveModel> gethivebox(){
    return Hive.box<HiveModel>("hivebox");
  }
}