import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:master_store/controller/auth/forgetpassword/forget_password_controller.dart';
import 'package:master_store/core/functions/vaild_input_fun.dart';
import 'package:master_store/view/widgets/auth/coustom_material_button.dart';
import 'package:master_store/view/widgets/auth/custom_logo.dart';
import 'package:master_store/view/widgets/auth/registertion_feild.dart';

class ForgetPassword extends StatelessWidget {
  const ForgetPassword({super.key});

  @override
  Widget build(BuildContext context) {
    ForgetPasswordControllerImp controller =
        Get.put(ForgetPasswordControllerImp());
    return Scaffold(
        body: Padding(
      padding: const EdgeInsets.only(
        top: 60,
      ),
      child: Form(
        key: controller.forgetpasswordKey,
        child: ListView(
          children: [
            const CustomLogo(
              title: 'Check Email',
            ),
            Padding(
              padding: const EdgeInsets.only(top: 20, left: 10, right: 10),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  CustomFromFeild(
                    title: 'Email',
                    hint: 'Enter Your Email',
                    controller: controller.email,
                    icon: Icons.email_outlined,
                    valid: (val) {return validInput(val!, "email", 10, 40);}, isnumber: false,
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(20),
              child: MAtrialButton(
                  onPressed: () {
                    controller.goToVerfiyCode();
                  },
                  color: const Color.fromARGB(255, 4, 122, 107),
                  textColor: Colors.white,
                  title: 'Check'),
            ),
          ],
        ),
      ),
    ));
  }
}
