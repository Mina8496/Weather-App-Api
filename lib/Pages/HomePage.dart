import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:weather_app_api/Models/WeatherModel.dart';
import 'package:weather_app_api/Pages/SearchPage.dart';
import 'package:weather_app_api/providers/Weather_provider.dart';

class HomePage extends StatefulWidget {
  @override
  State<HomePage> createState() => _HomePageState();
}

String? image;

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    WeatherModel? WeatherData =
        Provider.of<WeatherProvider>(context).WeatherData;
    try {
      image = WeatherData!.Icon;
    } catch (e) {
      Text("No Data Image");
    }

    return Scaffold(
      appBar: AppBar(
        backgroundColor: WeatherData?.getThemeColor(),
        actions: [
          IconButton(
              onPressed: () {
                Navigator.push(context, MaterialPageRoute(builder: (context) {
                  return SearchPage();
                }));
              },
              icon: const Icon(Icons.search))
        ],
        title: const Text('Weather App'),
      ),
      body: Provider.of<WeatherProvider>(context).WeatherData == null
          ? const Padding(
              padding: EdgeInsets.symmetric(horizontal: 16),
              child: Center(
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Text(
                      'there is no weather 😔 start',
                      style: TextStyle(
                        fontSize: 25,
                      ),
                    ),
                    Text(
                      'searching now 🔍',
                      style: TextStyle(
                        fontSize: 25,
                      ),
                    )
                  ],
                ),
              ),
            )
          : Container(
              decoration: BoxDecoration(
                  gradient: LinearGradient(colors: [
                WeatherData!.getThemeColor(),
                WeatherData.getThemeColor()[300]!,
                WeatherData.getThemeColor()[100]!
              ], begin: Alignment.topCenter, end: Alignment.bottomCenter)),
              child: Column(
                children: [
                  const SizedBox(
                    height: 110,
                  ),
                  Text(
                    WeatherData.CityName,
                    style: const TextStyle(
                        fontSize: 32, fontWeight: FontWeight.bold),
                  ),
                  Text(
                    WeatherData.Date,
                    style: const TextStyle(
                      fontSize: 22,
                    ),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      SizedBox(
                          width: 70,
                          height: 70,
                          child: Image.network("https:$image")),
                      Text(
                        WeatherData.Temp.toString(),
                        style: const TextStyle(
                            fontSize: 30, fontWeight: FontWeight.bold),
                      ),
                      Column(
                        children: [
                          Text(
                            WeatherData.MaxTemp.toString(),
                            style: const TextStyle(fontSize: 23),
                          ),
                          Text(
                            WeatherData.MinTemp.toString(),
                            style: const TextStyle(fontSize: 23),
                          )
                        ],
                      )
                    ],
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 2),
                    child: Text(
                      WeatherData.WeatherState,
                      style: const TextStyle(
                          fontSize: 30, fontWeight: FontWeight.bold),
                    ),
                  )
                ],
              ),
            ),
    );
  }
}
