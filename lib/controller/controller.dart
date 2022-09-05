import 'package:get/get.dart';
import 'package:machine_test/API/apicalling.dart';

class Controller extends GetxController {
  var imageList = [].obs;
  var searchorclosebtn = false.obs;

  void pixabayimages() async {
    var images = await Services.getimages();
    if (images != null) {
      imageList.value = images.hits!;
    }
  } 
  void checkiftrue() {
    searchorclosebtn.value = !searchorclosebtn.value;
    update();
  }
}