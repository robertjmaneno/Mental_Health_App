import 'package:flutter/material.dart';
import 'package:flutter_application_1/Controllers/UserController.dart';
import 'package:flutter_application_1/Views/Auth/login.dart';
import 'package:flutter_application_1/Widgets/large_button.dart';
import 'package:flutter_application_1/Widgets/text_fields.dart';
import 'package:get/get.dart';

class RegisterPage extends StatelessWidget {
  RegisterPage({Key? key}) : super(key: key);

  final RegisterController controller = Get.put(RegisterController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Center(
          child: SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 0.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  const SizedBox(height: 50),

                  // Logo
                  const Icon(
                    Icons.person_add,
                    size: 100,
                    color: Color.fromARGB(255, 10, 8, 165),
                  ),

                  const SizedBox(height: 50),

                  // Create account
                  Text(
                    'Create Account',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      color: Colors.grey[700],
                      fontSize: 25,
                    ),
                  ),

                  const SizedBox(height: 25),

                  // First Name text field
                  MyTextField(
                    controller: controller.firstNameController,
                    hintText: 'First Name',
                    obscureText: false,
                  ),

                  const SizedBox(height: 10),

                  // Last Name text field
                  MyTextField(
                    controller: controller.lastNameController,
                    hintText: 'Last Name',
                    obscureText: false,
                  ),

                  const SizedBox(height: 10),

                  // Phone Number text field
                  MyTextField(
                    controller: controller.phoneNumberController,
                    hintText: 'Phone Number',
                    obscureText: false,
                  ),

                  const SizedBox(height: 10),

                  // Location text field
                  MyTextField(
                    controller: controller.locationController,
                    hintText: 'Location',
                    obscureText: false,
                  ),

                  const SizedBox(height: 10),

                  // Email text field
                  MyTextField(
                    controller: controller.emailController,
                    hintText: 'Email',
                    obscureText: false,
                  ),

                  const SizedBox(height: 10),

                  // Password text field
                  MyTextField(
                    controller: controller.passwordController,
                    hintText: 'Password',
                    obscureText: true,
                  ),

                  const SizedBox(height: 25),

                  // Register button
                  MyButton(
                    onTap: controller.registerUser,
                    buttonText: 'Register',
                  ),

                  const SizedBox(height: 20),

                  // Already a member? Sign In
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        'Already a member?',
                        style: TextStyle(color: Colors.grey[700]),
                      ),
                      const SizedBox(width: 4),
                      TextButton(
                        onPressed: () {
                          Get.offAll(() => LoginPage());
                        },
                        child: const Text(
                          'Sign In',
                          style: TextStyle(
                            color: Color.fromARGB(255, 16, 13, 180),
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ],
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
