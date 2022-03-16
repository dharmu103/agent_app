import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:workerkhojo_agent_panel/getx/auth_controller.dart';
import 'package:workerkhojo_agent_panel/widgets/button.dart';

class PhoneScreen extends StatelessWidget {
  const PhoneScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final _controller = Get.put(AuthController());

    return Scaffold(
      body: SizedBox(
        child: Padding(
          padding: EdgeInsets.symmetric(
              horizontal: MediaQuery.of(context).size.width * 0.1,
              vertical: MediaQuery.of(context).size.height * 0.05),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                alignment: Alignment.center,
                width: MediaQuery.of(context).size.width,
                height: MediaQuery.of(context).size.height * 0.18,
                child: Image.asset(
                  'assets/icon/icon.jpeg',
                  width: MediaQuery.of(context).size.width * 0.3,
                ),
              ),
              Text(
                'Welcome!',
                style: Theme.of(context).textTheme.headline6,
              ),
              SizedBox(
                height: MediaQuery.of(context).size.height * 0.05,
                width: MediaQuery.of(context).size.width,
              ),
              Text(
                'Enter Mobile Number',
                style: Theme.of(context).textTheme.headline6,
              ),
              SizedBox(
                height: MediaQuery.of(context).size.height * 0.02,
                width: MediaQuery.of(context).size.width,
              ),
              Form(
                key: _controller.phoneFormKey,
                child: TextFormField(
                  style: TextStyle(
                      fontSize: MediaQuery.of(context).size.width * 0.05,
                      fontWeight: FontWeight.w500),
                  validator: (value) {
                    if (!GetUtils.isLengthEqualTo(value!, 10)) {
                      return 'Please enter a valid phone number';
                    }
                    return null;
                  },
                  keyboardType: TextInputType.number,
                  inputFormatters: [FilteringTextInputFormatter.digitsOnly],
                  controller: _controller.phoneTextController,
                  decoration: InputDecoration(
                      focusedErrorBorder: const OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.red),
                      ),
                      filled: true,
                      fillColor: Colors.indigo[50],
                      border:
                          const OutlineInputBorder(borderSide: BorderSide.none),
                      prefixIcon: Container(
                        width: MediaQuery.of(context).size.width * 0.3,
                        alignment: Alignment.center,
                        child: Text(
                          'India +91',
                          style: TextStyle(
                            fontSize: MediaQuery.of(context).size.width * 0.048,
                            fontWeight: FontWeight.w400,
                          ),
                        ),
                      )),
                ),
              ),
              const Expanded(child: SizedBox()),
              GetBuilder<AuthController>(builder: (controller) {
                return buildButton(
                  context,
                  'Send OTP',
                  Colors.indigo,
                  MediaQuery.of(context).size.width,
                  () {
                    _controller.phoneFormKey.currentState!.validate()
                        ? controller.sendOtp()
                        : null;
                  },
                );
              }),
            ],
          ),
        ),
      ),
    );
  }
}
