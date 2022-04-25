import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../controllers/home_controller.dart';

class HomeView extends GetView<HomeController> {
  static const String routeName = "/home";
  const HomeView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Text("Home"),
      ),
      floatingActionButton: Obx(
        () => controller.isUserAuthenticated.value
            ? FloatingActionButton(
                child: Icon(Icons.add_box),
                clipBehavior: Clip.hardEdge,
                onPressed: controller.addNewWish,
              )
            : SizedBox.shrink(),
      ),
    );
  }
}
