 import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

Future dialogue(BuildContext context,TextEditingController contolone,TextEditingController controltwo){
  return showDialog(context: context, builder: (context)
  {
    return AlertDialog(
      title: Text("edit "),
      content: Container(
        height: 300,
        child: Column(
          children: [
            TextField(
              controller: contolone,
              decoration: InputDecoration(
                  border: OutlineInputBorder()
              ),
            ),
            TextField(
              controller: controltwo,
              decoration: InputDecoration(
                  border: OutlineInputBorder()
              ),
            ),
            ElevatedButton(onPressed: (){

            }, child: Text("edit"))
          ],
        ),
      ),
    );
  });
}