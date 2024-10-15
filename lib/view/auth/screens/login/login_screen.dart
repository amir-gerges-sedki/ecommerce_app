import 'package:flutter/material.dart';
import 'package:master_store/core/constant/app_sizes.dart';
import 'package:master_store/common/auth/custom_logo.dart';
import 'package:master_store/core/constant/app_strings.dart';
import 'package:master_store/view/auth/screens/login/widgets/form_divider.dart';
import 'package:master_store/view/auth/screens/login/widgets/form_login.dart';
import 'package:master_store/view/auth/screens/login/widgets/span_text_signup.dart';

class Login extends StatelessWidget {
  const Login({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(),
        body: SingleChildScrollView(
          child: Padding(
            padding: SpaceingStyle.paddingwithAppBarHeight,
            child: const Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                CustomLogo(
                  title: AppStrings.wellcomeBack,
                ),
                SizedBox(height: AppSizes.spaceBtwSection),
                FormLogin(),
                FormDivier(),
                SizedBox(height: AppSizes.spaceBtwItems),
                SpanTextSignup()
              ],
            ),
          ),
        ));
  }
}


 // CustomFromFeild(
                //   title: 'Email',
                //   hint: 'Enter You Email',
                //   controller: controller.email,
                //   icon: Icons.email_outlined,
                //   valid: (val) {
                //     return Format.validInput(val!, "email", 10, 40);
                //   },
                //   isnumber: false,
                // ),
                // Obx(
                //   () => CustomFromFeild(
                //     isnumber: false,
                //     onTapIcon: () {
                //       controller.showPassword();
                //     },
                //     obscureText: controller.isshowpassword.value,
                //     title: 'Password',
                //     hint: 'Enter You Password',
                //     controller: controller.password,
                //     icon: controller.icontype.value
                //         ? Icons.lock_open_sharp
                //         : Icons.lock_outline,
                //     valid: (val) {
                //       return Format.validInput(val!, "password", 8, 20);
                //     },
                //   ),
                // ),
                // Padding(
                //     padding: const EdgeInsets.all(10),
                //     child: MaterialButton(
                //       shape: RoundedRectangleBorder(
                //           borderRadius: BorderRadius.circular(30)),
                //       height: 50,
                //       color: const Color.fromARGB(255, 221, 153, 5),
                //       onPressed: () {
                //         controller.loginWithGoogle();
                //       },
                //       child: Row(
                //         mainAxisAlignment: MainAxisAlignment.center,
                //         children: [
                //           const Text(
                //             'Google',
                //             style:
                //                 TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
                //           ),
                //           const SizedBox(
                //             width: 20,
                //           ),
                //           Image.asset(
                //             'assets/google.png',
                //             width: 30,
                //           )
                //         ],
                //       ),
                //     )),