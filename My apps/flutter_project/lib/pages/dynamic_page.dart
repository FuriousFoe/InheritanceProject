import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_project/utils/routes.dart';
import 'package:velocity_x/velocity_x.dart';
import 'dart:math' ;

class Dropdown extends StatefulWidget {
  @override
  State<Dropdown> createState() => _DropdownState();
}

class _DropdownState extends State<Dropdown> {
  // const Dropdown({super.key});
  late int RoomSize = 1;
  late int People  = 1;
  int Result = 0 ;
  
  int Calculate(int RoomSize , int People){

    if(RoomSize == 1){
      if(People == 1){
        Result = 2000;
        return Result ; 
      }
      else if(People == 2){
        return Result = 1500 ;
      }
      else{
        Result = 0;
        return Result ;
      }
    }

    else if(RoomSize == 2){
       if(People == 1){
        Result = 3000;
        return Result ; 
      }
      else if(People == 2){
        return Result = 2000 ;
      }
      else if(People == 3){
        return Result = 1500 ;
      }
      else{
        int ans = 0 ;
        return ans ;
      }
    }

    else{
      if(People == 1){
      Result = 4000;
        return Result ; 
      }
      else if(People == 2){
        return Result = 3000 ;
      }
      else if(People == 3){
        return Result = 2500 ;
      }
      else if(People == 4 ){
        return Result = 2000 ;
      }
      else{
        int ans = 0 ;
        return ans ;
      }
    }
  }
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar (),
      body: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Padding(
            //   padding: const EdgeInsets.all(8.0),
            //   child: GestureDetector(
            //     onTap: () {
            //       // Put here Navigator.pop() function
            //       Navigator.pushNamed(context, MyRoutes.homeRoute ); 
            //     },
            //     child: Icon(Icons.arrow_back),
            //   ),
            // ),
            const SizedBox(
              height: 10,
            ),
            const Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(
                'Input required :-',
                style: TextStyle(
                  color: Colors.black ,
                  fontSize: 18, 
                  ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Container(
                padding:  EdgeInsets.only(left: 8, right: 8),
                decoration: BoxDecoration(
                  border: Border.all(color: Colors.grey , width: 2 ),
                  borderRadius: BorderRadius.circular(15) 
                  ),
                child: DropdownButton(
                  iconSize: 30,
                  value: RoomSize ,
                   onChanged: (value) {
                     setState(() {
                       RoomSize = value! ;
                     });
                    },
                  isExpanded: true,
                  items: const [
                    DropdownMenuItem(
                      value: 1,
                      child: Text('1 BHK'),
                    ),
                    DropdownMenuItem(
                      value: 2,
                      child: Text('2 BHK'),
                    ),
                    DropdownMenuItem(
                      value: 3,
                      child: Text('3 BHK'),
                    ),
                  ],
                  
                  hint: Text('Select Room Size'),
                  focusColor: Colors.black,
                  borderRadius: BorderRadius.circular(17),
                  autofocus: true,
                ),
              ),
            ),
            const SizedBox(
              height: 30,
            ),
            const Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text('No of People :-' ,
              style: TextStyle(
                  color: Colors.black ,
                  fontSize: 18, 
                  ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Container(
                padding:  EdgeInsets.only(left: 8, right: 8),
                decoration: BoxDecoration(
                  border: Border.all(color: Color.fromARGB(255, 0, 0, 0) , width: 2 ),
                  borderRadius: BorderRadius.circular(15) 
                  ),
                child: DropdownButton(
                  iconSize: 30,
                  value : People ,
                  onChanged: (value) {
                    setState(() {
                      People = value! ;
                    });
                  },
                  isExpanded: true,
                  items: const [
                    DropdownMenuItem(
                      value: 1,
                      child: Text('1 '),
                    ),
                    DropdownMenuItem(
                      value: 2,
                      child: Text('2 '),
                    ),
                    DropdownMenuItem(
                      value: 3,
                      child: Text('3 '),
                    ),
                    DropdownMenuItem(
                      value: 4,
                      child: Text('4 '),
                    ),
                  ],
                 
                  hint: Text('No Of Person :'),
                  focusColor: Colors.black,
                  borderRadius: BorderRadius.circular(18),
                  autofocus: true,
                ),
              ),
            ),
             Padding(
              padding: const EdgeInsets.all(12.0),
              child: ElevatedButton(
                  onPressed: (){
                    setState(() {
                      Calculate(RoomSize, People) ;
                    });
                  },
                style: TextButton.styleFrom(backgroundColor: Colors.blueAccent),
                  child: Center(child: Text('Enter' , 
                  style: TextStyle(
                   color: Colors.black ,
                   fontSize: 18, 
                   ),
                 )),
              ),
            ),
            
            Row(
              children: [
                const Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text('Rent : '  ,
                  style: TextStyle( 
                    fontSize: 18 ,
                  ),
                  ),
                ),
                Container(
              child: Padding(
                padding: EdgeInsets.only(top: 2.0, left: 10, right: 10),
                 child: 
                 Text( Result.toString() + " Rs "  )
                 ),
              ),
              ],
            ),
            const SizedBox(
              height: 20,
            ),
            const Divider(
              color: Color.fromARGB(66, 0, 0, 0),
              thickness: 2,
            ),
            const Align(
              child: Text(
                'Current Status ',
                style:
                    TextStyle(color: Colors.blue, fontWeight: FontWeight.bold , fontSize:18 ),
              ),
            ),
            Row(
              children: [
                Checkbox(value: false, onChanged: (value) {} ),
                const Text(
                  'Vacant',
                  style: TextStyle(color: Colors.black38),
                )
              ],
            ),
            Row(
              children: [
                Checkbox(value: false, onChanged: (value) {}),
                const Text(
                  'UpComing vacancy ',
                  style: TextStyle(color: Colors.black38),
                )
              ],
            ),
            Row(
              children: [
                Checkbox(value: false, onChanged: (value) {}),
                const Text(
                  ' Occupied',
                  style: TextStyle(color: Colors.black38),
                )
              ],
            ),
          ],
        ),
      ),
    );
  }
}
