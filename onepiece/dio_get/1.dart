// -------------------------------------------------------------------
import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:dio/dio.dart';
import 'package:google_fonts/google_fonts.dart';
// import 'package:labourproject/repository/super_repository.dart'
import 'package:labourproject/repository/super_repository.dart';
void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  // const MyApp({Key? key}) : super(key: key);
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        textTheme: GoogleFonts.comicNeueTextTheme(), // Apply Google Fonts theme
      ),
      // theme: ThemeData(
      //   primarySwatch: Colors.green,
      // ),
      home: const MyHomePage(),
      debugShowCheckedModeBanner: false,
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key}) : super(key: key);

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  var jsonList;
  @override
  void initState() {
    getData();
  }

  void getData() async {
    try {
      var response = await Dio()
          // .post('https://jsonplaceholder.typicode.com/posts/1');
          .get('https://protocoderspoint.com/jsondata/superheros.json');
          // .get('https://api.openweathermap.org/data/2.5/weather?q=dubai&units=metric&appid=ab4d83ded0552485cb5fdd7e4331e0af');
          // .get('https://164.100.196.159/Labour_Api/api/Master/GetListofForms');
      // https://api.openweathermap.org/data/2.5/weather?q=dubai&units=metric&appid=ab4d83ded0552485cb5fdd7e4331e0af
            print(response.data.toString());
      if(response.statusCode == 200){
        setState((){
          jsonList=response.data['superheros'] as List;
        });
      }else{
        print(response.statusCode);
      }
    } catch (e) {
      print(e);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Super Heroes',
            style: TextStyle(
                color: Colors.white,
              fontWeight: FontWeight.bold,
            ),
        ),
        centerTitle: true,
        backgroundColor:const Color(0xff314028),
      ),
      body: ListView.builder(
          // itemCount: 10,
        itemCount: jsonList == null ? 0:jsonList.length,
          itemBuilder: (BuildContext context, int index) {
            return Card(
              color: const Color(0xff252d1e),
                child: ListTile(
                  // title: Text('name'),
                  // subtitle: Text('power'),
                  leading:ClipRRect(
                    borderRadius:BorderRadius.circular(10),
                      child:Image.network(
                        jsonList[index]['url'],
                        fit:BoxFit.fill,
                        width:50,
                        height:50,
                      ),
                  ),
                  title: Text(jsonList[index]['name'],
                      style:const TextStyle(
                        color: Color(0xffe4e8dc),
                        fontWeight: FontWeight.bold,
                      ),
                  ),
                  subtitle: Text(jsonList[index]['power'],
                    style:const TextStyle(color:Color(0xffd1dac8),
                    ),
                  ),
                ),
            );
          }),
      backgroundColor:const Color(0xff1f2418),
    );
  }
}
