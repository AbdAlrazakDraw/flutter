import 'package:equatable/equatable.dart';
abstract class imState extends Equatable{
  const imState();
  @override
  List<Object> get props=>[];
}
class InitState extends imState{}
class getDataState extends imState{}
class Loaded extends imState{
  final List<images> posts;
  @override
  List<Object> get props=>[];

}
class Error extends imState{
  final String message;
  Error({this.message});
  @override
  List<Object> get props=>[message];

}
