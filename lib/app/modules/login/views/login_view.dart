import 'package:flutter/material.dart';
import 'package:galon_app/app/controller/AuthController.dart';
import 'package:galon_app/app/init/UI.dart';
import 'package:galon_app/app/routes/app_pages.dart';

import 'package:get/get.dart';

import '../controllers/login_controller.dart';

class LoginView extends GetView<LoginController> {
  const LoginView({Key? key}) : super(key: key);
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
                const SizedBox(height: 105),

                SizedBox(
                  width: double.infinity,
                  child: Text(
                    "Welcome Back!",
                    style: TextStyle(color: UI.object, fontSize: 20),
                    textAlign: TextAlign.center,
                  ),
                ),
                const SizedBox(height: 15),
                SizedBox(
                  width: double.infinity,
                  child: Text(
                    "Please sign in to your account",
                    style: TextStyle(color: UI.other, fontSize: 15),
                    textAlign: TextAlign.center,
                  ),
                ),
                const SizedBox(height: 25),
                SizedBox(
                  width: double.infinity,
                  height: 65,
                  child: TextFormField(
                    controller: controller.cUser,
                    style: TextStyle(color: UI.object, fontSize: 15),
                    decoration: InputDecoration(
                      border: OutlineInputBorder(
                        borderSide: BorderSide(color: UI.foreground),
                        borderRadius: BorderRadius.circular(20),
                      ),
                      filled: true,
                      fillColor: UI.foreground,
                    ),
                  ),
                ),
                const SizedBox(height: 15),

                //PASSWORD
                Obx(
                  () => SizedBox(
                    height: 65,
                    width: double.infinity,
                    child: TextFormField(
                      controller: controller.cPass,
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
                // const SizedBox(height: 5),
                SizedBox(
                  width: double.infinity,
                  child: TextButton(
                    onPressed: () {},
                    style: const ButtonStyle(alignment: Alignment.centerRight),
                    child: Text(
                      "Forgot Password",
                      textAlign: TextAlign.right,
                      style: TextStyle(
                        fontSize: 15,
                        color: UI.action,
                      ),
                    ),
                  ),
                ),
                const SizedBox(height: 25),
                SizedBox(
                  height: 65,
                  width: double.infinity,
                  child: ElevatedButton(
                    onPressed: () => auth.login(
                        controller.cUser.text, controller.cPass.text),
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
                      child: Text("Sign In"),
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
                      onPressed: () {
                        auth.signInWithGoogle();
                      },
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
                          "Sign in with Google",
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
                        "Don't have an Account?",
                        style: TextStyle(color: UI.object, fontSize: 15),
                        textAlign: TextAlign.center,
                      ),
                      TextButton(
                        onPressed: () => Get.offAndToNamed(Routes.SIGN_UP),
                        child: Text(
                          "Sign Up",
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
