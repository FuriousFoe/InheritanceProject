import 'package:flutter/material.dart';
import 'package:flutter_project/utils/routes.dart';


class Facilities extends StatelessWidget {
  const Facilities({Key? key}) : super(key: key) ;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
       body: Material(
        child: Column(
          children: [
            SizedBox(height: 45,),
            Container(
              child: Text("FACILITIES & ACCESSIBILITIES",
              style: TextStyle(
                fontSize: 22,
              ),),
            ),
            SizedBox(height: 55,),
            Container(
              child: Text('''
     1. Accommodation: Hostels typically provide basic accommodation in the form of shared dormitory rooms or private rooms.
     2. 24 hours water and electric supply.
     3. Bathroom facilities
     4. Laundry facilities
     5. Kitchen facilities
     6. Common areas: gardens, and terraces.
     7. Wi-Fi
     8. Safety and security4
              '''
              ,style:TextStyle(
                  fontSize: 20
                ),
              ),
            ),
            /*
            Padding(
              padding: const EdgeInsets.all(12.0),
              child: ElevatedButton(
                onPressed: (){
                  Navigator.pushNamed(context, MyRoutes.homeDetailsRoute);
                },  
                style: TextButton.styleFrom(backgroundColor: Colors.purple),
                child: Text("BACK TO HOTEL PAGE" ,
                  style: TextStyle(
                    fontSize: 15,
                  ),
                ),
              ),
            )*/
          ],
        ),
      ),
    );
  }
}
