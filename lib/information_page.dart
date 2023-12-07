import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:mongkhon_lens/function_widgets.dart';
import 'package:mongkhon_lens/global_constant.dart';
import 'package:mongkhon_lens/mental_page.dart';
import 'package:mongkhon_lens/object_detector_view.dart';
import 'package:mongkhon_lens/text_detector_view.dart';
import 'package:supercharged/supercharged.dart';

class InformationPage extends StatefulWidget {
  const InformationPage({super.key});

  static const routeName = '/information';

  @override
  State<InformationPage> createState() => _InformationPageState();
}

class _InformationPageState extends State<InformationPage> {
  TextEditingController _mentalController = TextEditingController();
  TextEditingController _dreamController = TextEditingController();
  late double height;
  late double width;
  bool isHover = false;
  String _currentMenu = '';

  List _menuList = ['SCAN LOTTO', 'SCAN OBJECT', 'SCAN SAFE', 'EVENT'];

  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    String five = generateString();
    String random = _random(five);

    debugPrint('test - $random');
    for (var i = 0; i < 15; i++) {
      debugPrint('test - ${_random(five)}');
    }
  }

  String generateString() {
    var list = List.generate(9, (index) => index)..shuffle();
    return list.take(5).join('');
  }

  String _random(list) {
    List stringSplit = list.split('');

    List randomItems =
        (stringSplit.toSet().toList()..shuffle()).take(3).toList();

    // debugPrint('test - ${list.split('').toString()}');
    // debugPrint('test - $randomItems');

    return randomItems.toSet().join();
  }

  @override
  Widget build(BuildContext context) {
    height = screenHeight(context);
    width = screenWidth(context);

    return SafeArea(
      child: Scaffold(
        resizeToAvoidBottomInset: false,
        appBar: AppBar(
          backgroundColor: Colors.deepOrangeAccent,
        ),
        body: Container(
          width: width,
          height: height,
          decoration: BoxDecoration(
            color: '#DCDCDC'.toColor(),
          ),
          padding: const EdgeInsets.all(20),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              addVerticalSpace(20),
              Container(
                // height: height,
                child: ListView.separated(
                  shrinkWrap: true,
                  itemBuilder: (context, index) {
                    return InkWell(
                      onTap: () {
                        setState(() {
                          _currentMenu = _menuList[index];
                        });

                        if (_currentMenu == _menuList[0]) {
                          Navigator.pushNamed(
                              context, TextRecognizerView.routeName,
                              arguments: {
                                'mental': '22',
                                'dream': '27',
                              });

                          setState(() {
                            _currentMenu = '';
                          });
                        } else if (_currentMenu == _menuList[1]) {
                          Navigator.pushNamed(
                            context,
                            ObjectDetectorView.routeName,
                          );

                          setState(() {
                            _currentMenu = '';
                          });
                        }
                      },
                      child: Column(
                        children: [
                          Container(
                            alignment: Alignment.center,
                            width: 200,
                            height: 60,
                            decoration: BoxDecoration(
                              // color: Colors.white,
                              gradient: _currentMenu == _menuList[index]
                                  ? linearPrimaryTopGradient
                                  : linearGreyGradient,
                              borderRadius: const BorderRadius.all(
                                Radius.circular(
                                  16,
                                ),
                              ),
                              boxShadow: [
                                BoxShadow(
                                  color: Colors.grey.withOpacity(0.5),
                                  spreadRadius: 5,
                                  blurRadius: 5,
                                  offset: const Offset(
                                    0,
                                    0,
                                  ), // changes position of shadow
                                ),
                              ],
                            ),
                            child: Text(
                              _menuList[index],
                              style: TextStyle(
                                fontWeight: FontWeight.w500,
                                fontSize: 20.0,
                                color: _currentMenu == _menuList[index]
                                    ? Colors.white
                                    : Colors.deepOrange,
                              ),
                            ),
                          ),
                        ],
                      ),
                    );
                  },
                  separatorBuilder: (context, index) => SizedBox(
                    height: 20,
                  ),
                  itemCount: _menuList.length,
                ),
              )

              // Container(
              //   padding: EdgeInsets.all(20),
              //   decoration: BoxDecoration(border: Border.all(width: 1)),
              //   child: Column(
              //     mainAxisAlignment: MainAxisAlignment.start,
              //     crossAxisAlignment: CrossAxisAlignment.start,
              //     children: [
              //       Text('เลขในใจ'),
              //       Container(
              //         height: 5,
              //       ),
              //       Container(
              //         decoration:
              //             BoxDecoration(border: Border.all(width: 1)),
              //         child: TextFormField(
              //           controller: _mentalController,
              //           keyboardType: TextInputType.number,
              //           inputFormatters: [
              //             FilteringTextInputFormatter.allow(
              //                 RegExp(r'[0-9]')),
              //             FilteringTextInputFormatter.digitsOnly
              //           ],
              //           decoration: InputDecoration(
              //             border: InputBorder.none,
              //             contentPadding: EdgeInsets.all(10),
              //           ),
              //         ),
              //       ),
              //     ],
              //   ),
              // ),
              // Container(
              //   height: 20,
              // ),
              // Container(
              //   padding: EdgeInsets.all(20),
              //   decoration: BoxDecoration(border: Border.all(width: 1)),
              //   child: Column(
              //     mainAxisAlignment: MainAxisAlignment.start,
              //     crossAxisAlignment: CrossAxisAlignment.start,
              //     children: [
              //       Text('คิดถึงอะไรอยู่ไหม'),
              //       Container(
              //         height: 5,
              //       ),
              //       Container(
              //         decoration:
              //             BoxDecoration(border: Border.all(width: 1)),
              //         child: TextFormField(
              //           controller: _dreamController,
              //           keyboardType: TextInputType.text,
              //           decoration: InputDecoration(
              //             border: InputBorder.none,
              //             contentPadding: EdgeInsets.all(10),
              //           ),
              //         ),
              //       ),
              //     ],
              //   ),
              // ),
              // Container(
              //   height: 20,
              // ),
              // Container(
              //   child: InkWell(
              //     onTap: () {
              //       Navigator.pushNamed(context, MentalPage.routeName);
              //     },
              //     child: Container(
              //         decoration:
              //             BoxDecoration(border: Border.all(width: 1)),
              //         padding: EdgeInsets.symmetric(
              //             horizontal: 20, vertical: 10),
              //         child: Text('เลือกเลขในใจ')),
              //   ),
              // ),

              // Column(
              //   crossAxisAlignment: CrossAxisAlignment.end,
              //   mainAxisAlignment: MainAxisAlignment.end,
              //   children: [
              //     InkWell(
              //       onTap: () {
              //         Navigator.pushNamed(context, TextRecognizerView.routeName,
              //             arguments: {
              //               'mental': _mentalController.text,
              //               'dream': '27',
              //             });

              //         // Navigator.popAndPushNamed(
              //         //     context, PackageDetailPage.routeName,
              //         //     arguments: {'productId': '1'});
              //       },
              //       child: Container(
              //         decoration: BoxDecoration(border: Border.all(width: 1)),
              //         padding:
              //             EdgeInsets.symmetric(vertical: 10, horizontal: 24),
              //         child: Text('กล้อง'),
              //       ),
              //     ),
              //   ],
              // )
            ],
          ),
        ),
      ),
    );
  }
}
