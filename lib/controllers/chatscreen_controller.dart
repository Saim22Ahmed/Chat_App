import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:get/get.dart';

class ChatScreenController extends GetxController {
  Rx<ScrollController> scrollController = ScrollController().obs;

  @override
  void onInit() {
    Future.delayed(const Duration(milliseconds: 400), () {
      scrollController.value.animateTo(
          scrollController.value.position.maxScrollExtent,
          duration: Duration(seconds: 2),
          curve: Curves.fastOutSlowIn);
    });

    super.onInit();
  }

  scrolldown() {
    return scrollController.value.animateTo(
        scrollController.value.position.maxScrollExtent,
        duration: 00.ms,
        curve: Curves.fastOutSlowIn);
  }
}
