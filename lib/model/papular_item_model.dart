class PapularItemModel {
  String foodId = "",
      name = "",
      menuId = "",
      image = "";

  PapularItemModel({required this.foodId, required this.name, required this.menuId, required this.image});

  PapularItemModel.fromJsom(Map<String,dynamic>fromJson)
  {
    name=fromJson["name"];
    foodId=fromJson["food_id"];
    menuId=fromJson["menu_id"];
    image=fromJson["image"];
  }
  Map<String,dynamic> toJson()
  {
    Map<String,dynamic> data=new Map<String,dynamic>();
    data["food_id"]=this.foodId;
    data["name"]=this.name;
    data["menu_id"]=this.menuId;
    data["image"]=this.image;
    return data;
  }
}