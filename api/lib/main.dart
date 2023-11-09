import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart';

void main() {
  runApp(HomePage());
}

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => HomePageState();
}

class HomePageState extends State<HomePage> {
  Future<List> getdata() async {
    var response =
        await get(Uri.parse("https://jsonplaceholder.typicode.com/users"));
    List responsebody = jsonDecode(response.body);
    return responsebody;
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        home: Scaffold(
      appBar: AppBar(
        title: Text("RestfullApi_Testing"),
        actions: [],
      ),
      body: FutureBuilder<List>(
        future: getdata(),
        builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
 return Center(
                child: CircularProgressIndicator(),);}
             if (snapshot.connectionState == ConnectionState.done) {
                if (snapshot.hasData) {}
            
          
          if (snapshot.hasError) {
            return Text("Error occured");
          }
             
              
            
              return ListView.builder(
                  itemCount: snapshot.data!.length,
                  itemBuilder: (context, index) {
                    return ListTile(
                      title: Text("${snapshot.data![index]['name']}"),
                      subtitle: Text("${snapshot.data![index]}"),
                    );
                  });
            }
            return Text("");
        
         
        },
      ),
    ));
  }}
