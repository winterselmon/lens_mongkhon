import 'dart:math';

import 'package:camera/camera.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:mongkhon_lens/camera_view.dart';
import 'package:mongkhon_lens/information_page.dart';
import 'package:mongkhon_lens/route_generator.dart';
import 'package:mongkhon_lens/text_detector_view.dart';

List<CameraDescription> cameras = [];

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  // WidgetsFlutterBinding.ensureInitialized().addPostFrameCallback((_) => {});

  cameras = await availableCameras();

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
      DeviceOrientation.portraitDown,
    ]);
    return MaterialApp(
      builder: EasyLoading.init(),
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      onGenerateRoute: generateRoute,
      home: const Home(),
    );
  }
}

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  String generateString() {
    var list = List.generate(9, (index) => index)..shuffle();
    return list.take(5).join('');
  }

  _random() {
    var list = generateString();

    List stringSplit = list.split('');

    List randomItems =
        (stringSplit.toSet().toList()..shuffle()).take(2).toList();

    debugPrint('test - ${list.split('').toString()}');
    debugPrint('test - ${randomItems}');
  }

  @override
  void initState() {
    super.initState();

    // debugPrint('generateString - ${generateString()}');

    // for (var i = 0; i < 100; i++) {
    //   debugPrint(i.toString().padLeft(2, '0'));
    // }
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return WillPopScope(
      onWillPop: () {
        debugPrint('test');
        return Future(() => false);
      },
      child: SafeArea(
        child: Scaffold(
          body: SingleChildScrollView(
            child: Column(
              children: [
                Container(
                  width: size.width,
                  height: size.height,
                  child: InformationPage(),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
