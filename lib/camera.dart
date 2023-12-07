import 'package:flutter/material.dart';
import 'package:google_ml_kit/google_ml_kit.dart';
import 'package:mongkhon_lens/camera_view.dart';
import 'package:mongkhon_lens/painter/text_detector_painter.dart';

class CameraVieww extends StatefulWidget {
  const CameraVieww({super.key});

  @override
  State<CameraVieww> createState() => _CameraViewwState();
}

class _CameraViewwState extends State<CameraVieww> {
  CustomPaint? _customPaint;
  bool _canProcess = true;
  bool _isBusy = false;
  final TextRecognizer _textRecognizer =
      TextRecognizer(script: TextRecognitionScript.latin);

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
  Widget? _component;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CameraView(
        customPaint: _customPaint,
        onImage: (inputImage) {
          processImage(context, inputImage);
        },
        component: _component,
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
