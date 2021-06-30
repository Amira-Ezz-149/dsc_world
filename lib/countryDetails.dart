import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';


class CountryDetails extends StatelessWidget {
  CountryDetails({Key key, this.details}) : super(key: key);
  final Map details;
  final TextStyle klabelStyle =
      TextStyle(color: Colors.black, fontSize: 20, fontWeight: FontWeight.bold);
  final TextStyle kvalueStyle =
      TextStyle(color: Colors.black, fontSize: 20, fontWeight: FontWeight.bold);


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.indigo,
        title: Text('Details of ${details['name']} ${details['emoji']}'),
      ),
      body: SafeArea(
        child: Container(
          width: MediaQuery.of(context).size.width,
          height: MediaQuery.of(context).size.height,
         // color: Colors.red,
          decoration: BoxDecoration(
            image: DecorationImage(
              fit: BoxFit.fill,
              image: AssetImage('data/world.jpg'),
            ),
          ),
          child: ListView(
            children: [
              //*********************************** 1
              Container(
                child: Center(
                  child: Text('The Name : ${details['name']}',  style: TextStyle(
                      color: Colors.indigo,
                      fontSize: 20,
                      fontWeight: FontWeight.bold),),
                ),
                padding: EdgeInsets.all(30),
                margin: EdgeInsets.symmetric(
                    vertical: 10, horizontal: 20),
                decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(15)),
              ),
              //*********************************** 2
              Container(
                child: Center(
                  child: Text('The native : ${details['native']}',  style: TextStyle(
                      color: Colors.indigo,
                      fontSize: 20,
                      fontWeight: FontWeight.bold),),
                ),
                padding: EdgeInsets.all(30),
                margin: EdgeInsets.symmetric(
                    vertical: 10, horizontal: 20),
                decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(15)),
              ),
              //*********************************** 3
              Container(
                child: Center(
                  child: Text('The phone : ${details['phone']}',  style: TextStyle(
                      color: Colors.indigo,
                      fontSize: 20,
                      fontWeight: FontWeight.bold),),
                ),
                padding: EdgeInsets.all(30),
                margin: EdgeInsets.symmetric(
                    vertical: 10, horizontal: 20),
                decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(15)),

              ),
              //*********************************** 4
              Container(
                child: Center(
                  child: Text('The continent : ${details['continent']}',  style: TextStyle(
                      color: Colors.indigo,
                      fontSize: 20,
                      fontWeight: FontWeight.bold),),
                ),
                padding: EdgeInsets.all(30),
                margin: EdgeInsets.symmetric(
                    vertical: 10, horizontal: 20),
                decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(15)),

              ),
              //*********************************** 5
              Container(
                child: Center(
                  child: Text('The capital : ${details['capital']}',  style: TextStyle(
                      color: Colors.indigo,
                      fontSize: 20,
                      fontWeight: FontWeight.bold),),
                ),
                padding: EdgeInsets.all(30),
                margin: EdgeInsets.symmetric(
                    vertical: 10, horizontal: 20),
                decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(15)),

              ),
               //*********************************** 6
              Container(
                child: Center(
                  child: Text('The currency : ${details['currency']}',  style: TextStyle(
                      color: Colors.indigo,
                      fontSize: 20,
                      fontWeight: FontWeight.bold),),
                ),
                padding: EdgeInsets.all(30),
                margin: EdgeInsets.symmetric(
                    vertical: 10, horizontal: 20),
                decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(15)),

              ),
              //************************************ 7
              Container(
                child: Center(
                  child: Text('The languages : ${details['languages']}',  style: TextStyle(
                      color: Colors.indigo,
                      fontSize: 20,
                      fontWeight: FontWeight.bold),),
                ),
                padding: EdgeInsets.all(30),
                margin: EdgeInsets.symmetric(
                    vertical: 10, horizontal: 20),
                decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(15)),

              ),
              //************************************ 8
              Container(
                child: Center(
                  child: Text('The emoji : ${details['emoji']}',  style: TextStyle(
                      color: Colors.indigo,
                      fontSize: 20,
                      fontWeight: FontWeight.bold),),
                ),
                padding: EdgeInsets.all(30),
                margin: EdgeInsets.symmetric(
                    vertical: 10, horizontal: 20),
                decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(15)),

              ),
              //************************************ 9
              Container(
                child: Center(
                  child: Text('The emojiU : ${details['emojiU']}',  style: TextStyle(
                      color: Colors.indigo,
                      fontSize: 20,
                      fontWeight: FontWeight.bold),),
                ),
                padding: EdgeInsets.all(30),
                margin: EdgeInsets.symmetric(
                    vertical: 10, horizontal: 20),
                decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(15)),

              ),
            ],

          ),
        ),
      ),
    );
  }
}





/*

ListView(
children: List.generate(9, (index) {
return Container(
padding: EdgeInsets.all(30),
margin: EdgeInsets.symmetric(
vertical: 10, horizontal: 20),
decoration: BoxDecoration(
color: Colors.white,
borderRadius: BorderRadius.circular(15)),
child: Center(
child: Text(
countries[index].value['name'],
style: TextStyle(
color: Colors.indigo,
fontSize: 20,
fontWeight: FontWeight.bold)),
),
),


}),
);*/
