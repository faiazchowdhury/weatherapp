import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import './weather_outputs.dart';


class findlocation extends StatefulWidget {
  findlocation() {}

  @override
  _LocationState createState() => new _LocationState();
}

class _LocationState extends State<findlocation> {
  ScrollController scrollController = new ScrollController();
  int closedTopCont = 0;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    scrollController.addListener(() {
      setState(() {
        closedTopCont = scrollController.offset.toInt();
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    return MaterialApp(
        theme: ThemeData(
          fontFamily: 'OpenSans',
        ),
        home: Container(
            decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage('assets/blue.jpg'),
                fit: BoxFit.cover,
              ),
            ),
            child: Scaffold(
                backgroundColor: Colors.transparent,
                body: ListView(
                  controller: scrollController,
                  children: [
                    AnimatedOpacity(
                      opacity: closedTopCont < 10
                          ? 1
                          : closedTopCont < 20
                              ? 0.8
                              : closedTopCont < 30
                                  ? 0.7
                                  : closedTopCont < 40
                                      ? 0.6
                                      : closedTopCont < 50
                                          ? 0.5
                                          : closedTopCont < 60
                                              ? 0.4
                                              : closedTopCont < 70
                                                  ? 0.3
                                                  : closedTopCont < 80
                                                      ? 0.2
                                                      : closedTopCont < 90
                                                          ? 0.1
                                                          : 0,
                      duration: const Duration(milliseconds: 200),
                      child: Container(
                        child: Column(
                          children: [
                            Text(
                              "${weather_outputs.w.temperature.celsius.toStringAsFixed(2)}\u00B0C",
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                fontSize: 45,
                              ),
                            ),
                            SizedBox(
                              height: 10,
                            ),
                            Row(
                              children: [
                                Expanded(
                                    child: Text(
                                  '${weather_outputs.w.weatherDescription.toUpperCase().substring(0, 1)}${weather_outputs.w.weatherDescription.substring(1)}',
                                  textAlign: TextAlign.center,
                                  textScaleFactor: 2,
                                  style: TextStyle(),
                                )),
                                Expanded(
                                    child: Image.asset(
                                        'assets/${weather_outputs.w.weatherIcon}.png'))
                              ],
                            ),
                            SizedBox(
                              height: 10,
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Icon(
                                  Icons.location_on,
                                  color: Colors.red,
                                ),
                                SizedBox(
                                  width: 5,
                                ),
                                Text(
                                  "${weather_outputs.w.areaName}",
                                  textAlign: TextAlign.center,
                                  style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 20),
                                ),
                              ],
                            )
                          ],
                        ),
                        padding: EdgeInsets.fromLTRB(30, 50, 30, 30),
                        margin: EdgeInsets.fromLTRB(80, 40, 80, 40),
                      ),
                    ),
                    Container(
                        margin: EdgeInsets.fromLTRB(10, 20, 10, 20),
                        padding: EdgeInsets.fromLTRB(10, 40, 10, 40),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(20),
                          border: Border.all(
                              color: Colors.black.withOpacity(0.1), width: 1),
                          boxShadow: [
                            BoxShadow(
                              color: Colors.lightBlueAccent.withOpacity(0.1),
                              spreadRadius: 1,
                              blurRadius: 1,
                              offset:
                                  Offset(0, 2), // changes position of shadow
                            ),
                          ],
                        ),
                        child: Column(children: [
                          Row(
                            children: [
                              Expanded(
                                  child: Column(
                                children: [
                                  SizedBox(
                                      height: 30,
                                      width: 30,
                                      child: Icon(
                                        Icons.wb_sunny,
                                        color: Colors.amber,
                                      )),
                                  SizedBox(
                                    height: 5,
                                  ),
                                  Text(
                                    "Sunrise",
                                    style: textstyling(),
                                  ),
                                  SizedBox(
                                    height: 5,
                                  ),
                                  Text(
                                    "${weather_outputs.w.sunrise.hour}:${weather_outputs.w.sunrise.minute}",
                                    style: textstylingbody(),
                                  ),
                                ],
                              )),
                              Expanded(
                                  child: Column(
                                children: [
                                  Icon(
                                    Icons.nights_stay_outlined,
                                    color: Colors.black,
                                  ),
                                  SizedBox(
                                    height: 5,
                                  ),
                                  Text("Sunset", style: textstyling()),
                                  SizedBox(
                                    height: 5,
                                  ),
                                  Text(
                                    "${weather_outputs.w.sunset.hour}:${weather_outputs.w.sunset.minute}",
                                    style: textstylingbody(),
                                  ),
                                ],
                              ))
                            ],
                          ),
                          SizedBox(
                            height: 30,
                          ),
                          Row(
                            children: [
                              columnCreator("Feels Like",
                                  "${weather_outputs.w.tempFeelsLike.celsius.toStringAsFixed(2)}\u00B0C"),
                              columnCreator("Humidity",
                                  "${weather_outputs.w.humidity.toInt()}%"),
                            ],
                          ),
                          SizedBox(
                            height: 30,
                          ),
                          Row(
                            children: [
                              columnCreator("Wind Speed",
                                  "${weather_outputs.w.windSpeed.toStringAsFixed(2)} km/h"),
                              columnCreator("Pressure",
                                  "${weather_outputs.w.pressure.toInt()} hPa"),
                            ],
                          ),
                          SizedBox(
                            height: 30,
                          ),
                          Row(
                            children: [
                              columnCreator("Maximum\nTemperature",
                                  "${weather_outputs.w.tempMax.celsius.toStringAsFixed(2)}\u00B0C"),
                              columnCreator("Minimum\n Temperature",
                                  "${weather_outputs.data["daily"][0]["temp"]["min"].toStringAsFixed(2)}\u00B0C")
                            ],
                          ),
                        ])),
                    Container(
                      margin: EdgeInsets.fromLTRB(10, 40, 10, 10),
                      alignment: Alignment.center,
                      padding: EdgeInsets.all(10),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        border: Border.all(
                            color: Colors.black.withOpacity(0.1), width: 1),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.lightBlueAccent.withOpacity(0.1),
                            spreadRadius: 1,
                            blurRadius: 1,
                            offset: Offset(0, 2), // changes position of shadow
                          ),
                        ],
                      ),
                      child: Text(
                        "Hourly Weather Forecast",
                        style: TextStyle(
                          fontWeight: FontWeight.w400,
                          fontSize: 20,
                        ),
                      ),
                    ),
                    Container(
                      margin: EdgeInsets.fromLTRB(00, 0, 0, 0),
                      child: SingleChildScrollView(
                          scrollDirection: Axis.horizontal,
                          child: Container(
                              child: FittedBox(
                            fit: BoxFit.fill,
                            child: Row(
                              children: [
                                hourlyForecast(-1),
                                hourlyForecast(0),
                                hourlyForecast(1),
                                hourlyForecast(2),
                                hourlyForecast(3),
                                hourlyForecast(4),
                                hourlyForecast(5),
                                hourlyForecast(6),
                                hourlyForecast(7)
                              ],
                            ),
                          ))),
                    ),
                    Container(
                      margin: EdgeInsets.fromLTRB(10, 40, 10, 10),
                      alignment: Alignment.center,
                      padding: EdgeInsets.all(10),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        border: Border.all(
                            color: Colors.black.withOpacity(0.1), width: 1),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.lightBlueAccent.withOpacity(0.1),
                            spreadRadius: 1,
                            blurRadius: 1,
                            offset: Offset(0, 2), // changes position of shadow
                          ),
                        ],
                      ),
                      child: Text(
                        "7 Days Weather Forecast",
                        style: TextStyle(
                          fontWeight: FontWeight.w400,
                          fontSize: 20,
                        ),
                      ),
                    ),
                    Container(
                      margin: EdgeInsets.fromLTRB(0, 0, 0, 80),
                      child: SingleChildScrollView(
                        scrollDirection: Axis.horizontal,
                        child: Container(
                          child: FittedBox(
                            fit: BoxFit.fill,
                            child: Row(
                              children: [
                                foreCastListCreator(1),
                                foreCastListCreator(2),
                                foreCastListCreator(3),
                                foreCastListCreator(4),
                                foreCastListCreator(5),
                                foreCastListCreator(6),
                                foreCastListCreator(7),
                              ],
                            ),
                          ),
                        ),
                      ),
                    )
                  ],
                ))));
  }

  Widget columnCreator(
    String title,
    String value,
  ) {
    return Expanded(
        child: Column(
      children: [
        Text(title, textAlign: TextAlign.center, style: textstyling()),
        SizedBox(
          height: 10,
        ),
        Text(
          value,
          textAlign: TextAlign.center,
          style: textstylingbody(),
        )
      ],
    ));
  }

  Widget foreCastListCreator(int index) {
    DateTime date = DateTime.now();
    return Padding(
      padding: const EdgeInsets.all(8),
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(5),
          border: Border.all(color: Colors.black.withOpacity(0.1), width: 1),
          boxShadow: [
            BoxShadow(
              color: Colors.lightBlueAccent.withOpacity(0.1),
              spreadRadius: 1,
              blurRadius: 1,
              offset: Offset(0, 2), // changes position of shadow
            ),
          ],
        ),
        padding: EdgeInsets.all(10),
        child: Column(
          children: [
            Text(DateFormat('EEEE').format(date.add(new Duration(days: index))),
                style: TextStyle(
                  fontWeight: FontWeight.w600,
                  fontSize: 15,
                )),
            SizedBox(
              height: 2,
            ),
            Text(DateFormat('MMMd').format(date.add(new Duration(days: index))),
                style: TextStyle(
                  fontWeight: FontWeight.w600,
                  fontSize: 15,
                )),
            Row(
              children: [
                Text(
                    "${weather_outputs.data["daily"][index]["weather"][0]["main"]}",
                    style: TextStyle(
                      fontWeight: FontWeight.w500,
                      fontSize: 15,
                    )),
                SizedBox(
                  height: 40,
                  width: 40,
                  child: Image.asset(
                      'assets/${weather_outputs.data["daily"][index]["weather"][0]["icon"]}.png'),
                ),
              ],
            ),
            Text(
                "${weather_outputs.data["daily"][index]["temp"]["min"].toStringAsFixed(2)}\u00B0 / ${weather_outputs.data["daily"][index]["temp"]["max"].toStringAsFixed(2)}\u00B0",
                style: TextStyle(
                  fontWeight: FontWeight.w500,
                  fontSize: 15,
                ))
          ],
        ),
      ),
    );
  }

  Widget hourlyForecast(int index) {
    return Padding(
      padding: const EdgeInsets.all(8),
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(5),
          border: Border.all(color: Colors.black.withOpacity(0.1), width: 1),
          boxShadow: [
            BoxShadow(
              color: Colors.lightBlueAccent.withOpacity(0.1),
              spreadRadius: 1,
              blurRadius: 1,
              offset: Offset(0, 2), // changes position of shadow
            ),
          ],
        ),
        padding: EdgeInsets.fromLTRB(15, 15, 15, 15),
        child: Column(
          children: [
            Text(
              index == -1
                  ? "Time"
                  : "${weather_outputs.datafor[index].date.hour}:00",
              style: TextStyle(
                  fontWeight: FontWeight.w600,
                  fontSize: 15,
                  fontStyle: index == -1 ? FontStyle.italic : FontStyle.normal),
            ),
            SizedBox(
              height: 10,
            ),
            Text(
                index == -1
                    ? "Temperature"
                    : "${weather_outputs.datafor[index].temperature.celsius.toStringAsFixed(2)}\u00B0",
                style: TextStyle(
                    fontWeight: index == -1 ? FontWeight.w600 : FontWeight.w500,
                    fontSize: 15,
                    fontStyle:
                        index == -1 ? FontStyle.italic : FontStyle.normal)),
            SizedBox(
              height: 10,
            ),
            Text(
                index == -1
                    ? "Humidity"
                    : "${weather_outputs.datafor[index].humidity.toInt()}%",
                style: TextStyle(
                    fontWeight: index == -1 ? FontWeight.w600 : FontWeight.w500,
                    fontSize: 15,
                    fontStyle:
                        index == -1 ? FontStyle.italic : FontStyle.normal)),
          ],
        ),
      ),
    );
  }

  textstyling() {
    return TextStyle(
      fontWeight: FontWeight.w400,
      fontSize: 17,
    );
  }

  textstylingbody() {
    return TextStyle(
      fontWeight: FontWeight.w600,
      fontSize: 18,
    );
  }
}
