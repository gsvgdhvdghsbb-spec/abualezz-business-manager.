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


}
