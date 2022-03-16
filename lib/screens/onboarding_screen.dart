import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:workerkhojo_agent_panel/getx/onboarding_controller.dart';

import 'authscreens/phone_screen.dart';

class OnBoardingScreen extends StatelessWidget {
  const OnBoardingScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final _pageController = Get.put(OnBoardingController());

    return Scaffold(
      body: Stack(
        children: [
          PageView.builder(
              physics: const NeverScrollableScrollPhysics(),
              controller: _pageController.pcontroller,
              itemCount: _pageController.info.length,
              itemBuilder: (context, index) {
                return Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    SizedBox(
                      child: Image.asset(
                        'assets/onboardingimg/onboarding_$index.png',
                        height: Get.height * 0.45,
                        fit: BoxFit.fitHeight,
                      ),
                    ),
                    SizedBox(height: MediaQuery.of(context).size.height * 0.08),
                    SizedBox(
                      width: MediaQuery.of(context).size.width * 0.8,
                      child: Column(
                        children: [
                          Text(
                            _pageController.info[index]['title'],
                            style: Theme.of(context).textTheme.headline6,
                            textAlign: TextAlign.center,
                          ),
                          SizedBox(
                              height:
                                  MediaQuery.of(context).size.height * 0.03),
                          Text(
                            _pageController.info[index]['description'],
                            style: Theme.of(context).textTheme.subtitle1,
                            textAlign: TextAlign.center,
                          )
                        ],
                      ),
                    )
                  ],
                );
              }),
          Positioned(
              bottom: MediaQuery.of(context).size.height * .1,
              child: Container(
                alignment: Alignment.center,
                height: Get.height * .1,
                width: Get.width,
                child: ListView.builder(
                    shrinkWrap: true,
                    physics: const NeverScrollableScrollPhysics(),
                    itemCount: 3,
                    scrollDirection: Axis.horizontal,
                    itemBuilder: (context, index) => Padding(
                          padding: const EdgeInsets.all(6.0),
                          child: Obx(() => CircleAvatar(
                                radius: 8,
                                backgroundColor:
                                    _pageController.nextPageIndex == index.obs
                                        ? Colors.indigo
                                        : Colors.grey,
                              )),
                        )),
              )),
          Positioned(
            bottom: Get.height * 0.05,
            right: MediaQuery.of(context).size.width * .05,
            child: SizedBox(
              width: MediaQuery.of(context).size.width * 0.2,
              child: GestureDetector(
                onTap: () {
                  _pageController.nextPageIndex == 2.obs
                      ? Get.to(const PhoneScreen())
                      : _pageController.nextPage();
                },
                child: CircleAvatar(
                  radius: 30,
                  backgroundColor: Colors.indigo[50],
                  child: Icon(Icons.chevron_right,
                      size: Get.height * 0.05, color: Colors.indigo),
                ),
              ),
            ),
          ),
          Positioned(
              bottom: MediaQuery.of(context).size.width * .1,
              left: MediaQuery.of(context).size.width * .05,
              child: SizedBox(
                  width: MediaQuery.of(context).size.width * 0.2,
                  child: Obx(() {
                    return Visibility(
                      visible:
                          _pageController.nextPageIndex == 0.obs ? false : true,
                      child: GestureDetector(
                        onTap: () {
                          _pageController.priviousPage();
                        },
                        child: CircleAvatar(
                          radius: 30,
                          backgroundColor: Colors.indigo[50],
                          child: Icon(Icons.chevron_left,
                              size: Get.height * 0.05, color: Colors.indigo),
                        ),
                      ),
                    );
                  }))),
          Positioned(
              top: MediaQuery.of(context).size.width * .1,
              right: MediaQuery.of(context).size.width * .05,
              child: TextButton(
                onPressed: () {
                  Get.to(const PhoneScreen());
                },
                child: const Text('Skip'),
              ))
        ],
      ),
    );
  }
}
