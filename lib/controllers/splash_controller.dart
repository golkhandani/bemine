import 'package:get/get.dart';
import 'package:latlong2/latlong.dart';

class SplashController extends GetxController {
  var count = 0.obs;
  var kSplashScreenSpaceBarBackground =
      "https://unsplash.com/photos/C3EENZfRh2s/download?ixid=MnwxMjA3fDB8MXxjb2xsZWN0aW9ufDE4fGR6Y25tVHFFcmlvfHx8fHwyfHwxNjQ3MTcxMDQ4&force=true&w=1920";

  var kSplashScreenSpaceTitle = "Welcome to Be Mine";

  var itemIndex = 0.obs;
  changeItem(int index) {
    itemIndex.value = index;
    print(index);
    update();
  }

  var mapCenterItem = LatLng(51.502, -0.09).obs;
  //final MapController mapController = MapController();
  changemapCenterItem(LatLng latLng) {
    mapCenterItem.value = latLng;
    update();
  }

  var xName = "White".obs;
  increment() {
    count++;
    xName.value = xName.value == "Black" ? "White" : "Black";
  }

  @override
  void dispose() {
    // TODO: implement dispose
    // super.dispose();
  }
}