import 'package:be_mine/controllers/theme_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class NavigationBarButton extends StatelessWidget {
  NavigationBarButton({
    Key? key,
    required this.onPressed,
    required this.icon,
    required this.enable,
    required this.text,
    this.color,
  }) : super(key: key);
  final ThemeController theme = Get.put(ThemeController());

  final void Function()? onPressed;
  final IconData icon;
  final bool enable;
  final String text;
  final Color? color;
  @override
  Widget build(BuildContext context) {
    final width = (MediaQuery.of(context).size.width / 4).floorToDouble();
    return SizedBox(
      width: width,
      child: GestureDetector(
        onTap: onPressed,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Icon(
              icon,
              size: enable ? 35 : 25,
              color: enable
                  ? color ?? theme.accentColor.value
                  : theme.textColor.value,
            ),
            const SizedBox(height: 4),
            Text(
              text,
              style: TextStyle(
                color: enable
                    ? color ?? theme.accentColor.value
                    : theme.textColor.value,
                fontSize: enable ? 12 : 10,
                fontWeight: FontWeight.bold,
              ),
            )
          ],
        ),
      ),
    );
    //   return RawMaterialButton(
    //     onPressed: onPressed,
    //     animationDuration: const Duration(milliseconds: 300),
    //     splashColor: Colors.transparent,
    //     enableFeedback: true,
    //     highlightColor: Colors.transparent,
    //     child: Column(
    //       children: [
    //         Container(
    //           padding: const EdgeInsets.all(8),
    //           decoration: BoxDecoration(
    //             border: Border.all(
    //                 width: 1, color: enable ? Colors.black87 : Colors.black38),
    //             color: Colors.white,
    //             borderRadius: const BorderRadius.all(Radius.elliptical(120, 100)),
    //             shape: BoxShape.rectangle,
    //           ),
    //           child: Icon(
    //             icon,
    //             color: enable ? Colors.black87 : Colors.black38,
    //             size: 25,
    //           ),
    //         ),
    //         if (text != null)
    //           Text(
    //             text!,
    //             style: TextStyle(
    //               color: enable ? Colors.black87 : Colors.black38,
    //             ),
    //           )
    //       ],
    //     ),
    //   );
  }
}
