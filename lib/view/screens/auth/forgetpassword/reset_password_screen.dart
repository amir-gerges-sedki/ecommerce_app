import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:master_store/controller/auth/forgetpassword/reset_password_controller.dart';
import 'package:master_store/core/functions/vaild_input_fun.dart';
import 'package:master_store/view/widgets/auth/coustom_material_button.dart';
import 'package:master_store/view/widgets/auth/custom_logo.dart';
import 'package:master_store/view/widgets/auth/registertion_feild.dart';

class ResetPassword extends StatelessWidget {
  const ResetPassword({super.key});

  @override
  Widget build(BuildContext context) {
    ResetPasswordControllerImp controller =
        Get.put(ResetPasswordControllerImp());
    return Scaffold(
        body: Padding(
      padding: const EdgeInsets.only(
        top: 60,
      ),
      child: Form(
        key: controller.resetpasswordKey,
        child: ListView(
          children: [
            const CustomLogo(
              title: 'New Password',
            ),
            Padding(
              padding: const EdgeInsets.only(top: 20, left: 10, right: 10),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  CustomFromFeild(
                    title: 'Password',
                    hint: 'Enter new Password',
                    controller: controller.password,
                    icon: Icons.lock_outline,
                     valid: (val) {return validInput(val!, "password", 8, 20);}, isnumber: false,
                  ),
                  CustomFromFeild(
                    title: 'Confirm Password',
                    hint: 'Repet new Password',
                    controller: controller.repassword,
                    icon: Icons.lock_outline,
                     valid: (val) {return validInput(val!, "password", 8, 20);}, isnumber: false,
                  ),
                ],
              ),
            ),
             Padding(
               padding: const EdgeInsets.all(20),
               child: MAtrialButton(
                      color: Colors.teal,
                      textColor: Colors.black,
                      title: 'Confirm',
                      onPressed: () {
                        controller.goToSuccessPassword();
                      },
                    ),
             )
          ],
        ),
      ),
    ));
  }
}
