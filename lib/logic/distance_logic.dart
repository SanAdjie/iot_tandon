
class DistanceLogic{
  //Property
  int valueJarak;
  int maksimumValueJarak;

  //Constructor

  DistanceLogic(this.valueJarak, this.maksimumValueJarak);

  //Methods
  double outputVolume(){
    return maksimumValueJarak-((valueJarak/maksimumValueJarak)*maksimumValueJarak);
  }
}