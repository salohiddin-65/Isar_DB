import 'package:flutter/material.dart';
import 'package:pokemon_service/service/pokemon_service.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Users Service")),
      body: FutureBuilder(
        future: UsersService.getUser(),
        builder: (context, AsyncSnapshot snapshot) {
          if (!snapshot.hasData) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          } else if (snapshot.hasError) {
            return Center(
              child: Text(snapshot.error.toString()),
            );
          } else {
            return ListView.builder(
              itemCount: (snapshot.data as List).length,
              itemBuilder: (context, index) {
                return ListTile(
                  title: Text(snapshot.data[index]['name'].toString()),
                  subtitle: Text(snapshot.data[index]['email'].toString()),
                  trailing: Text(
                      snapshot.data[index]['address']['geo']['lat'].toString()),
                );
              },
            );
          }
        },
      ),
    );
  }
}
