import 'package:ecommer_app_market/core/extension/gap.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import '../widgets/w_custom_text_field.dart';
import '../widgets/w_global_bottom.dart';
import '../widgets/w_global_text.dart';

class RegisterPage extends StatefulWidget {
  const RegisterPage({super.key});

  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  final GlobalKey<FormState> _key = GlobalKey<FormState>();

  final TextEditingController _userNamecontroller = TextEditingController();

  final TextEditingController _emailController = TextEditingController();

  final TextEditingController _passwordController = TextEditingController();

  void _submit() {
    if (_key.currentState!.validate()) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: GlobalText(
            text: "Success",
            color: Colors.white,
            fontSize: 20,
          ),
        ),
      );
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: GlobalText(
            text: "Iltimos, barcha maydonlarni to‘ldiring",
            color: Colors.red,
            fontSize: 14,
          ),
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: Column(
          spacing: 5,
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            GlobalText(
              text: "Create Account",
              color: Colors.black,
              fontSize: 24,
              fontWeight: FontWeight.w500,
            ),
            GlobalText(
              text: "Start learning with create your account",
              color: Colors.black,
              fontSize: 14,
              fontWeight: FontWeight.w300,
            ),
          ],
        ),
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.symmetric(horizontal: 20),
        child: Column(
          children: [
            10.g,
            Form(
              key: _key,
              child: Column(
                spacing: 25,
                children: [
                  CustomTextFormField(
                    title: "Username",
                    hintText: "Magdalena Succrose",
                    prefixIcon: Icons.person,
                    controller: _userNamecontroller,
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return "Username cannot be empty.";
                      }
                      return null;
                    },
                  ),
                  CustomTextFormField(
                    title: "Email or Phone Number",
                    hintText: "Enter your Email",
                    prefixIcon: Icons.email,
                    controller: _emailController,
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return "Email cannot be empty.";
                      }
                      return null;
                    },
                  ),
                  CustomTextFormField(
                    title: 'Password',
                    hintText: "Create your password",
                    isPassword: true,
                    prefixIcon: Icons.lock,
                    controller: _passwordController,
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return "password cannot be empty";
                      }
                      return null;
                    },
                  ),
                ],
              ),
            ),
            60.g,
            GlobalButton(
              text: 'Create Account',
              onPressed: () => _submit(),
              backgroundColor: Colors.indigoAccent,
              width: double.infinity,
              height: 50,
              borderRadius: 50,
            ),
            10.g,
            TextButton(
              onPressed: () {},
              child: GlobalText(
                text: 'Or using other method',
                color: Colors.grey.withValues(alpha: 0.7),
              ),
            ),
            10.g,
            GlobalButton(
              text: 'Sign Up with Google',
              textColor: Colors.black,
              onPressed: () {},
              backgroundColor: Colors.white,
              width: double.infinity,
              height: 50,
              borderRadius: 50,
              icon: FontAwesomeIcons.google,
            ),
            20.g,
            GlobalButton(
              text: 'Sign Up with Google',
              textColor: Colors.black,
              onPressed: () {},
              backgroundColor: Colors.white,
              width: double.infinity,
              height: 50,
              borderRadius: 50,
              icon: FontAwesomeIcons.facebook,
            ),
          ],
        ),
      ),
    );
  }
}