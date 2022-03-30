import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';

import 'second.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key}) : super(key: key);

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _counter = 0;

  void _incrementCounter() {
    setState(() {
      _counter++;
    });
  }

  final List<String> _checklist = [
    "Wake up",
    "Pray",
    "Brush",
    "Have my bath",
    "Hit the street",
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Home Screen"),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            // const Text('You have pushed the button this many times:'),
            // Text('$_counter', style: Theme.of(context).textTheme.headline4),

            // const SizedBox(height: 10),

            // ElevatedButton(
            //   onPressed: () {
            //     print("Hello world");
            //   },
            //   child: const Text("Stop presenting"),
            //   style: ElevatedButton.styleFrom(
            //     primary: Colors.blueAccent,
            //     minimumSize: const Size(200, 50),
            //     shape: RoundedRectangleBorder(
            //       borderRadius: BorderRadius.circular(10),
            //     ),
            //   ),
            // ),

            // // TextButton
            // TextButton(
            //   onPressed: () {},
            //   child: const Text("Text Button"),
            //   style: TextButton.styleFrom(
            //     primary: Colors.black,
            //   ),
            // ),

            // Dismissible
            ListView.separated(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              itemCount: _checklist.length,
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              separatorBuilder: (_, __) => const SizedBox(height: 10),
              itemBuilder: (cx, i) {
                String s = _checklist[i];
                return Dismissible(
                  key: ValueKey(s),
                  onDismissed: (DismissDirection direction) {
                    print("this guy wants to dismiss");
                    setState(() {
                      _checklist.removeAt(i);
                    });
                    print("this guy dismissed");

                    print(_checklist.length);
                  },
                  confirmDismiss: (DismissDirection dir) async {
                    // return dir == DismissDirection.startToEnd;
                    if (dir == DismissDirection.endToStart) {
                      return true;
                    } else {
                      return false;
                    }
                  },
                  background: Container(color: Colors.red),
                  child: Container(
                    height: 60,
                    width: double.infinity,
                    color: Colors.green,
                    alignment: Alignment.centerLeft,
                    padding: const EdgeInsets.symmetric(
                      horizontal: 20,
                      vertical: 20,
                    ),
                    child: Text(s),
                  ),
                );
              },
            ),

            // Custom gesture detector
            InkWell(
              onTap: () {
                print("Tapped");
              },
              onDoubleTap: () {
                print("Double Tapped");
              },
              onLongPress: () {
                print("Long Pressed");
              },
              child: Container(
                padding: const EdgeInsets.symmetric(
                  horizontal: 20,
                  vertical: 10,
                ),
                decoration: BoxDecoration(
                  boxShadow: kElevationToShadow[4],
                  color: Colors.blueAccent,
                ),
                child: const Text(
                  "Custom Gesture Detector",
                  style: TextStyle(color: Colors.white),
                ),
              ),
            ),

            // SizedBox(height: 20),
            // // Gesture detector on a button
            // GestureDetector(
            //   onDoubleTap: () {
            //     print("Double Tapped");
            //   },
            //   onLongPress: () {
            //     print("Long Pressed");
            //   },
            //   child: ElevatedButton(
            //     child: Text("Elev. Button"),
            //     onPressed: () {
            //       print("Tapped");
            //     },
            //   ),
            // ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _incrementCounter,
        // onPressed: () => Navigator.of(context).push(
        //   MaterialPageRoute<void>(
        //     builder: (BuildContext context) => const SecondPage(),
        //   ),
        // ),
        tooltip: 'Increment',
        child: const Icon(Icons.add),
      ),
    );
  }
}
