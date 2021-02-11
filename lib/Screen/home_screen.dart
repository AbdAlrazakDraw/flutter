import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("Photos"),
          centerTitle: true,
        ),
        body:
        OrientationBuilder(
            builder: (context, orientation) {
              return GridView.count(
                crossAxisCount: orientation == Orientation.portrait ? 2 : 3,
                children: List.generate(
                  10,
                      (index) => Photo(index),
                ),

              );
            }
        )
    );
  }
}
Widget Photo(int index){
  return Card(
      shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(30), )
    ,
      margin: EdgeInsets.all(8),
     child: Container(
      decoration: BoxDecoration(
            color: Colors.black12,
           image:DecorationImage(image:NetworkImage( "https://picsum.photos/id/$index/400/400"),
           fit: BoxFit.fill),
           borderRadius: BorderRadius.circular(30),
          ),
  ),
  );
}
