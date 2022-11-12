import 'package:be_mine/pages/featured_items_page.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class PageContainerController extends GetxController {
  var selectedPageNumber = 0.obs;
  var pageControl = PageController(
    keepPage: true,
  ).obs;
  final pages = [
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
  }
}
