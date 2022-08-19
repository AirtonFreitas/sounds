import 'package:flutter/material.dart';

import '../../../../utils/colors_utils.dart';

class BottomNavigationItemWidget {
  BottomNavigationBarItem item({required String image, required String title}) {
    return BottomNavigationBarItem(
        icon: Image.asset(
          'assets/images_navigation/$image.png',
          width: 36,
          height: 36,
          color: ColorsUtils.yellowGray,
        ),
        activeIcon: Image.asset(
          'assets/images_navigation/$image.png',
          width: 72,
          height: 72,
        ),
        label: title);
  }
}
