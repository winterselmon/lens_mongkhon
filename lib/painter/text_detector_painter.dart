import 'dart:ui';
import 'dart:ui' as ui;

import 'package:flutter/material.dart';
import 'package:google_mlkit_text_recognition/google_mlkit_text_recognition.dart';
import 'package:touchable/touchable.dart';

import 'coordinates_translator.dart';

class TextRecognizerPainter extends CustomPainter {
  TextRecognizerPainter(
    this.recognizedText,
    this.absoluteImageSize,
    this.rotation,
    this.fiveNumber,
    this.twoNumber,
    this.mentalNumber,
    this.dreamNumber,
    this.context,
    this.callback,
  );

  final RecognizedText recognizedText;
  final Size absoluteImageSize;
  final InputImageRotation rotation;
  final String fiveNumber;
  final String twoNumber;
  final String mentalNumber;
  final String dreamNumber;
  final BuildContext context;
  final Function(String value) callback;

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

  @override
  void paint(Canvas canvas, Size size) {
    var myCanvas = TouchyCanvas(context, canvas);
    // myCanvas.drawCircle(
    //   Offset(10, 10),
    //   60,
    //   Paint()..color = Colors.orange,
    //   onTapDown: (tapdetail) {
    //     callback('test');
    //     debugPrint("orange Circle touched");
    //   },
    //   onPanDown: (tapdetail) {
    //     debugPrint("orange circle swiped");
    //   },
    // );

    // myCanvas.drawLine(
    //   Offset(0, 0),
    //   Offset(size.width - 100, size.height - 100),
    //   Paint()
    //     ..color = Colors.black
    //     ..strokeWidth = 50,
    //   onPanUpdate: (detail) {
    //     callback('test');

    //     debugPrint(
    //         'Black line Swiped'); //do cooler things here. Probably change app state or animate
    //   },
    //   onTapDown: (details) {
    //     debugPrint('Black line Swiped');
    //   },
    // );

    final Paint paint = Paint()
      ..style = PaintingStyle.stroke
      ..strokeWidth = 3.0
      ..color = Colors.lightGreenAccent;

    final Paint orangePaint = Paint()
      ..style = PaintingStyle.stroke
      ..strokeWidth = 3.0
      ..color = Colors.orange;

    final Paint purplePaint = Paint()
      ..style = PaintingStyle.stroke
      ..strokeWidth = 3.0
      ..color = Colors.purple;

    final Paint paintNoDetect = Paint()
      ..style = PaintingStyle.stroke
      ..strokeWidth = 3.0
      ..color = Colors.grey;

    final Paint background = Paint()..color = Color(0x99000000);

    final RegExp nameRegExp = RegExp(r'^[0-9]+$');

    for (final textBlock in recognizedText.blocks) {
      String strTrim = textBlock.text.trim();
      final output = strTrim.replaceAll(' ', '');
      if (nameRegExp.hasMatch(output) && output.length == 6) {
        String endTwo = '${output[4]}${output[5]}';
        if (_randomList.contains(endTwo)) {
          final ParagraphBuilder builder = ParagraphBuilder(
            ParagraphStyle(
              textAlign: TextAlign.right,
              fontSize: 16,
              textDirection: TextDirection.ltr,
            ),
          );

          builder.pushStyle(ui.TextStyle(
            color: Colors.lightGreenAccent,
            background: background,
          ));

          String result = output.replaceRange(0, 4, '*' * 4);

          callback(result);

          builder.addText(result);

          builder.pop();

          final left = translateX(
              textBlock.boundingBox.left, rotation, size, absoluteImageSize);
          final top = translateY(
              textBlock.boundingBox.top, rotation, size, absoluteImageSize);
          final right = translateX(
              textBlock.boundingBox.right, rotation, size, absoluteImageSize);
          final bottom = translateY(
              textBlock.boundingBox.bottom, rotation, size, absoluteImageSize);

          canvas.drawRect(
            Rect.fromLTRB(left, top, right, bottom),
            paint,
          );

          canvas.drawParagraph(
            builder.build()
              ..layout(
                ParagraphConstraints(
                  width: (right - left),
                ),
              ),
            Offset(left, top),
          );
        } else if (endTwo.contains(mentalNumber) && mentalNumber.isNotEmpty) {
          final ParagraphBuilder builder = ParagraphBuilder(
            ParagraphStyle(
              textAlign: TextAlign.right,
              fontSize: 16,
              textDirection: TextDirection.ltr,
            ),
          );

          builder.pushStyle(ui.TextStyle(
            color: Colors.orange,
            background: background,
          ));

          String result = output.replaceRange(0, 4, '*' * 4);

          callback(result);

          builder.addText(result);

          builder.pop();

          final left = translateX(
              textBlock.boundingBox.left, rotation, size, absoluteImageSize);
          final top = translateY(
              textBlock.boundingBox.top, rotation, size, absoluteImageSize);
          final right = translateX(
              textBlock.boundingBox.right, rotation, size, absoluteImageSize);
          final bottom = translateY(
              textBlock.boundingBox.bottom, rotation, size, absoluteImageSize);

          canvas.drawRect(
            Rect.fromLTRB(left, top, right, bottom),
            orangePaint,
          );

          canvas.drawParagraph(
            builder.build()
              ..layout(
                ParagraphConstraints(
                  width: (right - left),
                ),
              ),
            Offset(left, top),
          );
        } else if (endTwo.contains(dreamNumber) && dreamNumber.isNotEmpty) {
          final ParagraphBuilder builder = ParagraphBuilder(
            ParagraphStyle(
              textAlign: TextAlign.right,
              fontSize: 16,
              textDirection: TextDirection.ltr,
            ),
          );

          builder.pushStyle(ui.TextStyle(
            color: Colors.purple,
            background: background,
          ));

          String result = output.replaceRange(0, 4, '*' * 4);

          callback(result);

          builder.addText(result);

          builder.pop();

          final left = translateX(
              textBlock.boundingBox.left, rotation, size, absoluteImageSize);
          final top = translateY(
              textBlock.boundingBox.top, rotation, size, absoluteImageSize);
          final right = translateX(
              textBlock.boundingBox.right, rotation, size, absoluteImageSize);
          final bottom = translateY(
              textBlock.boundingBox.bottom, rotation, size, absoluteImageSize);

          canvas.drawRect(
            Rect.fromLTRB(left, top, right, bottom),
            purplePaint,
          );

          canvas.drawParagraph(
            builder.build()
              ..layout(
                ParagraphConstraints(
                  width: (right - left),
                ),
              ),
            Offset(left, top),
          );
        } else {
          final ParagraphBuilder builder = ParagraphBuilder(
            ParagraphStyle(
              textAlign: TextAlign.right,
              fontSize: 16,
              textDirection: TextDirection.ltr,
            ),
          );

          builder.pushStyle(ui.TextStyle(
            color: Colors.grey,
            background: background,
          ));

          String result = output.replaceRange(0, 4, '*' * 4);

          // callback(result);

          builder.addText(result);

          builder.pop();

          final left = translateX(
              textBlock.boundingBox.left, rotation, size, absoluteImageSize);
          final top = translateY(
              textBlock.boundingBox.top, rotation, size, absoluteImageSize);
          final right = translateX(
              textBlock.boundingBox.right, rotation, size, absoluteImageSize);
          final bottom = translateY(
              textBlock.boundingBox.bottom, rotation, size, absoluteImageSize);

          canvas.drawRect(
            Rect.fromLTRB(left, top, right, bottom),
            paintNoDetect,
          );

          canvas.drawParagraph(
            builder.build()
              ..layout(
                ParagraphConstraints(
                  width: (right - left),
                ),
              ),
            Offset(left, top),
          );
        }
      }
    }
  }

  @override
  bool shouldRepaint(TextRecognizerPainter oldDelegate) {
    return oldDelegate.recognizedText != recognizedText;
  }

  @override
  bool? hitTest(Offset position) {
    // TODO: implement hitTest
    return super.hitTest(position);
  }
}
