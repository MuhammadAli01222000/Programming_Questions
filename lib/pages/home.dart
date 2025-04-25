import 'package:flutter/material.dart';
import 'package:programming_questions/services/data_controller.dart';
import 'package:url_launcher/url_launcher.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  final controller = DataController();
  int index = 0;
  bool showLink = false;

  Future<void> _openUrl(String url) async {
    debugPrint("Trying to launch: $url");
    final Uri uri = Uri.parse(url);
    if (!await launchUrl(uri, mode: LaunchMode.externalApplication)) {
      debugPrint('xato boldi $url');
    }
  }

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
            final item = controller.items[index];
            return Column(
              children: [
                const SizedBox(height: 40),
                Align(
                  alignment: Alignment.topRight,
                  child: IconButton(
                    onPressed: () {
                      setState(() => showLink = !showLink);
                    },
                    icon: Icon(
                      showLink ? Icons.link_off : Icons.link,
                      color: Colors.redAccent,
                    ),
                  ),
                ),
                Card(
                  color: Colors.yellowAccent,
                  margin: const EdgeInsets.symmetric(vertical: 20),
                  child: SizedBox(
                    width: 300,
                    height: 150,
                    child: Center(
                      child: Text(
                        item.question,
                        style: const TextStyle(fontSize: 18),
                      ),
                    ),
                  ),
                ),
                if (showLink)
                  TextButton(
                    onPressed: () => _openUrl(item.infoLink),
                    child: const Text(
                      "Batafsil o‘qish",
                      style: TextStyle(
                        color: Colors.blueAccent,
                        decoration: TextDecoration.underline,
                      ),
                    ),
                  ),
                const SizedBox(height: 20),
                ...item.variants.map((v) {
                  return Padding(
                    padding: const EdgeInsets.symmetric(vertical: 4.0),
                    child: ElevatedButton(
                      onPressed: () {
                        setState(() {
                          if (index < controller.items.length - 1) {
                            index++;
                            showLink = false;
                          }
                        });
                      },
                      child: Text(v),
                    ),
                  );
                }).toList(),
              ],
            );
          }
        },
      ),
    );
  }
}
