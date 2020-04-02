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

  String countryName;
  int totalCasesOfYourCountry = 0;
  int todayCasesOfYourCountry = 0;
  int activeCasesOfYourCountry = 0;
  int deathsOfYourCountry = 0;
  int recoveredOfYourCountry = 0;
  String countryFlag;

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

  Future getCountryData() async {
    try {
      http.Response response = await http.get(apiURL + 'countries/bangladesh');

      Map<String, dynamic> data = jsonDecode(response.body);

      if (response.statusCode >= 200 && response.statusCode <= 299) {
        print(response.statusCode);
        setState(() {
          countryName = data['country'];
          totalCasesOfYourCountry = data['cases'];
          todayCasesOfYourCountry = data['todayCases'];
          activeCasesOfYourCountry = data['active'];
          deathsOfYourCountry = data['deaths'];
          recoveredOfYourCountry = data['recovered'];
          countryFlag = data['countryInfo']['flag'];
        });
      } else {
        print(response.statusCode);
      }
    } catch (e) {
      print("Exception Caught which is " + e + ". Also status code is: ");
    }
  }

  @override
  void initState() {
    getData();
    getCountryData();
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
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: <Widget>[
                  Center(
                    child: Text(
                      'World Wide',
                      style: TextStyle(
                        fontSize: 17,
                        color: Colors.black,
                        fontWeight: FontWeight.w900,
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 10,
                  ),
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
                        catagoryName: 'Total Cases',
                      ),
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
                        catagoryName: 'Active Cases',
                      ),
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
                  SizedBox(
                    height: 20,
                  ),
                  Center(
                    child: Text(
                      'Your Country\'s Statistics',
                      style: TextStyle(
                        fontSize: 17,
                        color: Colors.black,
                        fontWeight: FontWeight.w900,
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Card(
                    color: Colors.white,
                    elevation: 8.0,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.all(
                        Radius.circular(10),
                      ),
                    ),
                    child: Padding(
                      padding: EdgeInsets.all(12.0),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: <Widget>[
                              Text(
                                '$countryName',
                                style: TextStyle(
                                  fontSize: 27,
                                ),
                              ),
                              SizedBox(
                                width: 7.0,
                              ),
                              Image.network(
                                '$countryFlag',
                                width: 25,
                                height: 25,
                                fit: BoxFit.contain,
                              ),
                            ],
                          ),
                          SizedBox(
                            height: 10,
                          ),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: <Widget>[
                              Text(
                                '📌 Total Cases: $totalCasesOfYourCountry',
                                style: kCountryCardTextStyle,
                              ),
                              SizedBox(
                                height: 8.0,
                              ),
                              Text(
                                '📈 Today\'s Cases: $todayCasesOfYourCountry',
                                style: kCountryCardTextStyle,
                              ),
                              SizedBox(
                                height: 8.0,
                              ),
                              Text(
                                '🔔 Active Cases: $activeCasesOfYourCountry',
                                style: kCountryCardTextStyle,
                              ),
                              SizedBox(
                                height: 8.0,
                              ),
                              Text(
                                '💀 Deaths: $totalCasesOfYourCountry',
                                style: kCountryCardTextStyle,
                              ),
                              SizedBox(
                                height: 8.0,
                              ),
                              Text(
                                '✔ Recoverd: $recoveredOfYourCountry',
                                style: kCountryCardTextStyle,
                              ),
                            ],
                          )
                        ],
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 15,
                  ),
                  GestureDetector(
                    child: Center(
                      child: Text(
                        'See More Countries',
                        style: TextStyle(
                          fontSize: 16,
                          color: Colors.blue,
                          decoration: TextDecoration.underline,
                        ),
                      ),
                    ),
                    onTap: () {
                      Navigator.of(context).pushNamed(CountriesPage.id);
                    },
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
