import 'package:flutter/material.dart';

import 'package:mongkhon_lens/information_page.dart';
import 'package:mongkhon_lens/mental_page.dart';
import 'package:mongkhon_lens/object_detector_view.dart';
import 'package:mongkhon_lens/preview_page.dart';
import 'package:mongkhon_lens/text_detector_view.dart';

Route<dynamic> generateRoute(RouteSettings settings) {
  final args = settings.arguments as dynamic;

  switch (settings.name) {
    case TextRecognizerView.routeName:
      return _FadeRoute(const TextRecognizerView(), settings);
    case InformationPage.routeName:
      return _FadeRoute(const InformationPage(), settings);
    case MentalPage.routeName:
      return _FadeRoute(const MentalPage(), settings);
    case PreviewPage.routeName:
      return _FadeRoute(const MentalPage(), settings);
    case ObjectDetectorView.routeName:
      return _FadeRoute(const ObjectDetectorView(), settings);

    default:
      return _getPageRoute(const InformationPage(), settings);
  }
}

PageRoute _getPageRoute(Widget child, RouteSettings settings) {
  return _FadeRoute(child, settings);
}

class _FadeRoute extends PageRouteBuilder {
  final Widget child;
  final RouteSettings routeName;
  _FadeRoute(this.child, this.routeName)
      : super(
          settings: RouteSettings(
              name: routeName.name, arguments: routeName.arguments),
          pageBuilder: (
            BuildContext context,
            Animation<double> animation,
            Animation<double> secondaryAnimation,
          ) =>
              child,
          transitionsBuilder: (
            BuildContext context,
            Animation<double> animation,
            Animation<double> secondaryAnimation,
            Widget child,
          ) =>
              FadeTransition(
            opacity: animation,
            child: child,
          ),
        );
}
