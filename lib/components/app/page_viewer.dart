import 'package:be_mine/main.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class PageViewer extends StatelessWidget {
  PageViewer({
    Key? key,
  }) : super(key: key);

  final PageContainerController pc = Get.put(PageContainerController());
  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async => false,
      child: Stack(
        children: [
          Container(
            // margin: const EdgeInsets.only(bottom: 16 + 80 + 32),
            color: Colors.black,
            child: PageView.builder(
              physics: const NeverScrollableScrollPhysics(),
              controller: pc.pageControl.value,
              itemCount: pc.pages.length,
              itemBuilder: (ctx, i) {
                return pc.pages[i].widget;
              },
            ),
          ),
          // HoverNavigationBar(pc: pc)
        ],
      ),
    );
  }
}
