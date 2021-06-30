import 'package:flutter/material.dart';
import 'countryHandler.dart';
import 'package:dsc_world/countryDetails.dart';
import 'package:shared_preferences/shared_preferences.dart';


// all countries in a selected continent with favourite icon
class Country extends StatefulWidget {
  const Country({Key key, this.coninent_key}) : super(key: key);
  final coninent_key;

  @override
  _CountryState createState() => _CountryState();
}

class _CountryState extends State<Country> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        decoration: BoxDecoration(
          image: DecorationImage(
            fit: BoxFit.fill,
            image: AssetImage('data/world.jpg'),
          ),
        ),
        child: FutureBuilder<Map>(
          future: CountryHandler().gac(),
          builder: (context, snapshot) {
            if (snapshot.data != null) {
              List<MapEntry> countries = snapshot.data.entries
                  .where((element) =>
                      element.value['continent'] == widget.coninent_key)
                  .toList();
              return ListView(
                children: List.generate(countries.length, (index) {
                  return Stack(
                    alignment: Alignment.topRight,
                    children: [
                      InkWell(
                        onTap: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => CountryDetails(
                                        details: countries[index].value,
                                      )));
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
                      ),
                      FavouriteIcon(data: countries, index: index),
                    ],
                  );
                }),
              );
            } //end of if
            else {
              return Center(
                child: CircularProgressIndicator(),
              );
            }
          },
        ),
      ),
    );
  }
}

class FavouriteIcon extends StatefulWidget {
  const FavouriteIcon({Key key, this.data, this.index}) : super(key: key);
  final List data;
  final int index;
  @override
  _FavouriteIconState createState() => _FavouriteIconState();
}

class _FavouriteIconState extends State<FavouriteIcon> {
  bool check = false;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 0, right: 10),
      child: IconButton(
          icon: Icon(
            (check) ? Icons.favorite : Icons.favorite_outline,
            color: Colors.indigo,
          ),
          onPressed: () async {
            SharedPreferences pref;
            while (pref == null) pref = await SharedPreferences.getInstance();
            setState(() {
              check = !check;
              List<String> list = [];

              if (pref.containsKey('Favourites'))
                list = pref.getStringList('Favourites');
              else
                pref.setStringList('Favourites', list);
              (check)
                  ? list.add(widget.data[widget.index].value['name'])
                  : list.remove(widget.data[widget.index].value['name']);
              pref.setStringList('Favourites', list);
            });
          }),
    );
  }
}
