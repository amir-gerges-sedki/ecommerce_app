import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:master_store/controller/auth/signup_controler.dart';
import 'package:master_store/core/functions/vaild_input_fun.dart';
import 'package:master_store/view/widgets/auth/coustom_material_button.dart';
import 'package:master_store/view/widgets/auth/custom_logo.dart';
import 'package:master_store/view/widgets/auth/registertion_feild.dart';

class Signup extends StatelessWidget {
  const Signup({super.key});

  @override
  Widget build(BuildContext context) {
    SignUpControllerImp controller = Get.put(SignUpControllerImp());

    return Scaffold(
        body: Padding(
      padding: const EdgeInsets.only(
        top: 60,
      ),
      child: Form(
        key: controller.signupKey,
        child: ListView(
          children: [
            const CustomLogo(
              title: 'Sign Up',
            ),
            Padding(
              padding: const EdgeInsets.only(top: 20, left: 10, right: 10),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  CustomFromFeild(
                    title: 'Name',
                    hint: 'Enter Your full name',
                    controller: controller.username,
                    icon: Icons.person_2_outlined,
                    valid: (val) {
                      return validInput(val!, "username", 3, 30);
                    },
                    isnumber: false,
                  ),
                  CustomFromFeild(
                    title: 'Phone',
                    hint: 'Enter Your number phone',
                    controller: controller.phone,
                    icon: Icons.phone,
                    valid: (val) {
                      return validInput(val!, "phone", 11, 14);
                    },
                    isnumber: true,
                  ),
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
                  GetBuilder<SignUpControllerImp>(
                    builder: (context) {
                      return CustomFromFeild(
                        title: 'Password',
                        hint: 'Enter You Password',
                        controller: controller.password,
                        obscureText: controller.isshowpassword,
                        onTapIcon: () {
                          controller.showPassword();
                        },
                        icon: controller.icontype==true?Icons.lock_open_sharp:Icons.lock_outline,
                        valid: (val) {
                          return validInput(val!, "password", 8, 20);
                        },
                        isnumber: false,
                      );
                    }
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(20),
              child: MAtrialButton(
                  onPressed: () {
                    controller.signUp();
                  },
                  color: const Color.fromARGB(255, 4, 122, 107),
                  textColor: Colors.white,
                  title: 'Sign up'),
            ),
            InkWell(
              onTap: () => controller.goToLogin(),
              child: const Center(
                child: Text.rich(TextSpan(children: [
                  TextSpan(text: " Have an Account?"),
                  TextSpan(
                      text: "Login",
                      style: TextStyle(
                          color: Color.fromARGB(255, 4, 122, 107),
                          fontWeight: FontWeight.bold)),
                ])),
              ),
            )
          ],
        ),
      ),
    ));
  }
}
