import 'package:get_storage/get_storage.dart';

class Getss {
  static savesearch(String search) {
    final box = GetStorage();
    box.write("search", search);
  }
   static getsearch() {
    final box = GetStorage();
    return box.read("search") ?? true;
  }
}
