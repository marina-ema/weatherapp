import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:weatherapp/Modle.dart';

class WeatherScreen extends StatefulWidget {
  const WeatherScreen({Key? key}) : super(key: key);

  @override
  State<WeatherScreen> createState() => _WeatherScreenState();
}

class _WeatherScreenState extends State<WeatherScreen> {
  late WeatherModle1 weatherModle1;
  Dio dio = Dio();
  String baseurl = "http://api.weatherapi.com/v1";
  String Apikey = "ebde3f6ba6e94f52bf2104645232009";
  String city = "Sohag";

  bool isLoading = true;
  void initState() {
    super.initState();
    getWatherdata();
  }

  Future<void> getWatherdata() async {
    final response = await dio.get(
        '$baseurl/forecast.json?key=$Apikey &q=$city&days=1&aqi=no&alerts=no');
    weatherModle1 = WeatherModle1.fromJost(response.data);
    setState(() {});

    isLoading = false;
    print(weatherModle1.image);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blue,
        title: Text("Weather App"),
        centerTitle: true,
      ),
      body: isLoading
          ? Center(child: CircularProgressIndicator())
          : Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    '${weatherModle1.cityName}',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 32,
                    ),
                  ),
                  Text(
                    'updated at ${weatherModle1.lastDate}',
                    style: TextStyle(
                      fontSize: 24,
                    ),
                  ),
                  SizedBox(
                    height: 32,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Image.network(
                        "https:${weatherModle1.image}",
                        height: 100,
                      ),
                      Text(
                        '${weatherModle1.temp}°C',
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 32,
                        ),
                      ),
                      Column(
                        children: [
                          Text(
                            'Maxtemp:${weatherModle1.maxtemp}°C',
                            style: TextStyle(
                              fontSize: 16,
                            ),
                          ),
                          Text(
                            'Mintemp:${weatherModle1.mintemp}°C',
                            style: TextStyle(
                              fontSize: 16,
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 32,
                  ),
                  Text(
                    '${weatherModle1.Weathercondition}',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 32,
                    ),
                  ),
                ],
              ),
            ),
    );
  }
}
