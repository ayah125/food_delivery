import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_credit_card/flutter_credit_card.dart';
import 'package:food_delivery/components/buttons.dart';
import 'package:food_delivery/pages/delivery_page.dart';
import 'package:food_delivery/pages/receipt.dart';

class PaymentPage extends StatefulWidget {
  const PaymentPage({super.key});

  @override
  State<PaymentPage> createState() => _PaymentPageState();
}

class _PaymentPageState extends State<PaymentPage> {
  GlobalKey<FormState> formkey=GlobalKey<FormState>();
  String cardNumber='';
  String expiryDate='';
  String cardHolderName='';
  String cvvCode='';

 bool isCvvFocued=false;
  String onCreditCardWidgetChange='';
  void userTabbedPay() {
    if(formkey.currentState!.validate()){
      showDialog(context: context, builder: (context)=>AlertDialog(
        title: Text("Confirm payment"),
        content: SingleChildScrollView(
          child: ListBody(
            children: [
              Text('CardNumber: $cardNumber'),
              Text('expiry date : $expiryDate'),
              Text("Card Holder Name : $cardHolderName"),
              Text("CVV : $cvvCode")
            ],
          ),
        ),
        actions: [
          TextButton(onPressed: (){
            Navigator.pop(context);
            Navigator.push(context,
                MaterialPageRoute(builder:
                    (context)=>DeliveryPage()));
          }, child: Text("Yes")),
          TextButton(onPressed: (){
           Navigator.pop(context);
          }, child: Text("Cancel")),
        ],
      ));
    }
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.background,
      appBar: AppBar(
        title: Text("Checkout"),
        backgroundColor: Colors.transparent,
      ),
      body: SingleChildScrollView (
        child: Column(
          children: [
            CreditCardWidget(
              cardNumber: cardNumber,
              expiryDate: expiryDate,
              cardHolderName: cardHolderName,
              cvvCode: cvvCode,
              showBackView: isCvvFocued, //true when you want to show cvv(back) view
              onCreditCardWidgetChange: (p0) {}, // Callback for anytime credit card brand is changed
            ),
        CreditCardForm(cardNumber: cardNumber, expiryDate: expiryDate,
            cardHolderName: cardHolderName, cvvCode: cvvCode,
            onCreditCardModelChange: (data) {
          setState(() {
            cardNumber=cardNumber;
            expiryDate=expiryDate;
            cardHolderName=data.cardHolderName;
            cvvCode=data.cvvCode;
          });
            },
            formKey: formkey),
        MyButtons(onTap: userTabbedPay, text: "Pay Now"),
        
          ],
        ),
      ),
    );
  }
}
