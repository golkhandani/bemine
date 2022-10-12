import 'dart:ui';

import 'package:be_mine/controllers/theme_controller.dart';
import 'package:be_mine/main.dart';
import 'package:be_mine/shared/constants.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class NavigationBarContainer extends StatelessWidget {
  NavigationBarContainer({
    Key? key,
  }) : super(key: key);

  final PageContainerController pc = Get.put(PageContainerController());
  final ThemeController theme = Get.put(ThemeController());
  @override
  Widget build(BuildContext context) {
    return Obx(
      () => ClipRRect(
        child: Container(
          padding: const EdgeInsets.all(10),
          child: BackdropFilter(
            filter: kblurFilter,
            child: Container(
              height: kNavigationBarContainer,
              color: theme.navigationBarBackgroundColor.value.withOpacity(0.2),
              child: Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: pc.pages.map((e) {
                    final index = pc.pages.indexOf(e);
                    final page = pc.pages[index];
                    return NavigationBarButton(
                      onPressed: () => pc.changePage(index),
                      icon: page.icon,
                      color: page.color,
                      enable: pc.selectedPageNumber.value == index,
                      text: page.title,
                    );
                  }).toList()),
            ),
          ),
        ),
      ),
    );
  }
}

class HoverNavigationBar extends StatelessWidget {
  const HoverNavigationBar({
    Key? key,
    required this.pc,
  }) : super(key: key);

  final PageContainerController pc;

  @override
  Widget build(BuildContext context) {
    return Positioned(
      bottom: 16,
      child: Container(
        width: context.width - 32,
        margin: const EdgeInsets.only(right: 16, left: 16, bottom: 32),
        padding: const EdgeInsets.all(0),
        child: ClipRRect(
          borderRadius: const BorderRadius.all(Radius.circular(25)),
          child: Container(
            color: Colors.black.withOpacity(0.9),
            child: BackdropFilter(
              filter: ImageFilter.blur(sigmaX: 1.0, sigmaY: 1.0),
              child: Container(
                color: Colors.transparent,
                height: 80,
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    NavigationBarButton(
                      onPressed: () => pc.changePage(0),
                      icon: Icons.home,
                      enable: pc.selectedPageNumber.value == 0,
                      text: "Home",
                    ),
                    NavigationBarButton(
                      onPressed: () => pc.changePage(1),
                      icon: Icons.list,
                      enable: pc.selectedPageNumber.value == 1,
                      text: "Notif",
                    ),
                    NavigationBarButton(
                      onPressed: () => pc.changePage(2),
                      icon: Icons.favorite_border,
                      enable: pc.selectedPageNumber.value == 2,
                      text: "Page 3",
                    ),
                    NavigationBarButton(
                      onPressed: () => pc.changePage(3),
                      icon: Icons.person,
                      enable: pc.selectedPageNumber.value == 3,
                      text: "Setting",
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}

class NavigationBarButton extends StatelessWidget {
  NavigationBarButton({
    Key? key,
    required this.onPressed,
    required this.icon,
    required this.enable,
    this.color = Colors.black87,
    this.text,
  }) : super(key: key);
  final void Function()? onPressed;
  final IconData icon;
  final bool enable;
  final String? text;
  final Color color;
  final ThemeController theme = Get.put(ThemeController());

  @override
  Widget build(BuildContext context) {
    return RawMaterialButton(
      onPressed: onPressed,
      animationDuration: const Duration(milliseconds: 300),
      elevation: 6,
      splashColor: Colors.transparent,
      enableFeedback: true,
      highlightColor: Colors.transparent,
      child: Obx(() {
        final disableColor = theme.navigationBtnDisableColor.value;
        print("disableColor $disableColor");
        return Column(
          children: [
            Container(
              margin: const EdgeInsets.only(
                bottom: kMarginSmall,
                top: kMarginMedium,
              ),
              padding: const EdgeInsets.all(kMarginSmall),
              decoration: BoxDecoration(
                border: Border.all(
                  width: kBoxBorderWidth,
                  color: enable ? color : theme.navigationBtnDisableColor.value,
                ),
                color: enable ? color.withOpacity(0.2) : Colors.transparent,
                borderRadius:
                    const BorderRadius.all(Radius.elliptical(110, 100)),
                shape: BoxShape.rectangle,
              ),
              child: Icon(
                icon,
                color: enable ? color : theme.navigationBtnDisableColor.value,
                size: 24,
              ),
            ),
            if (text != null)
              Text(
                text!,
                style: TextStyle(
                  color: enable ? color : disableColor,
                ),
              )
          ],
        );
      }),
    );
  }
}
