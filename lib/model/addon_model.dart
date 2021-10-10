class AddonModel
{
  String name="";
  double price=0;
  AddonModel.fromJson(Map<String,dynamic>json)
  {
    name=json["name"];
    price=json["price"];
  }
  Map<String,dynamic>toJson()
  {
    final data=Map<String,dynamic>();
    data["name"]=this.name;
    data["price"]=this.price;
    return data;
  }

}