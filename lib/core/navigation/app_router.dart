import 'package:dispatcher/core/navigation/route_names.dart';
import 'package:dispatcher/features/location/domain/use_cases/FetchLocation.dart';
import 'package:dispatcher/features/location/presentation/view_models/map_view_model.dart';
import 'package:dispatcher/features/location/presentation/views/pages/location_permission_request_page.dart';
import 'package:dispatcher/features/location/presentation/views/pages/map_page.dart';
import 'package:dispatcher/features/login/presentation/view_models/login_view_model.dart';
import 'package:dispatcher/features/login/presentation/views/pages/login_page.dart';
import 'package:dispatcher/features/main/presentation/views/pages/home_page.dart';
import 'package:dispatcher/features/main/presentation/views/pages/service_selection_page.dart';
import 'package:dispatcher/features/main/presentation/views/pages/unknown_page.dart';
import 'package:dispatcher/features/onboarding/presentation/ui/screens/onboarding.dart';
import 'package:dispatcher/features/onboarding/presentation/ui/screens/splash_screen.dart';
import 'package:dispatcher/features/onboarding/presentation/view_models/onboarding_view_model.dart';
import 'package:dispatcher/features/onboarding/presentation/view_models/splash_view_model.dart';
import 'package:dispatcher/features/phone_verification/presentation/view_models/phone_verification_view_model.dart';
import 'package:dispatcher/features/phone_verification/presentation/views/pages/phone_verification_page.dart';
import 'package:dispatcher/features/phone_verification/presentation/views/pages/phone_verified_page.dart';
import 'package:dispatcher/features/sign_up/presentation/view_models/sign_up_view_model.dart';
import 'package:dispatcher/features/sign_up/presentation/views/pages/sign_up.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:dispatcher/injection_container.dart' as injector;

class AppRouter {
  Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case RouteNames.HOME:
        return MaterialPageRoute(
          builder: (_) => HomePage(),
        );
      case RouteNames.LOCATION_PERMISSION_REQUEST:
        return MaterialPageRoute(
          builder: (_) => LocationPermissionRequestPage(),
        );
      case RouteNames.LOGIN:
        return MaterialPageRoute(
          builder: (_) => ChangeNotifierProvider<LoginViewModel>(
            create: (_) => LoginViewModel(),
            child: LoginPage(),
          ),
        );
      case RouteNames.MAP:
        return MaterialPageRoute(
          builder: (context) => ChangeNotifierProvider<MapViewModel>(
            create: (_) => MapViewModel(
              fetchLocation: injector.serviceLocator<FetchLocation>(),
            ),
            child: MapPage(),
          ),
        );
      case RouteNames.ONBOARDING:
        return MaterialPageRoute(
          builder: (_) => ChangeNotifierProvider<OnboardingViewModel>(
            create: (_) => OnboardingViewModel(),
            child: OnboardingScreen(),
          ),
        );
      case RouteNames.PHONE_VERIFICATION:
        return MaterialPageRoute(
          builder: (_) => ChangeNotifierProvider<PhoneVerificationViewModel>(
            create: (_) => PhoneVerificationViewModel(),
            child: PhoneVerificationPage(),
          ),
        );
      case RouteNames.PHONE_VERIFIED:
        return MaterialPageRoute(
          builder: (_) => PhoneVerifiedPage(),
        );
      case RouteNames.SERVICE_SELECTION:
        return MaterialPageRoute(
          builder: (_) => ServiceSelectionPage(),
        );
      case RouteNames.SIGN_UP:
        return MaterialPageRoute(
          builder: (_) => ChangeNotifierProvider<SignUpViewModel>(
            create: (_) => SignUpViewModel(),
            child: SignUpPage(),
          ),
        );
      case RouteNames.SPLASH:
        return MaterialPageRoute(
          builder: (_) => ChangeNotifierProvider<SplashViewModel>(
            create: (_) => SplashViewModel(),
            child: SplashScreen(),
          ),
        );
      default:
        return MaterialPageRoute(
          builder: (_) => UnknownPage(),
        );
    }
  }
}
