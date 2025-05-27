import 'package:ecommer_app_market/core/extension/context_extensions.dart';
import 'package:ecommer_app_market/core/extension/gap.dart';
import 'package:ecommer_app_market/core/extension/size_extensions.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:go_router/go_router.dart';

import '../../../../core/routes/app_names.dart';
import '../../../../core/widgets/w_button.dart';
import '../cubit/auth_cubit.dart';
import '../cubit/auth_state.dart';
import '../../data/model/auth_model.dart';
import '../widgets/w_custom_text_field.dart';
import '../widgets/w_global_bottom.dart';
import '../widgets/w_global_text.dart';

class VerifiactionScreen extends StatefulWidget {
  const VerifiactionScreen({super.key});

  @override
  State<VerifiactionScreen> createState() => _VerificationScreenState();
}

class _VerificationScreenState extends State<VerifiactionScreen> {
  final GlobalKey<FormState> _key = GlobalKey<FormState>();

  final TextEditingController _userNamecontroller = TextEditingController();

  final TextEditingController _emailController = TextEditingController();

  final TextEditingController _passwordController = TextEditingController();

  void _submit() {
    if (_key.currentState!.validate()) {
      final user = AuthModel(
        username: _userNamecontroller.text,
        email: _emailController.text,
        password: _passwordController.text,
      );
      context.read<AuthCubit>().register(user);
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
      body: BlocListener<AuthCubit, AuthState>(
        listenWhen:
            (previous, current) =>
                previous.bottonStatus != current.bottonStatus,
        listener: (context, state) {
          if (state.bottonStatus == AuthStatus.success) {
            context.go(AppNames.home);
          } else if (state.bottonStatus == AuthStatus.error) {
            ScaffoldMessenger.of(context)
              ..clearSnackBars()
              ..showSnackBar(
                SnackBar(
                  content: Text("Ro'yxatdan o'tishda xatolik yuz berdi"),
                ),
              );
          }
        },
        child: SingleChildScrollView(
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
                      validator:
                          (value) =>
                              value == null || value.isEmpty
                                  ? "Username required"
                                  : null,
                    ),
                    CustomTextFormField(
                      title: "Email or Phone Number",
                      hintText: "Enter your Email",
                      prefixIcon: Icons.email,
                      controller: _emailController,
                      validator:
                          (value) =>
                              value == null || value.isEmpty
                                  ? "Email required"
                                  : null,
                    ),
                    CustomTextFormField(
                      title: 'Password',
                      hintText: "Create your password",
                      isPassword: true,
                      prefixIcon: Icons.lock,
                      controller: _passwordController,
                      validator:
                          (value) =>
                              value == null || value.isEmpty
                                  ? "Password required"
                                  : null,
                    ),
                  ],
                ),
              ),
              60.g,
              BlocBuilder<AuthCubit, AuthState>(
                builder: (context, state) {
                  return WButton(
                    onTap: _submit,
                    borderRadius: 30.w,
                    width: double.infinity,
                    color: context.colors.primary,
                    padding: EdgeInsets.symmetric(vertical: 16.h),
                    child:
                        state.bottonStatus == AuthStatus.loading
                            ? SizedBox(
                              width: 20,
                              height: 20,
                              child: CircularProgressIndicator(
                                color: context.colors.white,
                              ),
                            )
                            : Center(
                              child: Text(
                                "Create Account",
                                style: context.styles.s16w600.copyWith(
                                  color: context.colors.white,
                                ),
                              ),
                            ),
                  );
                },
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
                text: 'Sign Up with Facebook',
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
      ),
    );
  }
}
