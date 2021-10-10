import 'package:foodapp1/model/size_model.dart';

import 'addon_model.dart';

class FoodModel
{
  String description="",id="",name="",image="";
  double price=0;
  List<SizeModel> size=List<SizeModel>.empty(growable: true);
  List<AddonModel> addon=List<AddonModel>.empty(growable: true);


  FoodModel(
      {required this.description,
      required this.id,
      required this.name,
      required this.image,
      required this.price,
      required this.size,
      required this.addon});

  FoodModel.fromJson(Map<String,dynamic>json)
  {
    name=json["name"];
    description=json["description"];
    id=json["id"];
    image=json["image"];
    if(json["size"]!=null)
      {
        size=List<SizeModel>.empty(growable: true);
        this.size=json["size"].forEach((e)=>size.add(SizeModel.fromJson(e)));
      }
    if(json["addon"]!=null)
      {
        addon=List<AddonModel>.empty(growable: true);
        json["addon"].forEach((element) {
          addon.add(AddonModel.fromJson(element));
        });
      }
  }

  Map<String,dynamic>toJson()
  {
    final data=Map<String,dynamic>();
    data["description"]=this.description;
    data["name"]=this.name;
    data["image"]=this.image;
    data["price"]=this.price;
    data["size"]=this.size.map((e) => e.toJson()).toList();
    data["addon"]=this.addon.map((e) => e.toJson()).toList();
    return data;
  }
}