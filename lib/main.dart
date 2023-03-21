import 'dart:math';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

///Stateless widget to display MaterialApp
class MyApp extends StatelessWidget {
  ///Constructor of MyApp Class
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Colored Background',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(title: 'Change background color'),
    );
  }
}

///My Stateful widget to display the first app screen
class MyHomePage extends StatefulWidget {
  ///title for the appbar
  final String title;
  ///constructor of MyHomePage Class & takes the title as argument
  const MyHomePage({super.key, required this.title});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  Color _backgroundColor = const Color.fromRGBO(250, 178, 12, 0.5);
  int r = 24;
  int a = 11;
  int b = 32;
  int c = 7;

  List<String> appMessages =
    ["Be yourself; everyone else is already taken.",
      "So many books, so little time.",
      "A room without books is like a body without a soul.",
      "You only live once, but if you do it right, once is enough.",
      "Be the change that you wish to see in the world.",
      "In three words I can sum up everything I've learned about life: it goes on."
    ];
    //["Welcome","Hello There","Happy to see you","Hope you are fine"];

  String _getRandomMessage() {
    final random = Random();
    final index = random.nextInt(appMessages.length);

    return appMessages[index];
  }

  void generateRandomColor() {
    final result = (r * a + b) % c;
    r = result;
    print(result);
  }

  void _generateRGBColor() {
    generateRandomColor();
    final random = Random();
    final red = random.nextInt(256);
    final green = random.nextInt(256);
    final blue = random.nextInt(256);
    final opacity = (random.nextInt(10)+1) * 0.1;

    setState(() {
      _backgroundColor = Color.fromRGBO(red, green, blue, opacity);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: GestureDetector(
        onTap: _generateRGBColor,
        child: ColoredBox(
          color: _backgroundColor,
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Text(
                  "Hello There",
                  textAlign: TextAlign.center,
                  style: TextStyle(color: Colors.black,
                    fontWeight: FontWeight.bold,
                    fontSize: 35,
                  ),//Theme.of(context).textTheme.headlineMedium
                ),
                const SizedBox(height: 10),
                Padding(padding: const EdgeInsets.all(10),
                  child: Text(
                    _getRandomMessage(),
                    textAlign: TextAlign.center,
                    style: const TextStyle(color: Colors.black,
                      fontWeight: FontWeight.w500,
                      fontSize: 22,
                    ),//Theme.of(context).textTheme.headlineMedium
                  ),
                )
              ],
            ),
          ),
        ),
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}
