import 'dart:async';
import 'dart:typed_data';

import 'package:flutter/material.dart';
import 'package:google_mlkit_text_recognition/google_mlkit_text_recognition.dart';
import 'package:mongkhon_lens/camera.dart';
import 'package:mongkhon_lens/painter/text_detector_painter.dart';
import 'package:mongkhon_lens/preview_page.dart';
import 'package:screen_recorder/screen_recorder.dart';
import 'package:screenshot/screenshot.dart';
import 'package:touchable/touchable.dart';

import 'camera_view.dart';

class TextRecognizerView extends StatefulWidget {
  const TextRecognizerView({super.key});

  static const routeName = '/text_recognizer';

  @override
  State<TextRecognizerView> createState() => _TextRecognizerViewState();
}

class _TextRecognizerViewState extends State<TextRecognizerView> {
  final TextRecognizer _textRecognizer =
      TextRecognizer(script: TextRecognitionScript.latin);
  bool _canProcess = true;
  bool _isBusy = false;
  CustomPaint? _customPaint;
  String five = '', random = '';
  String mental = '', dream = '';
  String _value = '';
  List _randomList = [
    '00',
    '01',
    '02',
    '03',
    '04',
    '05',
    '06',
    '07',
    '08',
    '09',
    '10'
  ];
  ScreenRecorderController controller = ScreenRecorderController();
  bool _recording = false;
  ScreenshotController screenshotController = ScreenshotController();
  int _counter = 0;
  late Uint8List _imageFile;
  Widget? _component;
  late BuildContext _context;

  String generateString() {
    var list = List.generate(9, (index) => index)..shuffle();
    return list.take(5).join('');
  }

  String _random(list) {
    List stringSplit = list.split('');

    List randomItems =
        (stringSplit.toSet().toList()..shuffle()).take(2).toList();

    debugPrint('test - ${list.split('').toString()}');
    debugPrint('test - $randomItems');

    return randomItems.join();
  }

  @override
  void dispose() async {
    _canProcess = false;
    _textRecognizer.close();
    super.dispose();
  }

  @override
  void initState() {
    five = generateString();
    random = _random(five);

    controller = ScreenRecorderController(
      pixelRatio: 0.5,
      skipFramesBetweenCaptures: 2,
    );

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    _context = context;
    final size = MediaQuery.of(context).size;

    final arguments = (ModalRoute.of(context)?.settings.arguments ??
        <String, dynamic>{}) as Map;

    mental = arguments['mental'];
    dream = arguments['dream'];

    return SafeArea(
      child: Scaffold(
        body: SizedBox(
          width: MediaQuery.of(context).size.width,
          height: MediaQuery.of(context).size.height,
          child: Stack(
            alignment: Alignment.centerLeft,
            children: [
              Screenshot(
                controller: screenshotController,
                child: CameraView(
                  customPaint: _customPaint,
                  onImage: (inputImage) {
                    processImage(context, inputImage);
                  },
                  component: _component,
                ),
              ),
              Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                        height: 70,
                      ),
                      Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'เลขในใจ :',
                            style: const TextStyle(
                              fontSize: 14.0,
                              color: Colors.orange,
                            ),
                          ),
                          Text(
                            mental,
                            style: const TextStyle(
                              fontSize: 22.0,
                              color: Colors.orange,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ],
                      ),
                      Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'ทำนายฝัน :',
                            style: const TextStyle(
                              fontSize: 14.0,
                              color: Colors.purple,
                            ),
                          ),
                          Text(
                            dream,
                            style: const TextStyle(
                              fontSize: 22.0,
                              color: Colors.purple,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ],
                      ),
                      Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'เลข Random :',
                            style: const TextStyle(
                              fontSize: 14.0,
                              color: Colors.green,
                            ),
                          ),
                          Text(
                            _randomList.toList().toString(),
                            style: const TextStyle(
                              fontSize: 22.0,
                              color: Colors.green,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ],
                      ),
                      Column(
                        children: [
                          InkWell(
                            onTap: () async {
                              var container = Container(
                                  padding: const EdgeInsets.all(30.0),
                                  decoration: BoxDecoration(
                                    border: Border.all(
                                        color: Colors.blueAccent, width: 5.0),
                                    color: Colors.redAccent,
                                  ),
                                  child: Stack(
                                    children: [
                                      Image.asset(
                                        'assets/images/flutter.png',
                                      ),
                                      Text(
                                        "This is an invisible widget",
                                        style: Theme.of(context)
                                            .textTheme
                                            .titleLarge,
                                      ),
                                    ],
                                  ));
                              // if (_recording) {
                              //   controller.stop();

                              //   setState(() {
                              //     _recording = false;
                              //   });
                              // } else {
                              screenshotController
                                  .captureFromWidget(
                                      InheritedTheme.captureAll(context,
                                          MaterialApp(home: container)),
                                      delay: Duration(seconds: 1))
                                  .then((Uint8List? image) {
                                //Capture Done
                                setState(() {
                                  _imageFile = image!;
                                });

                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) => PreviewPage(
                                              picture: _imageFile,
                                            )));
                              }).catchError((onError) {
                                print(onError);
                              });
                              setState(() {
                                _recording = true;
                              });
                              // }
                            },
                            child: Icon(
                              size: 50,
                              Icons.circle,
                              color: _recording ? Colors.red : Colors.white,
                            ),
                          ),
                        ],
                      )
                    ],
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  Future<void> processImage(
    BuildContext context,
    InputImage inputImage,
  ) async {
    if (!_canProcess) return;
    if (_isBusy) return;
    _isBusy = true;

    final recognizedText = await _textRecognizer.processImage(inputImage);

    if (inputImage.metadata?.size != null &&
        inputImage.metadata?.rotation != null) {
      final painter = TextRecognizerPainter(
        recognizedText,
        inputImage.metadata!.size,
        inputImage.metadata!.rotation,
        five,
        random,
        mental,
        dream,
        context,
        (value) {
          debugPrint('Result : $value');
          _value = value;
        },
      );

      _customPaint = CustomPaint(
        painter: painter,
      );

      _component = InkWell(
        child: Text(_value.toString()),
        onTap: () {
          debugPrint(_value.toString());
        },
      );
    }
    _isBusy = false;
    if (mounted) {
      setState(() {});
    }
  }
}
