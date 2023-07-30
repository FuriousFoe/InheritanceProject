import 'package:flutter/material.dart';
import 'package:flutter/src/animation/animation_controller.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/ticker_provider.dart';

class listpage extends StatefulWidget {
  const listpage({super.key});

  @override
  State<listpage> createState() => _listpageState();
}

class _listpageState extends State<listpage> {

  @override
  Widget build(BuildContext context) {
    var arrNames = [ 'Raju' , 'Raman' , 'Rohit' , 'Rajesh' , 'Rushikesh' , 'Ramanujan' , 'Roshni' , 'Rupali' ] ;

    return Scaffold(
      appBar: AppBar(),
      body: ListView.separated(itemBuilder:  (context, index) {
      return ListTile(
        leading: Text('${index+100}'),
        title: Text(arrNames[index]),
        subtitle: Text('B.Tech IT student'),
        trailing: Icon(Icons.person_add),
      ) ; 
      },
      itemCount: arrNames.length,
      separatorBuilder: (context, index) {
       return Divider(height: 15, thickness: 1,) ; 
      },
      )
    );
  }
}