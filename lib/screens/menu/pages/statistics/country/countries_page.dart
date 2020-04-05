import 'dart:async';
import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:coronaalert/constants.dart';
import 'country_card.dart';

class CountriesPage extends StatefulWidget {
  static const id = '/countries_page';

  @override
  _CountriesPageState createState() => _CountriesPageState();
}

class _CountriesPageState extends State<CountriesPage> {
  Future<List<dynamic>> getCountriesData() async {
    try {
      http.Response response = await http.get(apiURL + 'countries/');

      List data = json.decode(response.body) as List;

      if (response.statusCode >= 200 && response.statusCode <= 299) {
        return data;
      } else {
        print(response.statusCode);
      }
    } catch (e) {
      print("Exception Caught which is " + e);
    }
  }

  String _countryName(Map<dynamic, dynamic> data) {
    return data['country'];
  }

  String _countryFlag(Map<dynamic, dynamic> data) {
    return data['countryInfo']['flag'];
  }

  String _totalCasesOfYourCountry(Map<dynamic, dynamic> data) {
    return data['cases'].toString();
  }

  String _todayCasesOfYourCountry(Map<dynamic, dynamic> data) {
    return data['todayCases'].toString();
  }

  String _activeCasesOfYourCountry(Map<dynamic, dynamic> data) {
    return data['active'].toString();
  }

  String _deathsOfYourCountry(Map<dynamic, dynamic> data) {
    return data['deaths'].toString();
  }

  String _recoveredOfYourCountry(Map<dynamic, dynamic> data) {
    return data['recovered'].toString();
  }

  @override
  void initState() {
    getCountriesData();
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
          future: getCountriesData(),
          builder: (BuildContext context, AsyncSnapshot snapshot) {
            if (snapshot.hasData) {
              return ListView.builder(
                  padding: EdgeInsets.all(12),
                  itemCount: snapshot.data.length,
                  scrollDirection: Axis.vertical,
                  shrinkWrap: true,
                  itemBuilder: (BuildContext context, int index) {
                    //_countryName(snapshot.data[index]),
                    return CountryCard(
                      countryName: _countryName(snapshot.data[index]),
                      countryFlag: _countryFlag(snapshot.data[index]),
                      totalCasesOfCountry:
                          _totalCasesOfYourCountry(snapshot.data[index]),
                      todayCasesOfCountry:
                          _todayCasesOfYourCountry(snapshot.data[index]),
                      activeCasesOfCountry:
                          _activeCasesOfYourCountry(snapshot.data[index]),
                      deaths: _deathsOfYourCountry(snapshot.data[index]),
                      recoveredOfCountry:
                          _recoveredOfYourCountry(snapshot.data[index]),
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
