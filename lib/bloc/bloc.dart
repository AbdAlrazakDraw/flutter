import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:task1/Model/imgaes.dart';
import 'package:task1/bloc/event.dart';
import 'package:task1/bloc/state.dart';
import 'package:task1/services/remote_services.dart';

class BlocIm extends Bloc<imEvent, imState>{
  RemoteServices repository;
  bool First;
  List<images> result;
  BlocIm(imState initialState,this.repository,this.First) : super(initialState);
  @override
  int get initialState => 0;

  @override
  Stream<imState> mapEventToState(imEvent event) async* {
    if (event is Fetchimages) {
      if(First){
        yield LoadingState();
        result=[];
        First=false;
        print(result.length);
      }
      result= await RemoteServices.fetchProducts(event.pageNumber,event.itemsNumber); {
        if (result.isNotEmpty) {
          print(result.length);
          yield Loaded(posts: result);
        }
      }}
    if(event is getAllimageEvent)
    {
      yield LoadingState();
      List<images> imgs=[];
      for(int i=0;i<30;i++)
      {
        images im=new images(url: "https://picsum.photos/id/$i/420/420");
        imgs.add(im);
        print('true');
      }
      yield getDataState(img: imgs);
    }
  }
}
