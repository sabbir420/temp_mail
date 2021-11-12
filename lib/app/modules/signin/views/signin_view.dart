import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/signin_controller.dart';

class SigninView extends GetView<SigninController> {
  final _formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0.0,
        title: Text(
          'Sign In',
          style: TextStyle(
            color: Colors.blue,
            fontSize: 22,
            fontWeight: FontWeight.bold
          ),
        ),
        centerTitle: true,
      ),
      body: Obx(() => controller.isLoading.value == false
      ? Container(
        padding: EdgeInsets.only(left: 16, right: 16),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Form(
              key: _formKey,
              child: Column(
                children: [
                  TextFormField(
                    controller: controller.emailController,
                    keyboardType: TextInputType.emailAddress,
                    decoration: InputDecoration(
                      labelText: 'Email Addresss',
                      border: OutlineInputBorder(),
                    ),
                    validator: (value) {
                      if (value == null) {
                        return "Email is required";
                      } else {
                        return null;
                      }
                    }
                  ),
                  Padding(padding: EdgeInsets.only(bottom: 25.0)),
                  TextFormField(
                    controller: controller.passwordController,
                    keyboardType: TextInputType.text,
                    obscureText: controller.hidePassword.value,
                    decoration: InputDecoration(
                      labelText: 'Password',
                      border: OutlineInputBorder(),
                       suffixIcon: Padding(
                        padding: const EdgeInsets.only(right: 10),
                        child: IconButton(
                          icon: Icon(
                            controller.hidePassword.value
                                  ? Icons
                                      .visibility_off
                                  : Icons
                                      .visibility,
                              color: Color
                                  .fromRGBO(
                                      54,
                                      50,
                                      50,
                                      0.5),
                            ),
                            onPressed: () {
                              controller.passwordHide();
                            }),
                      ),
                    ),
                    validator: (value) {
                      if (value == null) {
                        return "Password is required";
                      } else {
                        return null;
                      }
                    }
                  )
                ],
              ),
            ),
            Padding(padding: EdgeInsets.only(bottom: 25.0)),
            Container(
              width: 100,
              height: 60,
              child: ElevatedButton(
                onPressed: (){
                  if (_formKey.currentState!.validate()) {
                    final email = controller.emailController.text;
                    final password = controller.passwordController.text;
                    controller.signIn(email, password);
                  }
                },
                style: ElevatedButton.styleFrom(
                  textStyle: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w600
                  )
                ),
                child: const Text("Signin"),
              ),
            ),
            Padding(padding: EdgeInsets.only(bottom: 40.0)),
            Container(
              child: RichText(
                text: TextSpan(
                  text: "Don\'t have an account? ",
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 16,
                    fontWeight: FontWeight.w500,
                  ),
                  children: [
                    TextSpan(
                      recognizer: TapGestureRecognizer()
                        ..onTap = () {
                          Get.toNamed('/signup');
                        },
                      text: "Create account",
                      style: TextStyle(
                          color: Colors.blue,
                          fontSize: 16,
                      )
                    )
                  ]
                ),
              ),
            )
          ],
        ),
      ) 
      : Center(
        child: CircularProgressIndicator(),
      ))
    );
  }
}
