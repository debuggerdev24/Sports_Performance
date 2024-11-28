import 'package:flutter/material.dart';
import 'package:flutter_translator/flutter_translator.dart';
import 'package:form_field_validator/form_field_validator.dart';
import 'package:get/get.dart';
import 'package:sportperformance/Components/InputFeild.dart';
import 'package:sportperformance/Components/MyButtton.dart';

import '../controllers/login_controller.dart';

class ForgotPassword extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final translator = TranslatorGenerator.instance;
    final logincontroller = Get.find<LoginController>();
    final _formKey = GlobalKey<FormState>();
    return Padding(
      padding: const EdgeInsets.fromLTRB(5, 15, 5, 5),
      child: Form(
        key: _formKey,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Center(
              child: Text(
                translator.getString("MyNotification.newexercise"),
                maxLines: 1,
                style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                      fontSize: 18,
                      fontWeight: FontWeight.w600,
                    ),
              ),
            ),
            const SizedBox(height: 30),
            Text(
              translator.getString("ForgotPassword.resetcode"),
              style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                    fontSize: 12,
                    fontWeight: FontWeight.w600,
                  ),
            ),
            const SizedBox(height: 30),
            Text(
              translator.getString("ForgotPassword.email"),
              textAlign: TextAlign.center,
              style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                    fontSize: 15,
                    fontWeight: FontWeight.w500,
                  ),
            ),
            const SizedBox(height: 5),
            InputField(
              size: 50,
              borderRadius: 5,
              icon: Icons.mail,
              controller: logincontroller.forgotemail,
              validator: MultiValidator([
                EmailValidator(
                  errorText: 'Please enter valid email',
                ),
                RequiredValidator(errorText: 'Email required')
              ]),
              hint: translator.getString("EditProf.mailHint"),
              borderColor: Colors.grey,
              color: Colors.grey.shade50,
              type: TextInputType.emailAddress,
            ),
            const SizedBox(height: 15),
            MyButton(
              fontSize: 16,
              title: "Reset Password",
              fontWeight: FontWeight.w500,
              onTap: () {
                if (_formKey.currentState!.validate()) {
                  FocusScope.of(context).unfocus();
                  logincontroller.forgotpassword(context);
                }
                // Navigator.of(context).pushNamed(
                //   VerifyAccountScreen.routeName,
                // );
              },
            ),
          ],
        ),
      ),
    );
  }
}
