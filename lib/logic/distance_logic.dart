
class DistanceLogic{
  //Property
  double valueJarak;
  double maksimumValueJarak;
  double hasil = 0;

  //Constructor

  DistanceLogic(this.valueJarak, this.maksimumValueJarak);

  //Methods
  int outputVolume(){
    hasil = maksimumValueJarak-((valueJarak/maksimumValueJarak)*maksimumValueJarak);
    print(hasil.toInt());
    return hasil.toInt();
  }
}