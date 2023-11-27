import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:untitled1/custom%20widget/bottom_sheet.dart';
import 'package:untitled1/custom%20widget/dialogue.dart';
import 'package:untitled1/models/hive_model.dart';
import 'package:untitled1/provider_class/provider.dart';

import '../models/box.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  void didChangeDependencies() {
    // This is the recommended place to initialize providers using context
    Provider.of<Provider_For_App>(context, listen: false).getinfo();
    super.didChangeDependencies();
  }
  @override
  Widget build(BuildContext context) {
    return Consumer<Provider_For_App>(
      builder: (ct,pfa,_) {
        return Scaffold(
          body: ListView.builder(
            itemCount: pfa.list.length,
              itemBuilder:(BuildContext context,int index){
              return Padding(
                padding: const EdgeInsets.only(top: 40),
                child: GestureDetector(
                  onDoubleTap: (){
                    pfa.deleteInfo(index);
                  },
                  onTap: (){
                    //dialogue(context, pfa.three, pfa.four);
                    showDialog<void> (context: context, builder: (context)
                    {
                      return AlertDialog(
                        title: Text("edit "),
                        content: Container(
                          height: 300,
                          child: Column(
                            children: [
                              TextField(
                                controller: pfa.three,
                                decoration: InputDecoration(
                                    border: OutlineInputBorder()
                                ),
                              ),
                              TextField(
                                controller: pfa.four,
                                decoration: InputDecoration(
                                    border: OutlineInputBorder()
                                ),
                              ),
                              ElevatedButton(onPressed: (){
                                HiveModel? hive=Boxes.gethivebox().getAt(index);
                                pfa.editInfo(pfa.three.text, pfa.four.text,hive!);

                              }, child: Text("edit"))
                            ],
                          ),
                        ),
                      );
                    });
                  },
                  child: Container(
                    height: 50,
                      width: 80,
                      //MediaQuery.of(context).size.width*.6,
                      color: Colors.amber,
                      child: Text("${pfa.list[index].name.toString()}")),
                ),
              );
              }),


          floatingActionButton: FloatingActionButton(
            onPressed: (){
              showModalBottomSheet(
                  context: context,
                  builder: (cont){
                    return Padding(
                      padding: const EdgeInsets.only(left: 20,right: 20,top: 30),
                      child: Column(
                        children: [
                          SizedBox(height: 20,),
                          TextField(
                            controller: pfa.one,
                            decoration: InputDecoration(
                                border: OutlineInputBorder()

                            ),
                          ),
                          SizedBox(height: 20,),

                          TextField(
                            controller: pfa.two,
                            decoration: InputDecoration(
                                border: OutlineInputBorder()
                            ),
                          ),
                          SizedBox(
                            height: 20,
                          ),

                          ElevatedButton(onPressed: (){
                        String res= pfa.addInfo(pfa.one.text, pfa.two.text);
                        pfa.one.clear();
                        pfa.two.clear();
                        var snackbar= SnackBar(content: Text(res.toString()),);
                        ScaffoldMessenger.of(context).showSnackBar(snackbar);
                          }, child: Text("add"))
                        ],
                      ),
                    );
                  });


            },
            child: Icon(Icons.add,color: Colors.black,),
          ),
        );
      }
    );
  }
}
