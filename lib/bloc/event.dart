abstract class imEvent{}
class getAllimageEvent extends imEvent{}
class Fetchimages extends imEvent{
  final int itemsNumber;
  final int pageNumber;
  Fetchimages({this.pageNumber,this.itemsNumber});

  @override
  List<Object> get props => [pageNumber,itemsNumber];
}
