import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:master_store/controller/auth/login_controler.dart';
import 'package:master_store/core/functions/vaild_input_fun.dart';
import 'package:master_store/view/widgets/auth/coustom_material_button.dart';
import 'package:master_store/view/widgets/auth/custom_logo.dart';
import 'package:master_store/view/widgets/auth/registertion_feild.dart';

class Login extends StatelessWidget {
  const Login({super.key});

  @override
  Widget build(BuildContext context) {
    LoginControllerImp controller = Get.put(LoginControllerImp());
    return Scaffold(
        body: Padding(
      padding: const EdgeInsets.only(
        top: 60,
      ),
      child: ListView(
        children: [
          const CustomLogo(
            title: 'login',
          ),
          Padding(
            padding: const EdgeInsets.only(top: 20, left: 10, right: 10),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                CustomFromFeild(
                  title: 'Email',
                  hint: 'Enter You Email',
                  controller: controller.email,
                  icon: Icons.email_outlined,
                  valid: (val) {
                    return validInput(val!, "email", 10, 40);
                  },
                  isnumber: false,
                ),
                GetBuilder<LoginControllerImp>(
                  builder: (controller) => CustomFromFeild(
                    isnumber: false,
                    onTapIcon: () {
                      controller.showPassword();
                    },
                    obscureText: controller.isshowpassword,
                    title: 'Password',
                    hint: 'Enter You Password',
                    controller: controller.password,
                    icon: controller.icontype==true?Icons.lock_open_sharp:Icons.lock_outline,
                    valid: (val) {
                      return validInput(val!, "password", 8, 20);
                    },
                  ),
                ),
                InkWell(
                  onTap: () {
                    controller.goToForgetPassword();
                  },
                  child: const Text('forget password ?'),
                )
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(10),
            child: MAtrialButton(
                onPressed: () {
                  controller.login();
                },
                color: const Color.fromARGB(255, 4, 122, 107),
                textColor: Colors.white,
                title: 'Login'),
          ),
          Padding(
              padding: const EdgeInsets.all(10),
              child: MaterialButton(
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(30)),
                height: 50,
                color: const Color.fromARGB(255, 221, 153, 5),
                onPressed: () {
                  controller.loginWithGoogle();
                },
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Text('Google',style:  TextStyle(fontWeight: FontWeight.bold,fontSize: 18),),
                    const SizedBox(
                      width: 20,
                    ),
                    Image.asset(
                      'assets/google.png',
                      width: 30,
                    )
                  ],
                ),
              )),
          InkWell(
            onTap: () {
              controller.goToSignUp();
            },
            child: const Center(
              child: Text.rich(TextSpan(children: [
                TextSpan(text: "Don't have an Account?"),
                TextSpan(
                    text: "Sign Up",
                    style: TextStyle(
                        color: Color.fromARGB(255, 4, 122, 107),
                        fontWeight: FontWeight.bold)),
              ])),
            ),
          )
        ],
      ),
    ));
  }
}
