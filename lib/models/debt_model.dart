class DebtModel {

  int? id;

  String customerName;

  double amount;

  double paid;

  double remaining;

  String date;


  DebtModel({

    this.id,

    required this.customerName,

    required this.amount,

    required this.paid,

    required this.remaining,

    required this.date,

  });



  Map<String,dynamic> toMap(){

    return {

      "id": id,

      "customerName": customerName,

      "amount": amount,

      "paid": paid,

      "remaining": remaining,

      "date": date,

    };

  }



  factory DebtModel.fromMap(Map<String,dynamic> map){

    return DebtModel(

      id: map["id"],

      customerName: map["customerName"],

      amount: map["amount"],

      paid: map["paid"],

      remaining: map["remaining"],

      date: map["date"],

    );

  }


}
