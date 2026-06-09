import 'package:get/get.dart';
import 'package:medical_health_title/features/fourthpage/fourthpage_binding/fourthpage_binding.dart';
import 'package:medical_health_title/features/fourthpage/fourthpage_view/fourthpage_view.dart';
import 'package:medical_health_title/features/homepage/binding/home_auth_binding.dart';
import 'package:medical_health_title/features/homepage/view/home_auth_view.dart';
import 'package:medical_health_title/features/secondpage/secondpage_binding/secondpage_binding.dart';
import 'package:medical_health_title/features/secondpage/secondpage_view/secondpage_view.dart';
import 'package:medical_health_title/features/thirdpage/thirdpage_binding/thirdpage_binding.dart';
import 'package:medical_health_title/features/thirdpage/thirdpage_view/thirdpage_view.dart';
import 'package:medical_health_title/routes/app_routes.dart';


class AppPages {
  static final pages = [
    GetPage(name: AppRoutes.auth,
        page: () => const Homepage(),
       binding: HomeAuthBinding(),
    ),
    GetPage(name: AppRoutes.secondPage,
        page: () => const SecondpageView() ,
        binding: SecondpageBinding(),
    ),
    GetPage(name:AppRoutes.thirdPage,
        page: () => const ThirdpageView(),
        binding: ThirdpageBinding(),
    ),
    GetPage(name: AppRoutes.fourthPage,
        page: () => const FourthpageView() ,
        binding: FourthpageBinding(),

    )
  ];
}