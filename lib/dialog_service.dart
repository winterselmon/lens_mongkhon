import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:mongkhon_lens/color_helper.dart';
import 'package:mongkhon_lens/function_widgets.dart';

class DialogService {
  DialogService._();

  static showDownloadStatusDialog(BuildContext context) {
    showCupertinoModalPopup(
        context: context,
        builder: (_) {
          Future.delayed(const Duration(seconds: 3), () {
            Navigator.of(context).pop();
          });
          return Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                  // padding: const EdgeInsets.all(40.0),
                  padding:
                      const EdgeInsets.symmetric(vertical: 60, horizontal: 40),
                  decoration: const BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.all(
                      Radius.circular(
                        10.0,
                      ),
                    ),
                  ),
                  child: Column(
                    children: [
                      Icon(
                        Icons.check,
                        color: ColorHelper.primaryColor,
                        size: 30,
                      ),
                      addVerticalSpace(15.0),
                      const Text(
                        'ดาวน์โหลดสำเร็จ',
                        style: TextStyle(
                          fontSize: 20.0,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      const Text(
                        'กรุณาตรวจสอบอัลบั้มของคุณ',
                        style: TextStyle(
                          fontSize: 16.0,
                        ),
                      ),
                    ],
                  )),
            ],
          );
        });
  }
}
