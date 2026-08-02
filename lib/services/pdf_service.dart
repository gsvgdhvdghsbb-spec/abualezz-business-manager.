import 'package:pdf/pdf.dart';
import 'package:pdf/widgets.dart' as pw;
import 'package:printing/printing.dart';

import '../models/invoice_model.dart';
import '../models/invoice_item_model.dart';



class PdfService {



Future<void> generateInvoicePdf(

InvoiceModel invoice,

List<InvoiceItemModel> items,

) async {



final pdf = pw.Document();




pdf.addPage(


pw.Page(

pageFormat: PdfPageFormat.a4,


build:(context){


return pw.Column(


crossAxisAlignment:
pw.CrossAxisAlignment.start,


children:[



pw.Center(

child:

pw.Text(

"محاسبة أبو العز",

style:

pw.TextStyle(

fontSize:28,

fontWeight:
pw.FontWeight.bold,

),

),

),



pw.SizedBox(height:10),



pw.Center(

child:

pw.Text(

"فاتورة مبيعات",

style:

const pw.TextStyle(

fontSize:20,

),

),

),



pw.Divider(),




pw.Text(

"العميل: ${invoice.customer}",

),



pw.Text(

"التاريخ: ${invoice.date}",

),



pw.SizedBox(height:20),





pw.Table.fromTextArray(


headers:[

"المنتج",

"السعر",

"الكمية",

"الإجمالي",

],



data:

items.map((item)=>[

item.productName,

item.price.toString(),

item.quantity.toString(),

item.total.toString(),

]).toList(),



),





pw.SizedBox(height:20),





pw.Text(

"الإجمالي: ${invoice.total}",

style:

pw.TextStyle(

fontSize:16,

fontWeight:
pw.FontWeight.bold,

),

),



pw.Text(

"المدفوع: ${invoice.paid}",

),




pw.Text(

"المتبقي: ${invoice.remaining}",

),




pw.Divider(),





pw.Center(

child:

pw.Text(

"شكرًا لتعاملكم معنا",

),

),



],


);


},


),


);




await Printing.layoutPdf(

onLayout:(format)=>pdf.save(),

);



}


}
