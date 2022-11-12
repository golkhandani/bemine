import 'package:be_mine/components/navigation_bar_button.dart';
import 'package:be_mine/controllers/page_container_controller.dart';
import 'package:be_mine/main.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class PageContainerView extends StatelessWidget {
  PageContainerView({Key? key}) : super(key: key);

  final PageContainerController pc = Get.put(PageContainerController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: WillPopScope(
        onWillPop: () async => false,
        child: SafeArea(
          child: Container(
            color: Colors.black,
            child: PageView.builder(
              controller: pc.pageControl.value,
              itemCount: 4,
              itemBuilder: (ctx, i) {
                return pc.pages[i];
              },
            ),
          ),
        ),
      ),
      bottomNavigationBar: Obx(
        () => createNavigationButtons(),
      ),
    );
  }

  Container createNavigationButtons() {
    return Container(
      height: 100,
      decoration: BoxDecoration(
        color: Colors.white,
        border: Border(
          top: BorderSide(
            color: Colors.black,
            width: 2,
          ),
        ),
      ),
      padding: const EdgeInsets.symmetric(vertical: 8),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          NavigationBarButton(
            onPressed: () => pc.changePage(0),
            icon: Icons.home,
            enable: pc.selectedPageNumber.value == 0,
            text: "Paths",
          ),
          NavigationBarButton(
            onPressed: () => pc.changePage(1),
            icon: Icons.festival,
            enable: pc.selectedPageNumber.value == 1,
            text: "Featureds",
          ),
          NavigationBarButton(
            onPressed: () => pc.changePage(2),
            icon: Icons.favorite,
            enable: pc.selectedPageNumber.value == 2,
            text: "Mine",
          ),
          NavigationBarButton(
            onPressed: () => pc.changePage(3),
            icon: Icons.person,
            enable: pc.selectedPageNumber.value == 3,
            text: "Settings",
          ),
        ],
      ),
    );
  }
}
