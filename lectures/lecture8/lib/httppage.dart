import 'dart:convert';

import 'package:demo_http/album_model.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class AlbumProvider {
  static Future<List<AlbumModel>> fetchAlbums () async {
    final response = await http
      .get(Uri.parse('https://jsonplaceholder.typicode.com/albums'));
    final list = jsonDecode(response.body);
    return (list as List).map((e) => AlbumModel.fromJson(e)).toList();
  }
}

class Httppage extends StatefulWidget {
  const Httppage({ Key? key }) : super(key: key);

  @override
  _HttppageState createState() => _HttppageState();
}

class _HttppageState extends State<Httppage> {
  late final AlbumProvider albumProvider;
  Future<List<AlbumModel>>? future; 

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    albumProvider = AlbumProvider();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Title'),
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              ElevatedButton(onPressed: () {
                setState(() {
                  future = AlbumProvider.fetchAlbums();
                });
              }, child: const Text('Get album')),
              FutureBuilder(future: future, builder: ((context, snapshot) {
                if(snapshot.data != null && snapshot.hasData) {
                  return Column(
                    children: [
                      ...snapshot.data?.map((e) => Row(
                        children: [
                          Text('UserId: ${e.userId}'),
                          Text('Id: ${e.id}'),
                          Text('title: ${e.title}'),
                        ],) ) ?? []
                  ],);
                }

                return Text('Data is empty');
              }))
            ],
          ),)),
    );
  }
}