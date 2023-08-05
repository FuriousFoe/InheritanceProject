//import 'package:buttons/utiles/routes.dart';
import 'package:flutter/material.dart';
import 'package:flutter_project/utils/routes.dart';

class Home extends StatelessWidget {
  const Home({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Buttons" ,
         style:TextStyle(color: Colors.black , fontSize: 20)),
      ),
      body: Container(
        child : Row(
          children: <Widget>[
            SizedBox(height: 25,),
            Padding(
              padding: const EdgeInsets.all(12.0),
              child: ElevatedButton(
                  onPressed: (){
                    Navigator.pushNamed(context,MyRoutes.termsRoute);
                  },
                style: TextButton.styleFrom(backgroundColor: Colors.purple),
                  child: Icon(
                    Icons.app_registration,
                  ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(12.0),
              child: ElevatedButton(
                onPressed: (){
                  Navigator.pushNamed(context, MyRoutes.facilityRoute);
                },
                style: TextButton.styleFrom(backgroundColor: Colors.purple),
                child:Icon(
                  Icons.assignment_late,
                )
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(12.0),
              child: ElevatedButton(
                  onPressed: (){
                    Navigator.pushNamed(context, MyRoutes.facilityRoute);
                  },
                  style: TextButton.styleFrom(backgroundColor: Colors.purple),
                  child:Icon(
                    Icons.assignment_late,
                  )
              ),
            ),
          ],
        ),
      ),
    );
  }
}
