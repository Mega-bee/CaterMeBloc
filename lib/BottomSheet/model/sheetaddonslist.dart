import '../../utils/Images/Images.dart';

class listslistmodle {
  String? img;
  String? text;

  listslistmodle({
    this.img,this.text
  });
}

final List<listslistmodle> Lists = [
  listslistmodle(
    img: ImageAsset.ramadan,text: "Iftar Ramadan Extra"
  ),
  listslistmodle(
    img: ImageAsset.ramadan,text: "breakfast"
  ),
  listslistmodle(
    img: ImageAsset.cofee,text: "Coffee"
  ),


];
