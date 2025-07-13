import 'package:awesome_notifications/awesome_notifications.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:szdfzf/CameraWesome.dart';
import 'package:szdfzf/FireBaseService.dart';
import 'package:szdfzf/MyCamera.dart';
import 'package:szdfzf/MyFormData.dart';
import 'package:szdfzf/MyLocalNotification.dart';
import 'package:szdfzf/NotificationUtilities.dart';
import 'package:szdfzf/ShowFirebaseData.dart';
import 'package:szdfzf/ShowPersonData.dart';
import 'package:szdfzf/firebase_options.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]);

  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );

  await AwesomeNotifications().initialize(
      "resource://drawable/icon_notification",
      [
        NotificationChannel(
          channelKey: 'basic_channel',
          channelName: 'Basic Notifications',
          channelDescription: 'Notification channel for basic tests',
          defaultColor: Colors.teal,
          ledColor: Colors.white,
          importance: NotificationImportance.High,
        )
      ]
  );



  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _checkNotificationPermission();

  }

  Future<void> _checkNotificationPermission() async{
    bool isAllowed = await AwesomeNotifications().isNotificationAllowed();

    if (!isAllowed) {
      showDialog(context: context, builder: (contex) =>
          AlertDialog(title: Text("Allow Notification"),
            content: Text("Our app would like to see"),
            actions: [
              TextButton(onPressed: (){
                Get.back();
              }, child: Text("Don\'t Allow")
              ),
              TextButton(onPressed: (){
                AwesomeNotifications().requestPermissionToSendNotifications().then((_)=>
                    Get.back()
                );
              }, child: Text("Allow")
              ),
            ],
          )
      );
    }
  }
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      getPages: [
        GetPage(name: "/camera", page: () => const Mycamera()),
        GetPage(name: "/cameraWesome", page: () => const CameraAwesome()),
        GetPage(name: "/form", page: () => const MyFormdata()),
        GetPage(name: "/showPerson", page: () => const Showpersondata()),
        GetPage(name: "/firedata", page: () =>  MyFirebaseList ()),
        GetPage(name: "/notification", page: () =>  Mylocalnotification ()),
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
            }, child: Text("Local Notification")
            ),
            SizedBox(height: 20,),
            ElevatedButton(onPressed: ()async {
              // DataSnapshot? snapshot = await FireBaseService().read(path: "data1");

              // print(snapshot?.value);
              Get.toNamed("/firedata");
            }, child: Text("Show firebase Data")
            ),
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
