class ExpenseModel{


int? id;

String title;

double amount;

String date;


ExpenseModel({

this.id,

required this.title,

required this.amount,

required this.date,

});


Map<String,dynamic> toMap(){

return{

"id":id,

"title":title,

"amount":amount,

"date":date,

};

}


}
