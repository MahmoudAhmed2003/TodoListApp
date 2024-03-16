import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../controller/HomeControler.dart';

class HomeScreen extends StatelessWidget {

  final myController = TextEditingController();

  HomeScreen createState() => HomeScreen();

  @override
  Widget build(BuildContext context) {
    double Width = MediaQuery.of(context).size.width;
    double Height = MediaQuery.of(context).size.height;

    return Scaffold(
        resizeToAvoidBottomInset: false,
        appBar: AppBar(
          title:  Text('Home Screen',style: TextStyle(
          ),),
        ) ,
        body:SingleChildScrollView(
          child: Container(
              child:Center(
                  child:Column(
                    children: [
                      Column(
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              Container(
                                padding: EdgeInsets.all(20),
                                child:Column(
                                  children: [
                                    Container(
                                     child:FloatingActionButton(
                                        onPressed: () {
                                        },
                                        child: Icon(Icons.list,size: 40,),
                                        backgroundColor: Colors.white,
                                      ),
                                    ),
                                    SizedBox(height: 20,),
                                    Text('To-Do',style: TextStyle(fontSize: 30), ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                          Container(
                            width:300,
                            child: TextField(
                              controller: myController,
                              decoration: InputDecoration(
                                      border: OutlineInputBorder(),
                                      labelText: 'Task',
                                    ),
                            ),
                          ),
                        ],
                      ),
                      Container(
                        child: Stack(
                            children: [
                              Column(
                          children: [
                               SizedBox(height: 20,),
                              Consumer<HomeController>(
                                builder: (context, provider, child) {
                                  return ClipRRect(
                                    borderRadius: BorderRadius.only(topLeft: Radius.circular(50),topRight: Radius.circular(50)),
                                    child: Container(
                                      color: Colors.black87,
                                      padding: EdgeInsets.all(20),
                                      height: Height*0.7,
                                      width: Width,
                                      child: Column(
                                        children: [
                                          ListView(
                                            scrollDirection: Axis.vertical,
                                            shrinkWrap: true,
                                            children: [
                                              for ( int item =0; item < provider.myTasks.length ; item++ )
                                    ListTile(
                                                    title: Text(provider.myTasks[item] , style: TextStyle(fontSize: 25,
                                                         decoration: provider.myTasksStat[item]==0 ? TextDecoration.lineThrough : TextDecoration.none),),
                                                        contentPadding: EdgeInsets.all(5),
                                                        trailing: IconButton(
                                                          icon: Icon(Icons.task_alt),
                                                          onPressed: () {
                                                            provider.myTasksStat[item] ==0 ? provider.myTasksStat[item] = 1 : provider.myTasksStat[item] = 0;
                                                            provider.notifyListeners();
                                                    },
                                                  ),
                                                    onLongPress: () {
                                                      provider.removeTask(item);
                                                    },
                                                )
                                            ],
                                          ),
                                        ],
                                      ),
                                    ),
                                  );
                                },
                              ),
                           ],
                          ),
                              Container(
                                margin: EdgeInsets.only(top: 550, left: 300),
                                child: FloatingActionButton(onPressed: () {
                                  if(myController.text.toString() != '')
                                    Provider.of<HomeController>(context, listen: false).addTask(myController.text.toString());
                                  Provider.of<HomeController>(context, listen: false).printTask();
                                  Provider.of<HomeController>(context, listen: false).myTasksStat.add(1);
                                  myController.clear();
                                },

                                  child: Icon(Icons.add_task, size: 50, color: Colors.black87),
                                  backgroundColor: Colors.white,
                                ),
                              )
                        ],

                        ),
                      ),

                    ],
                  )
              )
          ),
        )

    );
  }
}
