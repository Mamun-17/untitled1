import 'package:flutter/cupertino.dart';
import 'package:hive/hive.dart';
import 'package:untitled1/models/hive_model.dart';

import '../models/box.dart';

class Provider_For_App extends ChangeNotifier{
  late TextEditingController one=TextEditingController();
  late TextEditingController two=TextEditingController();
  late TextEditingController three=TextEditingController();
  late TextEditingController four=TextEditingController();
  List<HiveModel> list=[];

 String addInfo(String infoOne,String infoTwo){
   String res="success";
   try{
     HiveModel hivemodel=HiveModel()
       ..name=infoOne
         ..message=infoTwo;
     Box<HiveModel> box=Boxes.gethivebox();
     box.add(hivemodel);
     print(box.length);
     getinfo();
   }catch(err){
     res=err.toString();
   }
   return res;
 }

 getinfo(){
   list=[];
   notifyListeners();
   Box<HiveModel> box=Boxes.gethivebox();
 list.addAll(box.values);
 notifyListeners();
 }
 void editInfo(String name,String message,HiveModel hive){

 // HiveModel? box=Boxes.gethivebox().getAt(index);
  hive.name=name;
  hive.message=message;
  hive.save();
   getinfo();
 }
  void deleteInfo(int index){
   HiveModel? box=Boxes.gethivebox().getAt(index);
   box?.delete();
   getinfo();
  }

}