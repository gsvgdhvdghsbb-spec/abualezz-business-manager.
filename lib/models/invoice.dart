
class InvoiceModel {


  int? id;


  String customer;


  double total;


  String date;



  InvoiceModel({

    this.id,

    required this.customer,

    required this.total,

    required this.date,

  });



  Map<String,dynamic> toMap(){

    return {

      "id":id,

      "customer":customer,

      "total":total,

      "date":date,

    };

  }


}
