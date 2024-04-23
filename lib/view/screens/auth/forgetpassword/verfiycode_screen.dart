import 'package:flutter/material.dart';
import 'package:flutter_otp_text_field/flutter_otp_text_field.dart';
import 'package:get/get.dart';
import 'package:master_store/controller/auth/forgetpassword/verfiy_code_controller.dart';
import 'package:master_store/view/widgets/auth/custom_logo.dart';

class VerfiyCode extends StatelessWidget {
  const VerfiyCode({super.key});

  @override
  Widget build(BuildContext context) {
    VerfiyCodeControllerImp controller = Get.put(VerfiyCodeControllerImp());
    return Scaffold(
        body: Padding(
      padding: const EdgeInsets.only(
        top: 60,
      ),
      child: ListView(
        children: [
          const CustomLogo(
            title: 'check Code',
          ),
          Padding(
            padding: const EdgeInsets.only(top: 20, left: 10, right: 10),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                OtpTextField(
                  fieldWidth: 50,
                  borderRadius: BorderRadius.circular(20),
                  numberOfFields: 5,
                  borderColor: const Color.fromARGB(255, 153, 152, 156),
                  showFieldAsBox: true,
                  onCodeChanged: (String code) {},
                  onSubmit: (String verificationCode) {
                    controller.goToResetPassword();
                  },
                 
                ),
              ],
            ),
          ),
        ],
      ),
    ));
  }
}
