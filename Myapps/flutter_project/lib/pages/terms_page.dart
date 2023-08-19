import 'package:flutter/material.dart';
//import 'package:buttons/utiles/routes.dart';
import 'package:flutter_project/utils/routes.dart';

class Terms extends StatelessWidget {
  const Terms({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blue[200], // Set background color to blue[200]
        centerTitle: true,
        title: Text(
          "TERMS & CONDITIONS",
          style: TextStyle(
            fontSize: 18, // Set font size for the title
            fontWeight: FontWeight.bold,
            color: Colors.white, // Set text color for the title
          ),
        ),
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.pop(
                context); // Navigate back when the back button is pressed
          },
        ),
      ),
      body: SingleChildScrollView(
        child: Material(
          child: Column(
            children: [
              Container(
                padding: EdgeInsets.all(28.0),
                child: const Text(
                  "TERMS & CONDITIONS",
                  style: TextStyle(
                    fontSize: 28,
                    fontStyle: FontStyle.italic,
                    color: Colors.black,
                  ),
                ),
              ),
              Container(
                padding: EdgeInsets.all(16), // Add padding to the content
                child: const Text(
                  '''1. Guests are required to present a valid government-issued ID upon check-in.

 2. Guests are responsible for their own personal belongings and the hostel will not be held liable for any lost or stolen items.

 3. Quiet hours are from 10pm to 6am. Guests are expected to keep noise levels to a minimum during these hours.

 4. Smoking is strictly prohibited inside the hostel and any guest found smoking will be evicted without a refund.

 5. Guests are expected to keep the hostel and their room clean and tidy.

 6. Guests are not allowed to bring any illegal drugs or weapons into the hostel.

 7. Any damage caused to the hostel property by the guest will be charged to the guest's account.

 8. The hostel reserves the right to evict any guest who violates these terms and conditions without a refund.

 9. Guests are expected to follow all COVID-19 safety protocols as per the hostel or Government guidelines.

 10. Guests are expected to pay the balance amount at the time of check-in and any additional charges incurred during their stay, before check-out.

 11. Hostel reserves the right to change policies, rates, and these terms and conditions at any time without prior notice.

 By staying at the hostel, guests agree to abide by these terms and conditions.
      ''',
                  style: TextStyle(
                    fontSize: 18,
                    color: Colors.black, // Set text color for the content
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

      /* AppBar(),
      body: SingleChildScrollView(
        child: Material(
          child: Column(
            children: [
              Container(
                child: Padding(
                  padding: const EdgeInsets.all(28.0),
                  child: Text("TERMS & CONDITIONS",style: TextStyle(
                    fontSize: 28,
                    color: Colors.black,
                    fontWeight: FontWeight.bold,
                  ),),
                ),
              ),
              Container(
                child: Text('''1. Guests are required to present a valid government-issued ID upon check-in.
     2. Guests are responsible for their own personal belongings and the hostel will not be held liable for any lost or stolen items.
     3. Quiet hours are from 10pm to 6am. Guests are expected to keep noise levels to a minimum during these hours.
     4. Smoking is strictly prohibited inside the hostel and any guest found smoking will be evicted without a refund.
     5. Guests are expected to keep the hostel and their room clean and tidy.
     6. Guests are not allowed to bring any illegal drugs or weapons into the hostel.
     7. Any damage caused to the hostel property by the guest will be charged to the guest's account.
     8. The hostel reserves the right to evict any guest who violates these terms and conditions without a refund.
     9. Guests are expected to follow all COVID-19 safety protocols as per the hostel or Government guidelines.
    10. Guests are expected to pay the balance amount at the time of check-in and any additional charges incurred during their stay, before check-out.
    11. Hostel reserves the right to change policies, rates, and these terms and conditions at any time without prior notice.
     By staying at the hostel, guests agree to abide by these terms and conditions.
        ''',
                style: TextStyle(
                  fontSize: 18
                ),),
              ),

             /* Padding(
                padding: const EdgeInsets.all(12.0),
                child: ElevatedButton(
                  onPressed: (){
                    Navigator.pushNamed(context, MyRoutes.homeDetailsRoute);
                  },
                  style: TextButton.styleFrom(backgroundColor: Colors.purple),
                  child: Text("GO BACK TO HOTEL PAGE " ,
                    style: TextStyle(
                      fontSize: 15,
                    ),
                  ),
                ),
              ),*/
            ],
    
          ),
        ),
      ),
    );
  }
}*/
