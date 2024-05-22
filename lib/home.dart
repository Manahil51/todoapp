import 'package:flutter/material.dart';

class HomeView extends StatefulWidget {
  const HomeView({super.key});

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  TextEditingController studentnamecontrolller = TextEditingController();
  final List<String> studentNames = ["bilal", "ali", "sara", "aleena"];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: TextField(
          controller: studentnamecontrolller,
        ),
      ),
      body: studentNames.isEmpty
          ? const Center(
              child: Text("No student registered yet"),
            )
          : ListView.builder(
              itemCount: studentNames.length,
              itemBuilder: (BuildContext context, int index) {
                return Container(
                  padding: const EdgeInsets.only(bottom: 10),
                  child: ListTile(
                    tileColor: Colors.red,
                    title: Text(
                      studentNames[index],
                      style: const TextStyle(fontSize: 50, color: Colors.white),
                    ),
                    trailing: IconButton(
                      onPressed: () {
                        studentNames.removeAt(index);
                        setState(() {});
                      },
                      icon: const Icon(Icons.delete),
                    ),
                  ),
                );
              },
            ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          studentNames.add(studentnamecontrolller.text);
          studentnamecontrolller.clear();
        },
        child: const Text("Add"),
      ),
    );
  }
}
