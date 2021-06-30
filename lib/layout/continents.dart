import 'package:flutter/material.dart';
import 'package:dsc_world/continentHandler.dart';
import 'countries.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'countryHandler.dart';
import 'package:dsc_world/countryDetails.dart';

// the main screen which contains continents
class Continent extends StatefulWidget {
  Continent({Key key}) : super(key: key);

  @override
  _ContinentState createState() => _ContinentState();
}

class _ContinentState extends State<Continent> {
  int x = 0;
  List<String> list = [];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: Colors.indigo,
        selectedItemColor: Colors.white,
        items: [
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Home',
          ),
          BottomNavigationBarItem(
              icon: Icon(Icons.favorite), label: 'Favourite'),
        ],
        currentIndex: x,
        onTap: (index) async {
          SharedPreferences pref;
          if (index == 1)
            while (pref == null) pref = await SharedPreferences.getInstance();
          setState(() {
            x = index;
            if (index == 1) list = pref.getStringList('Favourites');
          });
        },
      ),
      appBar: AppBar(
        backgroundColor: Colors.indigo,

        // shadowColor: ,
        title: Text(
          'DSC WORLD',
          style: TextStyle(
              fontWeight: FontWeight.bold,
              color: Colors.white,
              letterSpacing: 4,
              fontStyle: FontStyle.italic),
        ),
        centerTitle: true,
      ),
      body: Container(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        decoration: BoxDecoration(
          image: DecorationImage(
            fit: BoxFit.fill,
            image: AssetImage('data/world.jpg'),
          ),
        ),
        child: (x == 0)
            ? FutureBuilder(
          //********************************************************
                // Home screen
                future: ContinentHandler().getAllcontinents(),
                builder: (context, snapshot) {
                  if (snapshot.data != null) {
                    Map data = snapshot.data;
                    return ListView(
                      children: List.generate(data.length, (index) {
                        return InkWell(
                            onTap: () => Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => Country(
                                          coninent_key:
                                              data.keys.elementAt(index),
                                        ))),
                            child: Container(
                              padding: EdgeInsets.all(30),
                              margin: EdgeInsets.symmetric(
                                  vertical: 10, horizontal: 20),
                              decoration: BoxDecoration(
                                  color: Colors.white,
                                  borderRadius: BorderRadius.circular(15)),
                              child: Center(
                                child: Text(
                                  data.values.elementAt(index).toString(),
                                  style: TextStyle(
                                      color: Colors.indigo,
                                      fontSize: 20,
                                      fontWeight: FontWeight.bold),
                                ),
                              ),
                            ));
                      }),
                    );
                  } //end of if
                  else {
                    return Center(
                      child: CircularProgressIndicator(),
                    );
                  }
                },
              )
            : FutureBuilder<Map>(
                future: CountryHandler().gac(),
                //***************************************************
                // Favourite screen
                builder: (context, snapshot) {
                  //  print(list);
                  if (snapshot.data != null) {
                    List<MapEntry> countries = snapshot.data
                        .cast<String, Map>()
                        .entries
                        .where((element) {
                      print(element.value['name']);
                      return list.contains(element.value['name']);
                    }).toList();
                    return ListView(
                      children: List.generate(countries.length, (index) {
                        return InkWell(
                          onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => CountryDetails(
                                  details: countries[index].value,
                                ),
                              ),
                            );
                          },
                          child: Container(
                            padding: EdgeInsets.all(30),
                            margin: EdgeInsets.symmetric(
                                vertical: 10, horizontal: 20),
                            decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.circular(15)),
                            child: Center(
                              child: Text(countries[index].value['name'],
                                  style: TextStyle(
                                      color: Colors.indigo,
                                      fontSize: 20,
                                      fontWeight: FontWeight.bold)),
                            ),
                          ),
                        );
                      }),
                    );
                  } //end of if
                  else {
                    return Container(
                      alignment: Alignment.center,
                      child: CircularProgressIndicator(),
                      width: MediaQuery.of(context).size.width,
                      height: MediaQuery.of(context).size.height,
                      decoration: BoxDecoration(
                        image: DecorationImage(
                          fit: BoxFit.fill,
                          image: AssetImage('data/world.jpg'),
                        ),
                      ),
                    );
                  }
                },
              ),
      ),
    );
  }
}
