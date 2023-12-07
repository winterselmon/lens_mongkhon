import 'dart:typed_data';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:gallery_saver/gallery_saver.dart';
import 'package:image_gallery_saver/image_gallery_saver.dart';
import 'package:mongkhon_lens/dialog_service.dart';
import 'package:mongkhon_lens/function_widgets.dart';
import 'package:screenshot/screenshot.dart';
import 'package:social_share/social_share.dart';
import 'package:supercharged/supercharged.dart';

class PreviewPageObject extends StatefulWidget {
  const PreviewPageObject({Key? key, required this.picture, required this.path})
      : super(key: key);

  final String path;
  final Uint8List picture;

  static const routeName = '/preview';

  @override
  State<PreviewPageObject> createState() => _PreviewPageObjectState();
}

class _PreviewPageObjectState extends State<PreviewPageObject> {
  double widthCard = 200;
  double heightCard = 50;
  ScreenshotController screenshotController = ScreenshotController();

  @override
  void initState() {
    super.initState();
    // SchedulerBinding.instance
    //     .addPostFrameCallback((_) => showLuckyNumberDialog(context));
  }

  Widget imagePreview() {
    return Stack(
      alignment: Alignment.center,
      children: [
        Image.memory(
          widget.picture,
          width: MediaQuery.of(context).size.width,
          // height: MediaQuery.of(context).size.height,
          fit: BoxFit.cover,
        ),
        Container(
            alignment: Alignment.center,
            // padding: const EdgeInsets.all(40.0),
            padding: const EdgeInsets.symmetric(vertical: 60, horizontal: 40),
            decoration: const BoxDecoration(
              // color: Colors.white,
              borderRadius: BorderRadius.all(
                Radius.circular(
                  10.0,
                ),
              ),
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Container(
                  padding: const EdgeInsets.all(16),
                  decoration: BoxDecoration(
                    color: 'B0B0B0'.toColor().withOpacity(
                          0.5,
                        ),
                    borderRadius: const BorderRadius.all(
                      Radius.circular(10),
                    ),
                  ),
                  child: Column(
                    children: [
                      const Text(
                        'เลข(วัตถุ)มงคล',
                        style: TextStyle(
                          decoration: TextDecoration.none,
                          fontSize: 22,
                          color: Colors.white,
                          fontWeight: FontWeight.w700,
                        ),
                      ),
                      addVerticalSpace(19.0),
                      Column(
                        children: [
                          Container(
                            alignment: Alignment.center,
                            width: widthCard,
                            padding: const EdgeInsets.symmetric(
                              vertical: 4,
                              horizontal: 6,
                            ),
                            decoration: const BoxDecoration(
                              color: Colors.deepOrange,
                              borderRadius: BorderRadius.only(
                                topLeft: Radius.circular(6),
                                topRight: Radius.circular(6),
                              ),
                            ),
                            child: const Text(
                              'เลขเด่นนำโชค',
                              style: TextStyle(
                                decoration: TextDecoration.none,
                                fontSize: 16,
                                color: Colors.white,
                              ),
                            ),
                          ),
                          Container(
                              alignment: Alignment.center,
                              width: widthCard,
                              height: heightCard,
                              padding: const EdgeInsets.symmetric(
                                vertical: 2,
                                horizontal: 6,
                              ),
                              decoration: const BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.only(
                                  bottomLeft: Radius.circular(6),
                                  bottomRight: Radius.circular(6),
                                ),
                              ),
                              child: const Text(
                                '1 2 3 4 9',
                                style: TextStyle(
                                    decoration: TextDecoration.none,
                                    fontSize: 24,
                                    color: Colors.black,
                                    fontWeight: FontWeight.bold),
                              ))
                        ],
                      ),
                      addVerticalSpace(20),
                      Column(
                        children: [
                          Container(
                            alignment: Alignment.center,
                            width: widthCard,
                            padding: const EdgeInsets.symmetric(
                              vertical: 4,
                              horizontal: 6,
                            ),
                            decoration: const BoxDecoration(
                              color: Colors.amber,
                              borderRadius: BorderRadius.only(
                                topLeft: Radius.circular(6),
                                topRight: Radius.circular(6),
                              ),
                            ),
                            child: const Text(
                              'เลขเด่นรอง',
                              style: TextStyle(
                                decoration: TextDecoration.none,
                                fontSize: 16,
                                color: Colors.white,
                              ),
                            ),
                          ),
                          Container(
                              alignment: Alignment.center,
                              width: widthCard,
                              height: heightCard,
                              padding: const EdgeInsets.symmetric(
                                vertical: 4,
                                horizontal: 6,
                              ),
                              decoration: const BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.only(
                                  bottomLeft: Radius.circular(6),
                                  bottomRight: Radius.circular(6),
                                ),
                              ),
                              child: const Text(
                                '19 , 71 , 603',
                                style: TextStyle(
                                    decoration: TextDecoration.none,
                                    fontSize: 24,
                                    color: Colors.black,
                                    fontWeight: FontWeight.bold),
                              ))
                        ],
                      ),
                    ],
                  ),
                ),
              ],
            )),
      ],
    );
  }

  showLuckyNumberDialog(BuildContext context) {
    showCupertinoModalPopup(
        context: context,
        barrierDismissible: false,
        semanticsDismissible: false,
        builder: (_) {
          return Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                  // padding: const EdgeInsets.all(40.0),
                  padding:
                      const EdgeInsets.symmetric(vertical: 60, horizontal: 40),
                  decoration: const BoxDecoration(
                    // color: Colors.white,
                    borderRadius: BorderRadius.all(
                      Radius.circular(
                        10.0,
                      ),
                    ),
                  ),
                  child: Column(
                    children: [
                      Container(
                        padding: const EdgeInsets.all(16),
                        decoration: BoxDecoration(
                          color: 'B0B0B0'.toColor().withOpacity(
                                0.5,
                              ),
                          borderRadius: const BorderRadius.all(
                            Radius.circular(10),
                          ),
                        ),
                        child: Column(
                          children: [
                            const Text(
                              'เลข(วัตถุ)มงคล',
                              style: TextStyle(
                                decoration: TextDecoration.none,
                                fontSize: 22,
                                color: Colors.white,
                                fontWeight: FontWeight.w700,
                              ),
                            ),
                            addVerticalSpace(19.0),
                            Column(
                              children: [
                                Container(
                                  alignment: Alignment.center,
                                  width: widthCard,
                                  padding: const EdgeInsets.symmetric(
                                    vertical: 4,
                                    horizontal: 6,
                                  ),
                                  decoration: const BoxDecoration(
                                    color: Colors.deepOrange,
                                    borderRadius: BorderRadius.only(
                                      topLeft: Radius.circular(6),
                                      topRight: Radius.circular(6),
                                    ),
                                  ),
                                  child: const Text(
                                    'เลขเด่นนำโชค',
                                    style: TextStyle(
                                      decoration: TextDecoration.none,
                                      fontSize: 16,
                                      color: Colors.white,
                                    ),
                                  ),
                                ),
                                Container(
                                    alignment: Alignment.center,
                                    width: widthCard,
                                    height: heightCard,
                                    padding: const EdgeInsets.symmetric(
                                      vertical: 2,
                                      horizontal: 6,
                                    ),
                                    decoration: const BoxDecoration(
                                      color: Colors.white,
                                      borderRadius: BorderRadius.only(
                                        bottomLeft: Radius.circular(6),
                                        bottomRight: Radius.circular(6),
                                      ),
                                    ),
                                    child: const Text(
                                      '1 2 3 4 9',
                                      style: TextStyle(
                                          decoration: TextDecoration.none,
                                          fontSize: 24,
                                          color: Colors.black,
                                          fontWeight: FontWeight.bold),
                                    ))
                              ],
                            ),
                            addVerticalSpace(20),
                            Column(
                              children: [
                                Container(
                                  alignment: Alignment.center,
                                  width: widthCard,
                                  padding: const EdgeInsets.symmetric(
                                    vertical: 4,
                                    horizontal: 6,
                                  ),
                                  decoration: const BoxDecoration(
                                    color: Colors.amber,
                                    borderRadius: BorderRadius.only(
                                      topLeft: Radius.circular(6),
                                      topRight: Radius.circular(6),
                                    ),
                                  ),
                                  child: const Text(
                                    'เลขเด่นรอง',
                                    style: TextStyle(
                                      decoration: TextDecoration.none,
                                      fontSize: 16,
                                      color: Colors.white,
                                    ),
                                  ),
                                ),
                                Container(
                                    alignment: Alignment.center,
                                    width: widthCard,
                                    height: heightCard,
                                    padding: const EdgeInsets.symmetric(
                                      vertical: 4,
                                      horizontal: 6,
                                    ),
                                    decoration: const BoxDecoration(
                                      color: Colors.white,
                                      borderRadius: BorderRadius.only(
                                        bottomLeft: Radius.circular(6),
                                        bottomRight: Radius.circular(6),
                                      ),
                                    ),
                                    child: const Text(
                                      '19 , 71 , 603',
                                      style: TextStyle(
                                          decoration: TextDecoration.none,
                                          fontSize: 24,
                                          color: Colors.black,
                                          fontWeight: FontWeight.bold),
                                    ))
                              ],
                            ),
                          ],
                        ),
                      ),
                    ],
                  )),
            ],
          );
        });
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async => false,
      child: SafeArea(
        child: Scaffold(
          appBar: AppBar(
            leading: IconButton(
              onPressed: () {
                debugPrint('testetset');
                Navigator.pop(context);
              },
              icon: const Icon(Icons.arrow_back),
            ),
            backgroundColor: Colors.deepOrange,
            actions: [
              InkWell(
                onTap: () async {
                  EasyLoading.show();
                  screenshotController
                      .captureFromWidget(imagePreview())
                      .then((value) async {
                    final result = await ImageGallerySaver.saveImage(
                      value,
                    );

                    if (result['isSuccess'] == true) {
                      DialogService.showDownloadStatusDialog(context);
                    }
                    EasyLoading.dismiss();
                  });

                  // await GallerySaver.saveImage(widget.path,
                  //         albumName: 'Lens mongkhon')
                  //     .whenComplete(
                  //   () => DialogService.showDownloadStatusDialog(context),
                  // );
                },
                child: Container(
                  width: 40,
                  height: 40,
                  decoration: const BoxDecoration(
                    shape: BoxShape.circle,
                    color: Colors.black,
                  ),
                  child: const Icon(
                    Icons.download,
                    color: Colors.white,
                  ),
                ),
              ),
              addHorizontalSpace(5),
              InkWell(
                onTap: () async {
                  SocialShare.shareOptions(
                    "Hello world",
                    imagePath: widget.path,
                  );
                },
                child: Container(
                  width: 40,
                  height: 40,
                  decoration: const BoxDecoration(
                    shape: BoxShape.circle,
                    color: Colors.black,
                  ),
                  child: const Icon(
                    Icons.share,
                    color: Colors.white,
                  ),
                ),
              ),
            ],
          ),
          body: SingleChildScrollView(
            child: Screenshot(
                controller: screenshotController, child: imagePreview()
                // SingleChildScrollView(
                //   child: Stack(
                //     alignment: Alignment.center,
                //     children: [
                //       Image.memory(
                //         widget.picture,
                //         width: MediaQuery.of(context).size.width,
                //         // height: MediaQuery.of(context).size.height,
                //         fit: BoxFit.cover,
                //       ),
                //       Container(
                //           // padding: const EdgeInsets.all(40.0),
                //           padding: const EdgeInsets.symmetric(
                //               vertical: 60, horizontal: 40),
                //           decoration: const BoxDecoration(
                //             // color: Colors.white,
                //             borderRadius: BorderRadius.all(
                //               Radius.circular(
                //                 10.0,
                //               ),
                //             ),
                //           ),
                //           child: Column(
                //             children: [
                //               Container(
                //                 padding: const EdgeInsets.all(16),
                //                 decoration: BoxDecoration(
                //                   color: 'B0B0B0'.toColor().withOpacity(
                //                         0.5,
                //                       ),
                //                   borderRadius: const BorderRadius.all(
                //                     Radius.circular(10),
                //                   ),
                //                 ),
                //                 child: Column(
                //                   children: [
                //                     const Text(
                //                       'เลข(วัตถุ)มงคล',
                //                       style: TextStyle(
                //                         decoration: TextDecoration.none,
                //                         fontSize: 22,
                //                         color: Colors.white,
                //                         fontWeight: FontWeight.w700,
                //                       ),
                //                     ),
                //                     addVerticalSpace(19.0),
                //                     Column(
                //                       children: [
                //                         Container(
                //                           alignment: Alignment.center,
                //                           width: widthCard,
                //                           padding: const EdgeInsets.symmetric(
                //                             vertical: 4,
                //                             horizontal: 6,
                //                           ),
                //                           decoration: const BoxDecoration(
                //                             color: Colors.deepOrange,
                //                             borderRadius: BorderRadius.only(
                //                               topLeft: Radius.circular(6),
                //                               topRight: Radius.circular(6),
                //                             ),
                //                           ),
                //                           child: const Text(
                //                             'เลขเด่นนำโชค',
                //                             style: TextStyle(
                //                               decoration: TextDecoration.none,
                //                               fontSize: 16,
                //                               color: Colors.white,
                //                             ),
                //                           ),
                //                         ),
                //                         Container(
                //                             alignment: Alignment.center,
                //                             width: widthCard,
                //                             height: heightCard,
                //                             padding: const EdgeInsets.symmetric(
                //                               vertical: 2,
                //                               horizontal: 6,
                //                             ),
                //                             decoration: const BoxDecoration(
                //                               color: Colors.white,
                //                               borderRadius: BorderRadius.only(
                //                                 bottomLeft: Radius.circular(6),
                //                                 bottomRight: Radius.circular(6),
                //                               ),
                //                             ),
                //                             child: const Text(
                //                               '1 2 3 4 9',
                //                               style: TextStyle(
                //                                   decoration: TextDecoration.none,
                //                                   fontSize: 24,
                //                                   color: Colors.black,
                //                                   fontWeight: FontWeight.bold),
                //                             ))
                //                       ],
                //                     ),
                //                     addVerticalSpace(20),
                //                     Column(
                //                       children: [
                //                         Container(
                //                           alignment: Alignment.center,
                //                           width: widthCard,
                //                           padding: const EdgeInsets.symmetric(
                //                             vertical: 4,
                //                             horizontal: 6,
                //                           ),
                //                           decoration: const BoxDecoration(
                //                             color: Colors.amber,
                //                             borderRadius: BorderRadius.only(
                //                               topLeft: Radius.circular(6),
                //                               topRight: Radius.circular(6),
                //                             ),
                //                           ),
                //                           child: const Text(
                //                             'เลขเด่นรอง',
                //                             style: TextStyle(
                //                               decoration: TextDecoration.none,
                //                               fontSize: 16,
                //                               color: Colors.white,
                //                             ),
                //                           ),
                //                         ),
                //                         Container(
                //                             alignment: Alignment.center,
                //                             width: widthCard,
                //                             height: heightCard,
                //                             padding: const EdgeInsets.symmetric(
                //                               vertical: 4,
                //                               horizontal: 6,
                //                             ),
                //                             decoration: const BoxDecoration(
                //                               color: Colors.white,
                //                               borderRadius: BorderRadius.only(
                //                                 bottomLeft: Radius.circular(6),
                //                                 bottomRight: Radius.circular(6),
                //                               ),
                //                             ),
                //                             child: const Text(
                //                               '19 , 71 , 603',
                //                               style: TextStyle(
                //                                   decoration: TextDecoration.none,
                //                                   fontSize: 24,
                //                                   color: Colors.black,
                //                                   fontWeight: FontWeight.bold),
                //                             ))
                //                       ],
                //                     ),
                //                   ],
                //                 ),
                //               ),
                //             ],
                //           )),
                //     ],
                //   ),
                // ),
                ),
          ),
        ),
      ),
    );
  }
}
