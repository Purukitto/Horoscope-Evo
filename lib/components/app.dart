import 'package:flutter/material.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:horoscope_evo/components/utils/colors.dart';
import 'package:horoscope_evo/components/JSON/horoscope.dart';

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => new _MyAppState();
}

Horoscope horoscopeDaily;

class _MyAppState extends State<MyApp> {
  @override
  void initState() {
    super.initState();
    fetchData();
  }

  bool isLoading = false;
  var _zodiac;

  fetchData() async {
    setState(() {
      isLoading = true; //Data is loading
    });
    _zodiac = "virgo";
    var url = "http://horoscope-api.herokuapp.com/horoscope/today/" + _zodiac;
    var res = await http.get(url);
    var horoscope = jsonDecode(res.body);
    horoscopeDaily = Horoscope.fromJson(horoscope);

    setState(() {
      isLoading = false; //Data has loaded
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: primaryBlack,
      drawer: Drawer(
        elevation: 5,
      ),
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
      ),
      body: isLoading
          ? Center(
              child: CircularProgressIndicator(),
            )
          : Row(
              children: <Widget>[
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: Text(
                      horoscopeDaily.horoscope,
                      style: TextStyle(color: primaryPink),
                    ),
                  ),
                ),
              ],
            ),
    );
  }
}
