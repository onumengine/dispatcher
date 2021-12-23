import 'package:dispatcher/features/login/presentation/views/components/login_canvas.dart';
import 'package:dispatcher/features/phone_verification/presentation/view_models/phone_verification_view_model.dart';
import 'package:dispatcher/features/phone_verification/presentation/views/components/number_input_component.dart';
import 'package:dispatcher/features/phone_verification/presentation/views/components/otp_input_component.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class PhoneVerificationPage extends StatelessWidget {
  final List<Widget> _components = [
    NumberInputComponent(),
    OtpInputComponent(),
  ];

  PhoneVerificationPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Consumer<PhoneVerificationViewModel>(
          builder: (context, viewModel, child) {
        return LayoutBuilder(builder: (context, constraints) {
          return Stack(
            alignment: AlignmentDirectional.center,
            children: <Widget>[
              LoginCanvas(),
              Positioned(
                bottom: 0,
                child: Container(
                  width: constraints.maxWidth / 1.07,
                  height: constraints.maxHeight / 1.11,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(10),
                      topRight: Radius.circular(10),
                    ),
                    color: Colors.white,
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black.withOpacity(0.05),
                        blurRadius: 4,
                        spreadRadius: 4,
                      ),
                    ],
                  ),
                  child: _components[viewModel.currentPageIndex],
                ),
              ),
            ],
          );
        });
      }),
    );
  }
}
