import 'package:be_mine/components/map_container.dart';
import 'package:be_mine/pages/featured_items_page.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  // Get.put(MapContainerController());
  runApp(GetMaterialApp(
    home: PageContainerView(),
  ));
}

class PageContainerController extends GetxController {
  var selectedPageNumber = 0.obs;
  var pageControl = PageController(
    keepPage: true,
  ).obs;
  final _pages = [
    SizedBox.expand(
      child: Container(
        color: Colors.greenAccent,
      ),
    ),
    SplashPage(),
    SizedBox.expand(
      child: Container(
        color: Colors.amber,
      ),
    ),
    SizedBox.expand(
      child: Container(
        color: Colors.red,
      ),
    )
  ];
  changePage(index) {
    if (pageControl.value.hasClients) {
      pageControl.value.jumpToPage(index);
      selectedPageNumber.value = index;
    }
    update();
  }
}

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
                return pc._pages[i];
              },
            ),
          ),
        ),
      ),
      bottomNavigationBar: Obx(
        () => Container(
          height: 80,
          color: Colors.white,
          padding: EdgeInsets.symmetric(horizontal: 16),
          child: Row(
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
                text: "Page 4",
              ),
            ],
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
    this.text,
  }) : super(key: key);
  final void Function()? onPressed;
  final IconData icon;
  final bool enable;
  final String? text;
  @override
  Widget build(BuildContext context) {
    return RawMaterialButton(
      onPressed: onPressed,
      animationDuration: Duration(milliseconds: 300),
      constraints: BoxConstraints(
          maxHeight: 64, maxWidth: 64, minHeight: 64, minWidth: 64),
      elevation: 6,
      splashColor: Colors.transparent,
      enableFeedback: true,
      highlightColor: Colors.transparent,
      child: Column(
        children: [
          Container(
            padding: EdgeInsets.all(8),
            decoration: BoxDecoration(
              border: Border.all(
                  width: 1, color: enable ? Colors.black87 : Colors.black38),
              color: Colors.white,
              borderRadius: BorderRadius.all(Radius.elliptical(120, 100)),
              shape: BoxShape.rectangle,
            ),
            child: Icon(
              icon,
              color: enable ? Colors.black87 : Colors.black38,
              size: 25,
            ),
          ),
          if (text != null)
            Text(
              text!,
              style: TextStyle(
                color: enable ? Colors.black87 : Colors.black38,
              ),
            )
        ],
      ),
    );
  }
}
