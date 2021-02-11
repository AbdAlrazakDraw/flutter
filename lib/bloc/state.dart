import 'package:equatable/equatable.dart';
import 'package:task1/Model/imgaes.dart';
abstract class imState extends Equatable{
  const imState();
  @override
  List<Object> get props=>[];
}
class InitState extends imState{}
class LoadingState extends imState{}
class getDataState extends imState{
  List<images> img;
  getDataState({this.img});
}
class Loaded extends imState {
  final List<images> posts;

  Loaded({this.posts});
  @override
  List<Object> get props => [posts];
}
class Error extends imState{
  final String message;
  Error({this.message});
  @override
  List<Object> get props=>[message];

}
