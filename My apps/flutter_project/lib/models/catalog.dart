import 'dart:convert';

class CatalogModel {
   static List<Item> items = [
            Item( id: 1,
            name: "Kapol Hostel",
            desc: "Ek baar aooge , apna ghar bhul jaoge",
            price: 1999,
            color: "#33505a",
            image: "https://pix8.agoda.net/hotelImages/124/1246280/1246280_16061017110043391702.jpg?ca=6&ce=1&s=1024x768"
 
   ),
   
   Item( 
           id: 2,
            name: "VJTI Hostel",
            desc: "Entry on basis on vjti id :) ",
            price: 69,
            color: "#00ac51",
            image: "https://www.itchotels.com/content/dam/itchotels/in/umbrella/images/headmast-desktop/itc-royalbengal.jpg"
    
   ),

   Item( id: 3,
        name: "ShreeNath Pg",
        desc: "Epitome of Pg hostels",
        price: 1099,
        color: "#e0bfae",
        image: "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRKypMyL6ZS_dfDVEo54a1tM8pavKiasB24Zw&usqp=CAU"
 
   ),

   Item(   id: 4,
            name: "Playstation Hills",
            desc: "Ausipious Hostel campus ",
            price: 500,
            color: "#544ee4",
            image: "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcT_AIWFLtE7y_MeNUuAgjemeodRBnx2BtrAyg&usqp=CAU"
 
   ),
   Item(  id: 5,
          name: "Dwarka ",
          desc: "Heaven for students ",
          price: 200,
          color: "#e3e4e9",
          image: "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRuPdp7R-5NuAX1RuGR-_nnfEiNZLsZSHVVttAhpH89jSQS__5NJzFMT9wj8sspyL7Jf7s&usqp=CAU"
   ),
   Item(  id: 6,
          name: "Kedar Hostel",
          desc: "Pehle istemal karo fir wishvas karo",
          price: 799,
          color: "#f73984",
          image: "http://cdn.cnn.com/cnnnext/dam/assets/211110114521-08-floating-hotel-gallery-11092021.jpg"
 
   ),

    Item( id: 7,
          name: "Jhol-Mol Colony",
          desc: "Golmaal hai bhai !!!",
          price: 1299,
          color: "#1c1c1c",
          image: "http://cdn.cnn.com/cnnnext/dam/assets/211110114521-08-floating-hotel-gallery-11092021.jpg"
    ),

    Item(
          id: 8,
          name: "Paradise ",
          desc: "Most convinient hostel for students",
          price: 899,
          color: "#7c95eb",
          image: "https://www.tajhotels.com/content/dam/luxury/tle/16x7/Exterior-16x7.jpg/jcr:content/renditions/cq5dam.web.1280.1280.jpeg" )  
   ];
  // Get Item by ID
  static Item getById(int id) =>
      items.firstWhere((element) => element.id == id, orElse: null);

  // Get Item by position
  static Item getByPosition(int pos) => items[pos];
}

class Item {
  final int id;
  final String name;
  final String desc;
  final num price;
  final String color;
  final String image;

  Item({
    required this.id,
    required this.name,
    required this.desc,
    required this.price,
    required this.color,
    required this.image,
  });

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'name': name,
      'desc': desc,
      'price': price,
      'color': color,
      'image': image,
    };
  }

  factory Item.fromMap(Map<String, dynamic> map) {
    return Item(
      id: map['id'],
      name: map['name'],
      desc: map['desc'],
      price: map['price'],
      color: map['color'],
      image: map['image'],
    );
  }
}