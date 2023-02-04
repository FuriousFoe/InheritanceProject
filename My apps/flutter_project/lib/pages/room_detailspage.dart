import 'package:flutter/material.dart';
//import 'package:buttons/utiles/routes.dart';
import 'package:flutter_project/utils/routes.dart';

class RoomDetails extends StatefulWidget {
  const RoomDetails({super.key, required this.title});
  
  final String title ;
  @override
  State<RoomDetails> createState() => _RoomDetailsState();
}

class _RoomDetailsState extends State<RoomDetails> {
 String valueChoose ='' ;

  List listItem = [ "1 RK", "1 BHK" , "2 BHK" , "3BHK" ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
     /* body: SingleChildScrollView(


        child: Padding( 
          padding: const EdgeInsets.all(16.0),
          child: Container(
            padding: EdgeInsets.only(left: 16 ,right: 16),
            decoration: BoxDecoration(
               border: Border.all(color:Colors.grey ,width: 1),
               borderRadius: BorderRadius.circular(15),
              ),
            child: DropdownButton(
              hint: Text("Select Size: "),
              dropdownColor: Colors.white,
              icon: Icon(Icons.arrow_drop_down),
              iconSize: 36,
              isExpanded: true,
              underline: SizedBox(),
              style: TextStyle(
                color: Colors.black,
                fontSize: 22, 
                ),
              value: valueChoose,
              onChanged: (newValue){
                setState(() {
                  valueChoose = newValue as String;
                });
              },

              items: listItem.map((valueItem) {
                return DropdownMenuItem(
                  value: valueItem,
                  child: Text(valueItem),
                );
              }).toList(),
            ),
          ),
        ), 
      ) */

      body:  SingleChildScrollView(
        child: Material(
          child: Column(
            children: [
              Container(
                child: Padding(
                  padding: const EdgeInsets.all(28.0),
                  child: Text("Availibility of Rooms and Fees:",style: TextStyle(
                    fontSize: 28,
                    color: Colors.black,
                    fontWeight: FontWeight.bold,
                  ),),
                ),
              ),
              Container(
                child: Text('''1. 20 rooms 5 on each floor .
     2. For 1 bhk :-
        i. Accomodation = 2 person -> Rs.1000(per person monthly rent)
       ii. Accomodation = 3 person -> Rs.700(per person monthly rent)
      iii. Accomodation = 4 person -> Rs.500(per person monthly rent)
     3. For 2 bhk :-
        i. Accomodation = 2 person -> Rs.1500(per person monthly rent)
       ii. Accomodation = 3 person -> Rs.1000(per person monthly rent)
      iii. Accomodation = 4 person -> Rs.700(per person monthly rent)
     4. For 3 bhk :-
        i. Accomodation = 2 person -> Rs.1800(per person monthly rent)
       ii. Accomodation = 3 person -> Rs.1200(per person monthly rent)
      iii. Accomodation = 4 person -> Rs.1000(per person monthly rent)
      
        ''',
                style: TextStyle(
                  fontSize: 18
                ),),
              ),

              
            ],
    
          ),
        ),
      ),
    );
  }
}