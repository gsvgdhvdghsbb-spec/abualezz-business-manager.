
class CustomerModel {


  int? id;

  String name;

  String phone;

  double debt;


  CustomerModel({

    this.id,

    required this.name,

    required this.phone,

    required this.debt,

  });



  Map<String,dynamic> toMap(){

    return {

      "id": id,

      "name": name,

      "phone": phone,

      "debt": debt,

    };

  }



  factory CustomerModel.fromMap(
      Map<String,dynamic> map){

    return CustomerModel(

      id: map["id"],

      name: map["name"],

      phone: map["phone"],

      debt: map["debt"],

    );

  }

}
