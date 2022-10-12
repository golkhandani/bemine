import 'package:be_mine/components/app/app_bar.dart';
import 'package:be_mine/components/box/featured_box.dart';
import 'package:be_mine/components/box/map_box.dart';

import 'package:be_mine/controllers/splash_controller.dart';
import 'package:be_mine/controllers/theme_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SettingPage extends StatelessWidget {
  SettingPage({Key? key}) : super(key: key);

  final ThemeController theme = Get.put(ThemeController());
  final SplashController sc = Get.put(SplashController());

  @override
  Widget build(BuildContext context) {
    return Obx(
      () {
        bool switchVal = theme.current.value == ThemeType.dark ? false : true;
        return Scaffold(
            body: CustomScrollView(
          physics: const NeverScrollableScrollPhysics(),
          slivers: [
            AppBarContainer(
              appBarWidget: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  RichText(
                    text: TextSpan(
                      children: [
                        TextSpan(
                          text: "Setting",
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            color: theme.textColor.value,
                            fontSize: 20,
                          ),
                        )
                      ],
                    ),
                  ),
                ],
              ),
            ),
            SliverFillRemaining(
              hasScrollBody: false,
              fillOverscroll: false,
              child: SizedBox.expand(
                child: Container(
                  color: theme.scaffoldBackground.value,
                  child: Switch(
                    value: switchVal,
                    activeColor: Colors.white,
                    hoverColor: Colors.green,
                    activeTrackColor: Colors.blue,
                    splashRadius: 30,
                    trackColor: MaterialStateProperty.all(
                      switchVal ? Colors.amber : Colors.grey,
                    ),
                    inactiveThumbColor: Colors.grey,
                    inactiveThumbImage: const AssetImage('assets/moon.png'),
                    activeThumbImage: const AssetImage('assets/sun.png'),
                    onChanged: (val) {
                      theme.switchTheme();
                    },
                  ),
                ),
              ),
            ),
          ],
        ));
      },
    );
  }
}
