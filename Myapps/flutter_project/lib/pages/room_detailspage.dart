import 'package:flutter/material.dart';
//import 'package:buttons/utiles/routes.dart';
import 'package:flutter_project/utils/routes.dart';

class RoomDetails extends StatelessWidget {
  const RoomDetails({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: SingleChildScrollView(
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