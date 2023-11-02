import 'package:flutter/material.dart';

class ScreenHelper {
  bool isMobile(BuildContext context) =>
      MediaQuery.of(context).size.width < 768;

  bool isTablet(BuildContext context) =>
      MediaQuery.of(context).size.width >= 768 &&
      MediaQuery.of(context).size.width < 1024;

  bool isDesktop(BuildContext context) =>
      MediaQuery.of(context).size.width >= 1024;

  getCrossAxisCount(BuildContext context) {
    final ScreenHelper display = ScreenHelper();

    if (display.isMobile(context)) {
      return 1;
    } else if (display.isTablet(context)) {
      return 2;
    } else {
      return 2;
    }
  }

  double getChildAspectRatio(BuildContext context) {
    final width = MediaQuery.of(context).size.width;

    if (width <= 350) {
      return 0.44;
    }

    if (width <= 400) {
      return 0.5;
    }

    if (width <= 430) {
      return 0.54;
    }

    if (width <= 450) {
      return 0.56;
    }

    if (width <= 500) {
      return 0.58;
    }

    if (width <= 550) {
      return 0.6;
    }

    if (width <= 600) {
      return 0.62;
    }

    if (width <= 650) {
      return 0.64;
    }

    if (width <= 700) {
      return 0.66;
    }

    if (width <= 768) {
      return 0.68;
    }

    return 0.4;
  }
}
