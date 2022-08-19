import 'package:flutter/material.dart';

import '../ui/home/home_page_widget.dart';

class RouteGenerator {

  static Route<dynamic>? generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case 'home':
        return MaterialPageRoute(builder: (_) => HomePageWidget());
        break;


      default:
        _erroRoute();
    }
  }

  static Route<dynamic> _erroRoute() {
    return MaterialPageRoute(builder: (_) {
      return Scaffold(
        appBar: PreferredSize(
          preferredSize: Size.fromHeight(65),
          child: Text('ERROR'),
        ),
        body: Text('Página não encontrada'),
      );
    });
  }
}
