import 'dart:math';
import 'dart:typed_data';
import 'dart:ui';

import 'package:camera/camera.dart';
import 'package:flutter/material.dart';
import 'dart:io';

class PreviewPage extends StatefulWidget {
  const PreviewPage({Key? key, required this.picture}) : super(key: key);

  final Uint8List picture;

  static const routeName = '/preview';

  @override
  State<PreviewPage> createState() => _PreviewPageState();
}

class _PreviewPageState extends State<PreviewPage> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Preview Page')),
      body: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Stack(
              alignment: Alignment.topCenter,
              children: [
                Container(
                  child: Image.memory(
                    widget.picture,
                    width: MediaQuery.of(context).size.width,
                    height: 500,
                  ),
                ),
                // Container(
                //   child: Image.asset(
                //     'assets/output-onlinepngtools.png',
                //     width: MediaQuery.of(context).size.width,
                //     // height: 300,
                //   ),
                // ),
              ],
            ),
            const SizedBox(height: 24),
            // Text(widget.picture.name)
          ],
        ),
      ),
    );
  }
}
