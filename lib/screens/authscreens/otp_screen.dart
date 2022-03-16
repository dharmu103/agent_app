import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:pin_code_fields/pin_code_fields.dart';
import 'package:workerkhojo_agent_panel/getx/auth_controller.dart';
import 'package:workerkhojo_agent_panel/getx/otp_time_controller.dart';
import 'package:workerkhojo_agent_panel/widgets/button.dart';

class OtpScreen extends StatelessWidget {
  const OtpScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final _controller = Get.put(AuthController());
    final _timercontroller = Get.put(OtpTimerController());
    return Scaffold(
      body: SizedBox(
        child: Padding(
          padding: EdgeInsets.symmetric(
              horizontal: MediaQuery.of(context).size.width * 0.1,
              vertical: MediaQuery.of(context).size.height * 0.05),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                height: MediaQuery.of(context).size.height * 0.05,
                width: MediaQuery.of(context).size.width,
              ),
              Text(
                'Phone Number Verification',
                style: Theme.of(context).textTheme.headline6,
              ),
              SizedBox(
                height: MediaQuery.of(context).size.height * 0.02,
                width: MediaQuery.of(context).size.width,
              ),
              Text.rich(TextSpan(
                text:
                    'We have sent you an OTP to your Registered Phone Number ',
                style: Theme.of(context).textTheme.bodyText2,
                children: [
                  TextSpan(
                    text: _controller.phoneTextController.text,
                    style: TextStyle(
                        color: Theme.of(context).primaryColor,
                        fontSize:
                            Theme.of(context).textTheme.bodyText2?.fontSize),
                  ),
                ],
              )),
              SizedBox(
                height: MediaQuery.of(context).size.height * 0.05,
                width: MediaQuery.of(context).size.width,
              ),
              PinCodeTextField(
                appContext: context,
                length: 6,
                onChanged: (value) {
                  if (value.length == 6) {
                    _controller.verifyOtp(value);
                  }
                },
                animationType: AnimationType.fade,
                keyboardType: TextInputType.number,
                inputFormatters: [FilteringTextInputFormatter.digitsOnly],
              ),
              Obx(() => Container(
                  alignment: Alignment.center,
                  height: MediaQuery.of(context).size.height * 0.05,
                  child: _controller.isverifing == true.obs
                      ? const CircularProgressIndicator()
                      : null)),
              Obx(
                () {
                  return Row(children: [
                    TextButton(
                      onPressed: _timercontroller.timer > 0
                          ? null
                          : () {
                              _controller.resendOtp();
                            },
                      child: Text(
                        'Resend OTP',
                        style: TextStyle(
                          color: _timercontroller.timer > 0
                              ? Theme.of(context).disabledColor
                              : Theme.of(context).primaryColor,
                          fontSize: MediaQuery.of(context).size.height * 0.02,
                        ),
                      ),
                    ),
                    _timercontroller.timer > 0
                        ? Text('in ${_timercontroller.timer} seconds',
                            style: TextStyle(
                              fontSize:
                                  MediaQuery.of(context).size.height * 0.02,
                            ))
                        : const SizedBox()
                  ]);
                },
              ),
              SizedBox(
                height: MediaQuery.of(context).size.height * 0.05,
                width: MediaQuery.of(context).size.width,
              ),
              const Expanded(
                child: SizedBox(),
              ),
              GetBuilder<AuthController>(builder: (controller) {
                return buildButton(context, 'Verify', Colors.indigo,
                    MediaQuery.of(context).size.width, () {});
              })
            ],
          ),
        ),
      ),
    );
  }
}
