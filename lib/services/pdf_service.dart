
import 'package:pdf/pdf.dart';
import 'package:pdf/widgets.dart' as pw;
import 'package:printing/printing.dart';

import '../models/invoice_model.dart';



class PdfService {



Future<void> generateInvoicePdf(

InvoiceModel invoice,

) async {



final pdf = pw.Document();




pdf.addPage(


pw.Page(

pageFormat:
PdfPageFormat.a4,


build:(context){



return pw.Column(


crossAxisAlignment:
pw.CrossAxisAlignment.start,



children:[



pw.Text(

"محاسبة أبو العز",

style:

pw.TextStyle(

fontSize:24,

fontWeight:
pw.FontWeight.bold,

),

),



pw.SizedBox(

height:20,

),



pw.Text(

"فاتورة بيع",

style:

const pw.TextStyle(

fontSize:18,

),

),



pw.Divider(),



pw.Text(

"العميل: ${invoice.customer}",

),



pw.Text(

"التاريخ: ${invoice.date}",

),



pw.SizedBox(

height:15,

),



pw.Text(

"الإجمالي: ${invoice.total}",

),



pw.Text(

"المدفوع: ${invoice.paid}",

),



pw.Text(

"المتبقي: ${invoice.remaining}",

),



],

);


}

),


);




await Printing.layoutPdf(

onLayout:(format)=>pdf.save(),

);



}


}
