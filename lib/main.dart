import 'package:flutter/material.dart';
import 'package:weather_app/data_service.dart';
import 'package:weather_app/model.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Weather',
      theme: ThemeData(
        // This is the theme of your application.
        //
        // Try running your application with "flutter run". You'll see the
        // application has a blue toolbar. Then, without quitting the app, try
        // changing the primarySwatch below to Colors.green and then invoke
        // "hot reload" (press "r" in the console where you ran "flutter run",
        // or simply save your changes to "hot reload" in a Flutter IDE).
        // Notice that the counter didn't reset back to zero; the application
        // is not restarted.
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  var _cityController = TextEditingController();
  final _dataService = DataService();

  var _response;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            if(_response != null)
              Column(
                children: [
                  Image.network(_response.imageURL),
                  Text("${_response.tempInfo.tempreture}", style: TextStyle(fontSize: 40),),
                  Text("${_response.weatherInfo.description}")
                ],
              ),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 50),
                child: SizedBox(
                  width: 150,
                  child: TextField(
                    controller: _cityController,
                    decoration: InputDecoration(labelText: "city"),
                    textAlign: TextAlign.center,
                  ),
                ),
              ),
            ElevatedButton(onPressed: _search, child: Text('search'),)
          ],
        ),
      )
    );
  }

  void _search() async{
    try{
      final response = await _dataService.getWeather(_cityController.text);
      setState(() {
        _response = response;
      });
    } catch(error){
      print(error);
    }
  }
}
