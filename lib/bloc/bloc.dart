import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:task1/Model/imgaes.dart';
import 'package:task1/bloc/event.dart';
import 'package:task1/bloc/state.dart';
import 'package:task1/services/remote_services.dart';

class BlocIm extends Bloc<imEvent, imState>{
  RemoteServices repository;
  BlocIm(imState initialState,this.repository) : super(initialState);
  @override
  int get initialState => 0;

  @override
  Stream<imState> mapEventToState(imEvent event) async* {
    if (event is Fetchimages) {
      var result= await RemoteServices.fetchProducts(event.pagesNumber); {
        yield Loaded(posts: result);
      }}
    if(event is getAllimageEvent)
    {
      yield LoadingState();
      List<images> imgs=[];
      for(int i=0;i<30;i++)
      {
        images im=new images(url: "https://picsum.photos/id/$i/400/400");
        imgs.add(im);
        print('true');
      }
      yield getDataState(img: imgs);
    }

  }


}