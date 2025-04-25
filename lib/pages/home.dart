import 'package:flutter/material.dart';
import 'package:programming_questions/services/data_controller.dart';

int index = 0;
bool showlink = false;

/// icon button bosilganda link korinish uchun linkni topib qoshib chiqaman ozim

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  final controller = DataController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: FutureBuilder(
        future: controller.initilize(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator());
          } else if (snapshot.hasError) {
            return Center(child: Text("Xatolik: ${snapshot.error}"));
          } else if (controller.items.isEmpty) {
            return const Center(child: Text("Savollar topilmadi"));
          } else {
            return Column(
              children: [
                SizedBox(height: 100),
                Align(
                  alignment: Alignment.topRight,
                  child: IconButton(
                    onPressed: () {
                      showlink = !showlink;
                      setState(() {});
                    },
                    icon: Icon(
                      Icons.light_mode_outlined,
                      color: Colors.redAccent,
                    ),
                  ),
                ),
                SizedBox(
                  width: 300,
                  height: 300,
                  child: Card(
                    color: Colors.yellowAccent,
                    child: Center(
                      child: Text("${controller.items[index].question}"),
                    ),
                  ),
                ),
                showlink
                    ? SizedBox(
                      width: 250,
                      height: 70,
                      child: Card(
                        color: Colors.green,
                        child: Text("Batfsil malumot uchun link"),
                      ),
                    )
                    : Text(""),
                Expanded(
                  child: Column(
                    children: [
                      for (
                        int i = 0;
                        i < controller.items[index].variants.length;
                        i++
                      )
                        ElevatedButton(
                          onPressed: () {
                            index++;
                            setState(() {});
                          },
                          child: Text("${controller.items[index].variants[i]}"),
                        ),
                    ],
                  ),
                ),
              ],
            );
          }
        },
      ),
    );
  }
}
