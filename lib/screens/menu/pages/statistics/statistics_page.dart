import 'package:coronaalert/screens/menu/pages/statistics/country/countries_page.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'state_card.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'dart:async';
import 'country/countries_page.dart';
import 'package:coronaalert/constants.dart';

bool showSpinner = false;

class StatisticsPage extends StatefulWidget {
  static const id = '/statistics_page';

  @override
  _StatisticsPageState createState() => _StatisticsPageState();
}

class _StatisticsPageState extends State<StatisticsPage> {
  int totalCases = 0;
  int active = 0;
  int deaths = 0;
  int recovered = 0;

  List countriesList;
  int numberOfCountries;

  Future getData() async {
    try {
      http.Response response = await http.get(apiURL + 'all');

      Map<String, dynamic> data = jsonDecode(response.body);

      if (response.statusCode >= 200 && response.statusCode <= 299) {
        print(response.statusCode);
        setState(() {
          totalCases = data['cases'];
          active = data['active'];
          deaths = data['deaths'];
          recovered = data['recovered'];
        });
      } else {
        //print(response.statusCode);
      }
    } catch (e) {
      print("Exception Caught which is " + e + ". Also status code is: ");
    }
  }

  Future getCountriesData() async {
    http.Response response = await http.get(apiURL + 'countries');
    if (response.statusCode >= 200 && response.statusCode <= 299) {
      setState(() {
        countriesList = jsonDecode(response.body);
        numberOfCountries = countriesList.length;
//        print(countriesList);
      });
    } else {
      print('Server Error:${response.statusCode}');
    }
  }

  @override
  void initState() {
    getData();
    getCountriesData();
//    Timer.periodic(Duration(hours: 3), (Timer t) => getCountriesData());
//    Timer.periodic(Duration(hours: 3), (Timer t) => getData());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Corona Statistics"),
        centerTitle: true,
      ),
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Padding(
              padding: EdgeInsets.all(20),
              child: Column(
                children: <Widget>[
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: <Widget>[
                      StateCard(
                          stateCardIcon: Icon(
                            FontAwesomeIcons.globeAmericas,
                            size: 30.0,
                            color: Colors.blueAccent,
                          ),
                          textNumber: totalCases.toString(),
                          catagoryName: 'Total Cases'),
                      SizedBox(
                        width: 16.0,
                      ),
                      StateCard(
                          stateCardIcon: Icon(
                            FontAwesomeIcons.flagCheckered,
                            size: 30.0,
                            color: Colors.orangeAccent,
                          ),
                          textNumber: active.toString(),
                          catagoryName: 'Active Cases'),
                    ],
                  ),
                  SizedBox(
                    height: 16.0,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: <Widget>[
                      StateCard(
                        stateCardIcon: Icon(
                          FontAwesomeIcons.skullCrossbones,
                          size: 30.0,
                          color: Colors.redAccent,
                        ),
                        textNumber: deaths.toString(),
                        catagoryName: 'Total Deaths',
                      ),
                      SizedBox(
                        width: 16.0,
                      ),
                      StateCard(
                        stateCardIcon: Icon(
                          FontAwesomeIcons.solidCheckCircle,
                          size: 30.0,
                          color: Colors.green,
                        ),
                        textNumber: recovered.toString(),
                        catagoryName: 'Recovered',
                      ),
                    ],
                  ),
                  Padding(
                    padding: EdgeInsets.symmetric(
                      horizontal: 20,
                      vertical: 10,
                    ),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: <Widget>[
                        SizedBox(
                          height: 20,
                        ),
                        Text(
                          'World Map of Infected COVID-19',
                          style: TextStyle(
                            decoration: TextDecoration.underline,
                            fontSize: 17,
                            color: Colors.black,
                            fontWeight: FontWeight.w900,
                          ),
                        ),
                        Center(
                          child: InkWell(
                            onTap: () {
                              Navigator.of(context).pushNamed(CountriesPage.id);
                            },
                            child: Container(
                              child: Image.asset(
                                'assets/images/statecoronamap.png',
                                height: 250.0,
                                fit: BoxFit.contain,
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
