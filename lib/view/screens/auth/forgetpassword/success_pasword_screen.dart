import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:master_store/controller/auth/signup_controler.dart';
import 'package:master_store/view/widgets/auth/coustom_material_button.dart';

class SuccessPassword extends StatelessWidget {
  const SuccessPassword({super.key});

  @override
  Widget build(BuildContext context) {
     SignUpControllerImp controller = Get.put(SignUpControllerImp());
    return Scaffold(
        body: Center(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          const Icon(
            Icons.check_circle_outline_outlined,
            color:  Color.fromARGB(255, 4, 122, 107),
            size: 200,
          ),
          const Spacer(),
          Padding(
            padding: const EdgeInsets.all(20),
            child: SizedBox(
              width: double.infinity,
              child: MAtrialButton(
                  onPressed: () {
                    controller.goToLogin();
                  },
                  color: const Color.fromARGB(255, 4, 122, 107),
                  textColor: Colors.white,
                  title: 'Login'),
            ),
          ),
          const SizedBox(
            height: 30,
          )
        ],
      ),
    ));
  }
}
