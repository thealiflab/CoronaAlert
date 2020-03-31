import 'dart:async';
import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:coronaalert/constants.dart';

class CountriesPage extends StatefulWidget {
  static const id = '/countries_page';

  @override
  _CountriesPageState createState() => _CountriesPageState();
}

class _CountriesPageState extends State<CountriesPage> {
  Future<List<dynamic>> fetchCountries() async {
    var result = await http.get(apiURL + "countries");
    return json.decode((result.body));
  }

  String _cases(Map<dynamic, dynamic> user) {
    return "📌  Cases: " + user['cases'].toString();
  }

  String _casesToday(Map<dynamic, dynamic> user) {
    return "🔔  Today's Cases: " + user['todayCases'].toString();
  }

  String _deaths(Map<dynamic, dynamic> user) {
    return "💀  Deaths: " + user['deaths'].toString();
  }

  String _deathsToday(Map<dynamic, dynamic> user) {
    return "✔  Recovered: " + user['recovered'].toString();
  }

  String _location(Map<dynamic, dynamic> user) {
    return user['country'] + "\n";
  }

  @override
  void initState() {
    fetchCountries();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Infected Countries'),
        centerTitle: true,
      ),
      body: Container(
        child: FutureBuilder<List<dynamic>>(
          future: fetchCountries(),
          builder: (BuildContext context, AsyncSnapshot snapshot) {
            if (snapshot.hasData) {
              return ListView.builder(
                  padding: EdgeInsets.all(12),
                  itemCount: snapshot.data.length,
                  itemBuilder: (BuildContext context, int index) {
                    return Card(
                      child: Column(
                        children: <Widget>[
                          ListTile(
                            title: Center(
                              child: Text(
                                _location(snapshot.data[index]),
                                style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 24,
                                  decoration: TextDecoration.underline,
                                ),
                              ),
                            ),
                            subtitle: Center(
                              child: Text(
                                _cases(snapshot.data[index]) +
                                    "\n\n" +
                                    _casesToday(snapshot.data[index]) +
                                    "\n\n" +
                                    _deaths(snapshot.data[index]) +
                                    "\n\n" +
                                    _deathsToday(snapshot.data[index]),
                                style: TextStyle(
                                    color: Colors.black, fontSize: 16),
                              ),
                            ),
                          )
                        ],
                      ),
                    );
                  });
            } else {
              return Center(child: CircularProgressIndicator());
            }
          },
        ),
      ),
    );
  }
}
