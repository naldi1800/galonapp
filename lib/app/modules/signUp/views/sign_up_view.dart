import 'package:email_validator/email_validator.dart';
import 'package:flutter/material.dart';
import 'package:galon_app/app/controller/AuthController.dart';
import 'package:galon_app/app/init/UI.dart';
import 'package:galon_app/app/routes/app_pages.dart';

import 'package:get/get.dart';

import '../controllers/sign_up_controller.dart';

class SignUpView extends GetView<SignUpController> {
  const SignUpView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    AuthController auth = Get.find<AuthController>();
    return Scaffold(
      backgroundColor: UI.background,
      body: SafeArea(
        child: SingleChildScrollView(
          child: Container(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Column(
              // mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(height: 45),

                SizedBox(
                  width: double.infinity,
                  child: Text(
                    "Create new account",
                    style: TextStyle(color: UI.object, fontSize: 20),
                    textAlign: TextAlign.center,
                  ),
                ),
                const SizedBox(height: 15),
                SizedBox(
                  width: double.infinity,
                  child: Text(
                    "Please fill in the form to continue",
                    style: TextStyle(color: UI.foreground, fontSize: 15),
                    textAlign: TextAlign.center,
                  ),
                ),
                const SizedBox(height: 20),
                SizedBox(
                  width: double.infinity,
                  height: 65,
                  child: TextFormField(
                    controller: controller.cName,
                    style: TextStyle(color: UI.object, fontSize: 15),
                    decoration: InputDecoration(
                      border: OutlineInputBorder(
                        borderSide: BorderSide(color: UI.foreground),
                        borderRadius: BorderRadius.circular(20),
                      ),
                      filled: true,
                      fillColor: UI.foreground,
                      hintText: "Full Nama",
                    ),
                  ),
                ),
                const SizedBox(height: 15),
                SizedBox(
                  width: double.infinity,
                  height: 65,
                  child: TextFormField(
                    controller: controller.cEmail,
                    style: TextStyle(color: UI.object, fontSize: 15),
                    decoration: InputDecoration(
                      border: OutlineInputBorder(
                        borderSide: BorderSide(color: UI.foreground),
                        borderRadius: BorderRadius.circular(20),
                      ),
                      filled: true,
                      fillColor: UI.foreground,
                      hintText: "Email",
                    ),
                    validator: (v) {
                      return EmailValidator.validate("$v")
                          ? null
                          : "Please enter a valid email";
                    },
                  ),
                ),
                const SizedBox(height: 15),

                //PASSWORD
                Obx(
                  () => SizedBox(
                    height: 65,
                    width: double.infinity,
                    child: TextFormField(
                      controller: controller.cPassword,
                      style: TextStyle(color: UI.object, fontSize: 15),
                      obscureText: controller.showPass.value,
                      keyboardType: TextInputType.visiblePassword,
                      decoration: InputDecoration(
                        border: OutlineInputBorder(
                          borderSide: BorderSide(color: UI.foreground),
                          borderRadius: BorderRadius.circular(20),
                        ),
                        filled: true,
                        fillColor: UI.foreground,
                        hintText: "Password",
                        suffixIcon: IconButton(
                          icon: Icon(controller.showPass.value
                              ? Icons.visibility
                              : Icons.visibility_off),
                          onPressed: () {
                            controller.showPass.value =
                                !controller.showPass.value;
                          },
                        ),
                      ),
                    ),
                  ),
                ),
                const SizedBox(height: 15),

                Obx(
                  () => SizedBox(
                    height: 65,
                    width: double.infinity,
                    child: TextFormField(
                      controller: controller.cRePassword,
                      style: TextStyle(color: UI.object, fontSize: 15),
                      obscureText: controller.showPass.value,
                      keyboardType: TextInputType.visiblePassword,
                      decoration: InputDecoration(
                        border: OutlineInputBorder(
                          borderSide: BorderSide(color: UI.foreground),
                          borderRadius: BorderRadius.circular(20),
                        ),
                        hintText: "Re Enter Password",
                        filled: true,
                        fillColor: UI.foreground,
                        suffixIcon: IconButton(
                          icon: Icon(controller.showPass.value
                              ? Icons.visibility
                              : Icons.visibility_off),
                          onPressed: () {
                            controller.showPass.value =
                                !controller.showPass.value;
                          },
                        ),
                      ),
                    ),
                  ),
                ),
                const SizedBox(height: 25),

                SizedBox(
                  height: 65,
                  width: double.infinity,
                  child: ElevatedButton(
                    onPressed: () {
                      if (controller.cPassword.text !=
                          controller.cRePassword.text) {
                        return;
                      }
                      auth.signUpWithPass(
                          controller.cEmail.text, controller.cPassword.text);
                    },
                    // auth.login(controller.cUser.text, controller.cPass.text),
                    style: ButtonStyle(
                      backgroundColor: MaterialStatePropertyAll(UI.action),
                      shape: MaterialStatePropertyAll(
                        RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(20),
                        ),
                      ),
                    ),
                    child: const Padding(
                      padding:
                          EdgeInsets.symmetric(horizontal: 25, vertical: 20),
                      child: Text("Sign Up"),
                    ),
                  ),
                ),
                const SizedBox(height: 15),
                Visibility(
                  visible: false,
                  child: SizedBox(
                    height: 65,
                    width: double.infinity,
                    child: ElevatedButton(
                      onPressed: () => auth.signUpWithGoogle(),
                      style: ButtonStyle(
                        backgroundColor: MaterialStatePropertyAll(UI.object),
                        shape: MaterialStatePropertyAll(
                          RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(20),
                          ),
                        ),
                      ),
                      child: Padding(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 25, vertical: 20),
                        child: Text(
                          "Sign up with google",
                          style: TextStyle(color: UI.foreground),
                        ),
                      ),
                    ),
                  ),
                ),
                const SizedBox(height: 25),

                SizedBox(
                  width: double.infinity,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        "have an Account?",
                        style: TextStyle(color: UI.object, fontSize: 15),
                        textAlign: TextAlign.center,
                      ),
                      TextButton(
                        onPressed: () => Get.offAndToNamed(Routes.LOGIN),
                        child: Text(
                          "Sign In",
                          style: TextStyle(color: UI.action, fontSize: 15),
                          textAlign: TextAlign.center,
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
