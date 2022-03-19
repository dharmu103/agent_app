import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:workerkhojo_agent_panel/getx/auth_controller.dart';
import 'package:workerkhojo_agent_panel/widgets/button.dart';
import 'package:workerkhojo_agent_panel/widgets/textfields.dart';

class SignupScreen extends StatelessWidget {
  const SignupScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final _controller = Get.put(AuthController());
    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.symmetric(
              horizontal: MediaQuery.of(context).size.width * 0.1,
              vertical: MediaQuery.of(context).size.height * 0.05),
          child: Form(
            key: _controller.signupFormKey,
            child: Column(
              children: [
                SizedBox(
                  height: MediaQuery.of(context).size.height * 0.1,
                ),
                Text(
                  'Complete Your Profile!',
                  style: Theme.of(context).textTheme.headline6,
                ),
                SizedBox(
                  height: MediaQuery.of(context).size.height * 0.05,
                  width: MediaQuery.of(context).size.width,
                ),
                textfield(
                  Icons.person_outline,
                  'Full Name',
                  _controller.fullnameTextController,
                  (value) => value.length < 7 ? 'Full Name is too Short' : null,
                ),
                SizedBox(
                  height: MediaQuery.of(context).size.height * 0.04,
                ),
                textfield(Icons.email_outlined, 'Email/Optional',
                    _controller.emailTextController, (value) => null),
                SizedBox(
                  height: MediaQuery.of(context).size.height * 0.04,
                ),
                SizedBox(
                  height: MediaQuery.of(context).size.height * 0.04,
                ),
                textfield(
                  Icons.location_on_outlined,
                  'City',
                  _controller.cityTextController,
                  (value) => value.length < 4 ? 'City name is too Short' : null,
                ),
                Row(children: [
                  Checkbox(value: true, onChanged: (value) {}),
                  const Text(
                    'Terms and Conditions',
                    style: TextStyle(color: Colors.indigo),
                  )
                ]),
                SizedBox(
                  height: MediaQuery.of(context).size.height * 0.1,
                ),
                GetBuilder<AuthController>(builder: (controller) {
                  return Column(
                    children: [
                      buildButton(
                        context,
                        'Submit',
                        Colors.indigo,
                        MediaQuery.of(context).size.width,
                        () {
                          _controller.signupFormKey.currentState!.validate()
                              ? controller.createProfile()
                              : null;
                        },
                      ),
                      TextButton(
                        onPressed: () => _controller.logout(),
                        child: const Text(
                          'Go Back & Login with another account',
                          style: TextStyle(color: Colors.indigo),
                        ),
                      )
                    ],
                  );
                })
              ],
            ),
          ),
        ),
      ),
    );
  }
}
