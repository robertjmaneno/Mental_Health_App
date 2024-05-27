import 'package:flutter/material.dart';
import 'package:flutter_application_1/Models/userModel.dart';
import 'package:flutter_application_1/Views/Auth/login.dart';
import 'package:get/get.dart';

class RegisterController extends GetxController {
  late TextEditingController firstNameController;
  late TextEditingController lastNameController;
  late TextEditingController phoneNumberController;
  late TextEditingController locationController;
  late TextEditingController usernameController;
  late TextEditingController passwordController;
  late TextEditingController emailController;

  RxString firstNameError = RxString('');
  RxString lastNameError = RxString('');
  RxString phoneNumberError = RxString('');
  RxString locationError = RxString('');
  RxString usernameError = RxString('');
  RxString passwordError = RxString('');
  RxString emailError = RxString('');

  late UserModel user;

  @override
  void onInit() {
    super.onInit();
    firstNameController = TextEditingController();
    lastNameController = TextEditingController();
    phoneNumberController = TextEditingController();
    locationController = TextEditingController();
    usernameController = TextEditingController();
    passwordController = TextEditingController();
    emailController = TextEditingController();
    user = UserModel();
  }

  void registerUser() {
    if (_validateFields()) {
      Get.offAll(() => LoginPage());
    }
  }

  bool _validateFields() {
    bool isValid = true;

    // Validate first name
    if (firstNameController.text.trim().isEmpty) {
      firstNameError.value = 'Please enter your first name';
      isValid = false;
    } else {
      firstNameError.value = '';
    }

    // Validate last name
    if (lastNameController.text.trim().isEmpty) {
      lastNameError.value = 'Please enter your last name';
      isValid = false;
    } else {
      lastNameError.value = '';
    }

    // Validate phone number
    if (phoneNumberController.text.trim().isEmpty) {
      phoneNumberError.value = 'Please enter your phone number';
      isValid = false;
    } else {
      phoneNumberError.value = '';
    }

    // Validate location
    if (locationController.text.trim().isEmpty) {
      locationError.value = 'Please enter your location';
      isValid = false;
    } else {
      locationError.value = '';
    }

    // Validate username
    if (usernameController.text.trim().isEmpty) {
      usernameError.value = 'Please enter a username';
      isValid = false;
    } else {
      usernameError.value = '';
    }

    // Validate password
    if (passwordController.text.trim().isEmpty) {
      passwordError.value = 'Please enter a password';
      isValid = false;
    } else {
      passwordError.value = '';
    }

    // Validate email
    if (emailController.text.trim().isEmpty) {
      emailError.value = 'Please enter your email';
      isValid = false;
    } else if (!GetUtils.isEmail(emailController.text.trim())) {
      emailError.value = 'Please enter a valid email';
      isValid = false;
    } else {
      emailError.value = '';
    }

    return isValid;
  }

  @override
  void onClose() {
    firstNameController.dispose();
    lastNameController.dispose();
    phoneNumberController.dispose();
    locationController.dispose();
    usernameController.dispose();
    passwordController.dispose();
    emailController.dispose();
    super.onClose();
  }
}
