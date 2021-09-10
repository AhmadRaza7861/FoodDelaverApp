class RestaurantModel
{
  String address="";
  String imageUrl="";
  String name="";
  String paymentUrl="";
  String phone="";

  RestaurantModel(
      {required this.address, required this.imageUrl,
        required this.name, required this.paymentUrl, required this.phone});
  RestaurantModel.fromJson(Map<String,dynamic>fromjson)
  {
    address=fromjson["address"];
    imageUrl=fromjson["imageUrl"];
    name=fromjson["name"];
    paymentUrl=fromjson["paymentUrl"];
    phone=fromjson["phone"];
  }
  Map<String,dynamic>toJson()
  {
    Map<String,dynamic> data=new Map<String,dynamic>();
    data["addtess"]=this.address;
    data["imageUrl"]=this.imageUrl;
    data["name"]=this.name;
    data["paymentUrl"]=this.paymentUrl;
    data["phone"]=this.phone;
    return data;
  }

}