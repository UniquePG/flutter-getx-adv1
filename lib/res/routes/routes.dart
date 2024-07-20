import 'package:get/get.dart';
import 'package:getx_adv1/res/routes/route_names.dart';
import 'package:getx_adv1/view/splash_screen.dart';

class AppRoutes {
  static appRoutes() => [

    GetPage(name: RouteNames.splashScreen, page: ()=> SplashScreen(), transition: Transition.leftToRightWithFade, transitionDuration: Duration(milliseconds: 200)),

  ];
}
