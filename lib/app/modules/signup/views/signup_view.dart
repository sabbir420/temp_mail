import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/signup_controller.dart';

class SignupView extends GetView<SignupController> {
  final _formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0.0,
        title: Text(
          'Sign Up',
          style: TextStyle(
            color: Colors.blue,
            fontSize: 22,
            fontWeight: FontWeight.bold
          ),
        ),
        iconTheme: IconThemeData(
          color: Colors.black, //change your color here
        ),
        centerTitle: true,
      ),
      body: Obx(() => controller.isLoading.value == false
      ? Container(
        padding: EdgeInsets.only(left: 16, right: 16),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Align(
              alignment: Alignment.centerLeft,
              child: Text(
                "Select a domain",
                style: TextStyle(
                  fontSize: 14,
                  fontWeight: FontWeight.bold
                ),
              ),
            ),
            Padding(padding: EdgeInsets.only(bottom: 12.0)),
            FormField<String>(
              builder: (FormFieldState<String> state) {
                return InputDecorator(
                  decoration: InputDecoration(
                      errorStyle: TextStyle(color: Colors.redAccent, fontSize: 16.0),
                      hintText: 'Please select domain',
                      border: OutlineInputBorder(borderRadius: BorderRadius.circular(5.0))),
                  child: DropdownButtonHideUnderline(
                    child: DropdownButton<String>(
                      value: controller.dropDownValue.value,
                      icon: Icon(Icons.keyboard_arrow_down_rounded, color: Colors.black),
                      iconSize: 24,
                      isDense: true,
                      onChanged: (String? newValue) {
                        controller.changeValue(newValue!);
                      },
                      items: controller.domainLists.map((String value) {
                        return DropdownMenuItem<String>(
                          value: value,
                          child: Text(value),
                        );
                      }).toList(),
                    ),
                  ),
                );
              },
            ),
            Padding(padding: EdgeInsets.only(bottom: 25.0)),
            Form(
              key: _formKey,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  TextFormField(
                    controller: controller.emailController,
                    keyboardType: TextInputType.emailAddress,
                    decoration: InputDecoration(
                      isDense: true,
                      labelText: 'Email Address',
                      border: OutlineInputBorder(),
                      suffix: Padding(
                        padding: EdgeInsets.all(5),
                        child: Container(
                          width: Get.width / 3,
                          child: Text(
                            "@${controller.dropDownValue.value}",
                          ),
                        ),
                      )
                    ),
                    validator: (value) {
                      if (value == null) {
                        return "Email address is required";
                      } else {
                        return null;
                      }
                    }
                  ),
                  Padding(padding: EdgeInsets.only(bottom: 25.0)),
                  TextFormField(
                    controller: controller.passwordController,
                    obscureText: controller.hidePassword.value,
                    keyboardType: TextInputType.text,
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
                      )
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
            Padding(padding: EdgeInsets.only(bottom: 35.0)),
            Container(
              height: 60,
              child: ElevatedButton(
                onPressed: (){
                  if (_formKey.currentState!.validate()) {
                    final email = controller.emailController.text + "@" + controller.dropDownValue.value;
                    final password = controller.passwordController.text;
                    print(email);
                    controller.signUp(email, password);
                  }
                },
                style: ElevatedButton.styleFrom(
                  textStyle: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w600
                  )
                ),
                child: const Text("Signup"),
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
