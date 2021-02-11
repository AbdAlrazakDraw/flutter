import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:task1/Model/imgaes.dart';
import 'package:task1/bloc/bloc.dart';
import 'package:task1/bloc/event.dart';
import 'package:task1/bloc/state.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int pageNumber;
  bool initial = true;
  ScrollController _scrollController = ScrollController();

  // -----------------------------------------------------
  @override
  void initState() {
    pageNumber = 10;
    BlocProvider.of<BlocIm>(context, listen: false)
        .add(Fetchimages(pagesNumber: pageNumber));
    _scrollController.addListener(() {
      if (_scrollController.position.pixels ==
          _scrollController.position.maxScrollExtent) getMorePosts(context);
    });
    super.initState();
  }

  getMorePosts(BuildContext context) {
    pageNumber += 10;
    BlocProvider.of<BlocIm>(context).add(Fetchimages(pagesNumber: pageNumber));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("Photos"),
          centerTitle: true,
        ),
        body: OrientationBuilder(builder: (context, orientation) {
          return BlocBuilder<BlocIm, imState>(
            builder: (context, state) {
              if (state is LoadingState)
                return Center(
                  child: CircularProgressIndicator(),
                );
              if (state is Loaded) {
                return Container(
                    height: ScreenUtil().setHeight(690),
                    child: GridView.count(
                      controller: _scrollController,
                      crossAxisCount:
                          orientation == Orientation.portrait ? 2 : 3,
                      children: List.generate(
                        state.posts.length,
                        (index) => Photo(index, state.posts),
                      ),
                    ));
              } else
                return Container();
            },
          );
        }));
  }
}

Widget Photo(int index, List<images> img) {
  return Card(
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(30),
    ),
    margin: EdgeInsets.all(8),
    child: Container(
      child: CachedNetworkImage(
        imageUrl: img[index].url,
        placeholder: (context, url) => CircularProgressIndicator(),
        errorWidget: (context, url, error) => Icon(Icons.error),
      ),
      decoration: BoxDecoration(
        color: Colors.black12,
        borderRadius: BorderRadius.circular(30),
      ),
    ),
  );
}
