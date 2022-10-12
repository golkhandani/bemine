import 'package:be_mine/components/navigation/navigation_bar_container.dart';
import 'package:be_mine/components/app/page_viewer.dart';
import 'package:be_mine/controllers/theme_controller.dart';
import 'package:be_mine/models/page_model.dart';
import 'package:be_mine/pages/setting_page.dart';
import 'package:be_mine/pages/splash_page.dart';
import 'package:be_mine/pages/trip_list_page.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

void main() {
  runApp(GetMaterialApp(
    home: PageContainerView(),
  ));
}

class PageContainerController extends GetxController {
  var selectedPageNumber = 0.obs;
  var pageControl = PageController(
    keepPage: true,
  ).obs;

  List<AppPage> pages = [
    AppPage(
      id: 'featured',
      title: 'Featured',
      widget: FeaturedPage(),
      color: Colors.blueAccent,
      icon: Icons.featured_play_list_outlined,
    ),
    AppPage(
      id: 'list',
      title: 'List',
      widget: TripListPage(),
      color: Colors.orangeAccent,
      icon: Icons.list_alt_outlined,
    ),
    AppPage(
      id: 'community',
      title: 'Community',
      widget: SettingPage(),
      color: Colors.redAccent,
      icon: Icons.favorite_border_outlined,
    ),
    AppPage(
      id: 'setting',
      title: 'Setting',
      widget: SettingPage(),
      color: Colors.blueGrey,
      icon: Icons.settings_outlined,
    ),
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
  final ThemeController theme = Get.put(ThemeController());

  @override
  Widget build(BuildContext context) {
    return Obx(
      () => Scaffold(
        backgroundColor: theme.scaffoldBackground.value,
        body: PageViewer(),
        bottomNavigationBar: NavigationBarContainer(),
      ),
    );
  }
}
