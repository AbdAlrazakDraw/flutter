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
      appBar: AppBar(),
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
  return Container(

      margin: EdgeInsets.all(8),
      child: GridTile(
         child: Container(
      decoration: BoxDecoration(
            color: Colors.white,
           borderRadius: BorderRadius.circular(8),),
           child: Image.network(
              "https://picsum.photos/id/$index/400/400",fit:BoxFit.fill,),

  ),
      ),
  );
}
