   import 'package:flutter/material.dart';
   class Calculator extends StatefulWidget {
   const Calculator({Key? key}) : super(key: key);

   @override
   State<Calculator> createState() => _CalculatorState();
 }

 class _CalculatorState extends State<Calculator> {

   @override
   Widget build(BuildContext context) {
     return Scaffold(
       appBar: AppBar(
         backgroundColor: Colors.orange,
         title: Text("Calculator"),
       ),
       body: Column(mainAxisAlignment: MainAxisAlignment.center,
         children: [

           Padding(
             padding: const EdgeInsets.only(left: 250),
             child: Text(history, style: TextStyle(fontSize: 30),),
           ),
           SizedBox(height: 20,),
           Padding(
             padding: const EdgeInsets.only(left: 290),
             child: Text(temp, style: TextStyle(fontSize: 30),),
           ),


           Divider(
             thickness: 2,
             color: Colors.grey,
           ),
           Padding(
             padding: const EdgeInsets.all(8.0),
             child: Row(mainAxisAlignment: MainAxisAlignment.spaceAround,


               children: [

                 buttonreuse("c", Colors.grey),
                 buttonreuse("←", Colors.grey),
                 buttonreuse("%", Colors.grey),
                 buttonreuse("+", Colors.orange),


               ],
             ),
           ),
           Padding(
             padding: const EdgeInsets.all(8.0),
             child: Row(mainAxisAlignment: MainAxisAlignment.spaceAround,
               children: [
                 buttonreuse("7", Colors.grey),
                 buttonreuse("8", Colors.grey),
                 buttonreuse("9", Colors.grey),
                 buttonreuse("*", Colors.orange),
               ],
             ),
           ),
           Padding(
             padding: const EdgeInsets.all(8.0),
             child: Row(mainAxisAlignment: MainAxisAlignment.spaceAround,
               children: [
                 buttonreuse("4", Colors.grey),
                 buttonreuse("5", Colors.grey),
                 buttonreuse("6", Colors.grey),
                 buttonreuse("-", Colors.orange),
               ],
             ),
           ),
           Padding(
             padding: const EdgeInsets.all(8.0),
             child: Row(mainAxisAlignment: MainAxisAlignment.spaceAround,
               children: [
                 buttonreuse("1", Colors.grey),
                 buttonreuse("2", Colors.grey),
                 buttonreuse("3", Colors.grey),
                 buttonreuse("+", Colors.orange),
               ],
             ),
           ),
           Padding(
             padding: const EdgeInsets.all(8.0),
             child: Row(mainAxisAlignment: MainAxisAlignment.spaceAround,
               children: [

                 buttonlast("0", Colors.grey),
                 buttonlast(".", Colors.grey),
                 buttonlast("=", Colors.orange),

               ],
             ),
           ),

         ],
       ),

     );
   }
    String history='';
    String temp='';
    String result='';
    String operation='';
   int number1=0;
   int number2=0;

   void calculate(String text) {
     setState(() {
       if (text == 'c') {
         temp='';
         result='';
         operation='';
         number1=0;
         number2=0;
       }
       else if(text=='←'){
         result=temp.substring(0,(temp.length)-1);
       }
       else if(text=='+'||text=='-'||text=='*'||text=='/'||text=='%'){
         number1=int.parse(text);
         number2=int.parse(temp);
         operation=text;

       }
       else if(text=='='){
         if(operation=='+'){
           result=(number1+number2).toString();
         }
         if(operation=='-'){
           result=(number1-number2).toString();
           history=number1.toString()+operation.toString()+number2.toString();
         }
       if(operation=='*'){
         result=(number1*number2).toString();
         history=number1.toString()+operation.toString()+number2.toString();
       }
       if(operation=='/'){
         result=(number1/number2).toString();
         history=number1.toString()+operation.toString()+number2.toString();
       }
       if(operation=='%'){
         result=(number1%number2).toString();
         history=number1.toString()+operation.toString()+number2.toString();
       }
       else{
        result=int.parse(temp+text).toString();
        print(result);
       }

         temp=result;
       }

     });
   }

   buttonlast(String name, Color color) {
     return SizedBox(width: 110, height: 50,
       child: FloatingActionButton(onPressed: () {
         calculate(name);
       },
         shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(40),
         ),
         backgroundColor: color,
         child: Text(name, style: TextStyle(fontSize: 30),),

       ),
     );
   }

   buttonreuse(String name, Color color) {
     return SizedBox(width: 70,
       height: 70,
       child: FloatingActionButton(onPressed: () {
         calculate(name);
       },

         backgroundColor: color,
         child: Text(name, style: TextStyle(fontSize: 30),),),
     );
   }
   }



