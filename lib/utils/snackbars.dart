import 'package:flutter/material.dart';
import 'package:get/get.dart';

class GetSnackbars {
  static Success(String title, String message) {
    Get.snackbar(
        duration: const Duration(milliseconds: 2000),
        borderWidth: 3,
        borderColor: const Color.fromRGBO(2, 143, 54, 0.9),
        icon: const Icon(
          Icons.done,
          size: 40,
          color: Color.fromRGBO(2, 143, 54, 0.9),
        ),
        backgroundColor: Colors.white,
        snackPosition: SnackPosition.BOTTOM,
        "Form validated",
        "no issues with the form",
        titleText: Text(
          title,
          style: const TextStyle(
              fontSize: 22,
              fontWeight: FontWeight.bold,
              color: Color.fromRGBO(2, 143, 54, 0.9)),
        ),
        messageText: Text(
          message,
          style: const TextStyle(
              fontWeight: FontWeight.bold,
              color: Color.fromRGBO(2, 143, 54, 0.9)),
        ));
  }

  static failure(String title, String message) {
    Get.snackbar(
        duration: const Duration(milliseconds: 2000),
        borderWidth: 3,
        borderColor: const Color.fromRGBO(203, 5, 5, 0.894),
        icon: const Icon(
          Icons.error,
          size: 40,
          color: Color.fromRGBO(203, 5, 5, 0.894),
        ),
        backgroundColor: Colors.white,
        snackPosition: SnackPosition.BOTTOM,
        "Form validated",
        "no issues with the form",
        titleText: Text(
          title,
          style: const TextStyle(
              fontSize: 22,
              fontWeight: FontWeight.bold,
              color: Color.fromRGBO(216, 7, 7, 0.898)),
        ),
        messageText: Text(
          message,
          style: const TextStyle(
              fontWeight: FontWeight.bold,
              color: Color.fromRGBO(210, 7, 7, 0.898)),
        ));
  }
}
