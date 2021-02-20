import 'package:flutter/material.dart';
import 'package:sprinkle/ui/shared/ui_helpers.dart';
import 'package:sprinkle/ui/Widget/busy.dart';
//import 'package:sprinkle/ui/widget/Expansion.dart';
import 'package:sprinkle/ui/widget/input_field.dart';
import 'package:stacked/stacked.dart';
import 'login_view_model.dart';
import 'package:sprinkle/ui/widget/text_link.dart';

class LoginView extends StatelessWidget {
  final emailController = TextEditingController();
  final passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<LoginViewModel>.reactive(
      //viewModel: LoginViewModel(),
      builder: (context, model, child) => Scaffold(
        backgroundColor: Colors.white,
        body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 50),
          child: Column(
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              SizedBox(
                height: 150,
                child: Image.asset('assets/images/title.png'),
              ),
              InputField(
                placeholder: 'Email',
                controller: emailController,
              ),
              verticalSpaceSmall,
              InputField(
                placeholder: 'Password',
                password: true,
                controller: passwordController,
              ),
              verticalSpaceMedium,
              Row(
                mainAxisSize: MainAxisSize.max,
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  BusyButton(
                    title: 'Login',
                    busy: model.isBusy,
                    onPressed: () {
                      model.login(
                        email: emailController.text,
                        password: passwordController.text,
                      );
                    },
                  )
                ],
              ),
              verticalSpaceMedium,
              TextLink(
                'Create an Account if you\'re new.',
                onPressed: () {
                  model.navigateToSignUp();
                },
              )
            ],
          ),
        ),
      ),
      viewModelBuilder: () => LoginViewModel(),
    );
  }
}
