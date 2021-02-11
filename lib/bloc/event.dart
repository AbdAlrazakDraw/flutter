abstract class imEvent{}
class getAllimageEvent extends imEvent{}
class Fetchimages extends imEvent{
  final int pagesNumber;
  Fetchimages({this.pagesNumber});
  @override
  List<Object> get props =>[pagesNumber];
}