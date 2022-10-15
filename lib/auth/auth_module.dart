import 'package:cater_me_bloc/auth/ui/screens/log_in_list.dart';
import 'package:cater_me_bloc/auth/ui/screens/otp_screen.dart';
import 'package:cater_me_bloc/auth/ui/screens/sign_up_list.dart';
import 'package:flutter/material.dart';
import 'package:injectable/injectable.dart';
import '../abstracts/module/rout_module.dart';
import 'auth_module_route.dart';

@injectable
class  LogInModule extends RoutModule {

  final loginScreen _login;
  final SignupScreen _signUp;
  final PinCodeVerificationScreen _pinCodeVerificationScreen;

  LogInModule(this._login,this._signUp,this._pinCodeVerificationScreen) {
    RoutModule.RoutesMap.addAll(getRoutes());
  }

  Map<String, WidgetBuilder> getRoutes() {
    return {

      AuthRoutes.login: (context) => _login,
      AuthRoutes.signUp: (context) => _signUp,
      AuthRoutes.OTP_SCREEN: (context) => _pinCodeVerificationScreen,



    };
  }
}
