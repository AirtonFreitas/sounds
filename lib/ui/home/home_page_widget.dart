import 'package:admob_flutter/admob_flutter.dart';
import 'package:flutter/material.dart';

import '../../utils/colors_utils.dart';
import 'components/animals_body_widget.dart';
import 'components/crazy_body_widget.dart';
import 'components/navigation/bottom_navigation_item_widget.dart';
import 'components/tools_body_widget.dart';

class HomePageWidget extends StatefulWidget {
  const HomePageWidget({Key? key}) : super(key: key);

  @override
  State<HomePageWidget> createState() => _HomePageWidgetState();
}

class _HomePageWidgetState extends State<HomePageWidget> {
  int _selectedIndex = 0;
  late AdmobInterstitial interstitialAd;


  @override
  void initState() {
    super.initState();
    interstitialAd = AdmobInterstitial(
      adUnitId: 'ca-app-pub-3721429763641925/2816689589',
    );
    interstitialAd.load();
  }



  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [SizedBox(height: 32,),
            Container(
            child: getBanner(AdmobBannerSize.BANNER),
          ),
            _widgetOptions.elementAt(_selectedIndex),
            Container(
              child: getBanner(AdmobBannerSize.BANNER),
            ),
          ],
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: ColorsUtils.yellow,
        items: [
          BottomNavigationItemWidget().item(image: 'animals', title: 'Animais'),
          BottomNavigationItemWidget()
              .item(image: 'tools', title: 'Ferramentas'),
          BottomNavigationItemWidget().item(image: 'crazy', title: 'Diversos'),
        ],
        currentIndex: _selectedIndex,
        selectedItemColor: ColorsUtils.yellowNav,
        onTap:_onItemTapped,
      ),
    );
  }

  static const List<Widget> _widgetOptions = <Widget>[
    AnimalsBody(),
    ToolsBody(),
    CrazyBody()
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
      showInterstitial;
    });
  }

  AdmobBanner getBanner(AdmobBannerSize size) {
    return AdmobBanner(
      adUnitId: 'ca-app-pub-3721429763641925/4314685659',
      adSize: size,
    );
  }

  void showInterstitial() {
      interstitialAd.show();
  }
}
