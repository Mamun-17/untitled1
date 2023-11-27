import 'package:flutter/material.dart';

 Future bottomsheet(BuildContext cont,
     TextEditingController controlOne,
     TextEditingController controlTwo,
     Function func
     ){
  return showModalBottomSheet(
      context: cont,
      builder: (cont){
        return Padding(
          padding: const EdgeInsets.only(left: 20,right: 20,top: 30),
          child: Column(
            children: [
              SizedBox(height: 20,),
              TextField(
                controller: controlOne,
                decoration: InputDecoration(
                  border: OutlineInputBorder()

                ),
              ),
              SizedBox(height: 20,),

              TextField(
                controller: controlTwo,
                  decoration: InputDecoration(
                    border: OutlineInputBorder()
                  ),
                ),
             SizedBox(
               height: 20,
             ),

              ElevatedButton(onPressed: (){
                func;
              }, child: Text("add"))
            ],
          ),
        );
      });


}