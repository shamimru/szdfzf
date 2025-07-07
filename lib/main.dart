import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:szdfzf/CameraWesome.dart';
import 'package:szdfzf/MyCamera.dart';
import 'package:szdfzf/MyFormData.dart';
import 'package:szdfzf/MyLocalNotification.dart';
import 'package:szdfzf/ShowPersonData.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      getPages: [
        GetPage(name: "/camera", page: () => const Mycamera()),
        GetPage(name: "/cameraWesome", page: () => const CameraAwesome()),
        GetPage(name: "/form", page: () => const MyFormdata()),
        GetPage(name: "/showPerson", page: () => const Showpersondata()),
        GetPage(name: "/notification", page: () => const Mylocalnotification()),
      ],
      title: 'Flutter Demo',
      theme: ThemeData(

        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
      ),
      home: const MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});



  final String title;

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

  @override
  Widget build(BuildContext context) {
    // This method is rerun every time setState is called, for instance as done
    // by the _incrementCounter method above.
    //
    // The Flutter framework has been optimized to make rerunning build methods
    // fast, so that you can just rebuild anything that needs updating rather
    // than having to individually change instances of widgets.
    return Scaffold(
      appBar: AppBar(
        // TRY THIS: Try changing the color here to a specific color (to
        // Colors.amber, perhaps?) and trigger a hot reload to see the AppBar
        // change color while the other colors stay the same.
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        // Here we take the value from the MyHomePage object that was created by
        // the App.build method, and use it to set our appbar title.
        title: Text(widget.title),
      ),
      body: Center(
        // Center is a layout widget. It takes a single child and positions it
        // in the middle of the parent.
        child: Column(

          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            const Text('You have pushed the button this many times:'),
            Text(
              '$_counter',
              style: Theme.of(context).textTheme.headlineMedium,
            ),
            
            SizedBox(height: 20,),
            ElevatedButton(onPressed: (){
              print("cameraWesome");
              Get.toNamed("/cameraWesome");
            }, child: Text("Camerawesom")),

            SizedBox(height: 20,),
            ElevatedButton(onPressed: (){
              print("formData");
              Get.toNamed("/form");
            }, child: Text("Form Data to Sql")),

            SizedBox(height: 20,),
            ElevatedButton(onPressed: (){
              print("formData");
              Get.toNamed("/notification");
            }, child: Text("Local Notification"))
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: (){
          Get.toNamed("/camera");
        },
        tooltip: 'Increment',
        child: const Icon(Icons.add),
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}
