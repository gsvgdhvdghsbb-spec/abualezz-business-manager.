class InvoiceModel{


int? id;

String customer;

double total;

double paid;

double remaining;

String date;



InvoiceModel({

this.id,

required this.customer,

required this.total,

required this.paid,

required this.remaining,

required this.date,

});



Map<String,dynamic> toMap(){

return{

"id":id,

"customer":customer,

"total":total,

"paid":paid,

"remaining":remaining,

"date":date,

};

}




factory InvoiceModel.fromMap(
Map<String,dynamic> map){

return InvoiceModel(

id:map["id"],

customer:map["customer"],

total:map["total"],

paid:map["paid"],

remaining:map["remaining"],

date:map["date"],

);


}


}
