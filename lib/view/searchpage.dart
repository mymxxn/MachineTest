import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:machine_test/constant.dart';
import 'package:machine_test/controller/controller.dart';
import 'package:machine_test/view/imageview.dart';

// ignore: must_be_immutable
class SearchPage extends StatelessWidget {
  SearchPage({Key? key}) : super(key: key);
  final controller = Get.put(Controller());
  TextEditingController searchcontroller =
      TextEditingController(text: "Search Terms");
  @override
  Widget build(BuildContext context) {
    Getss.savesearch(searchcontroller.text);
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.only(top: 80, left: 30, right: 80),
        child: Column(
          children: [
            TextFormField(
                controller: searchcontroller,
                autofocus: false,
                onTap: () {
                  controller.checkiftrue();
                },
                decoration: InputDecoration(
                  isDense: true,
                  suffixIcon: Obx(() => controller.searchorclosebtn.value
                      ? IconButton(
                          icon: Icon(Icons.close),
                          onPressed: () {
                            searchcontroller.clear();
                          },
                        )
                      : Icon(Icons.search)),
                  hintText: "Search for Students",
                  border: OutlineInputBorder(
                      borderSide: BorderSide.none,
                      borderRadius: BorderRadius.circular(20)),
                  filled: true,
                  fillColor: Colors.white,
                  contentPadding: EdgeInsets.only(
                      top: 10.0, bottom: 10.0, left: 23, right: 12.5),
                )),
            ElevatedButton(
                onPressed: () {
                  Getss.savesearch(searchcontroller.text);
                  controller.pixabayimages();
                },
                child: Text("search")),
            Expanded(
                child: Obx(() => GridView.builder(
                    gridDelegate:
                        const SliverGridDelegateWithFixedCrossAxisCount(
                            crossAxisCount: 3, crossAxisSpacing: 16),
                    itemCount: controller.imageList.length,
                    itemBuilder: (context, index) {
                      return GestureDetector(
                        onTap: () => Get.to(Imageview(
                            image:
                                "${controller.imageList[index].largeImageURL}")),
                        child: Container(
                          height: 100,
                          width: 100,
                          decoration: BoxDecoration(
                              image: DecorationImage(
                                  image: NetworkImage(
                                      "${controller.imageList[index].largeImageURL}"))),
                        ),
                      );
                    })))
          ],
        ),
      ),
    );
  }
}
