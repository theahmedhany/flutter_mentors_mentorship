import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/common/widgets/custom_app_button.dart';
import '../../../../core/common/widgets/custom_text_form_field.dart';
import '../../../../core/helpers/app_regex.dart';
import '../../../../core/helpers/extensions.dart';
import '../../../../core/helpers/spacing.dart';
import '../../../../core/routing/routes.dart';
import '../../../../core/theme/app_colors/light_app_colors.dart';
import '../../../../core/theme/app_texts/app_text_styles.dart';
import '../logic/login_cubit.dart';
import 'login_bloc_listener.dart';

class CustomLoginForm extends StatefulWidget {
  const CustomLoginForm({super.key});

  @override
  State<CustomLoginForm> createState() => _CustomLoginFormState();
}

class _CustomLoginFormState extends State<CustomLoginForm> {
  bool isPasswordVisible = false;

  @override
  Widget build(BuildContext context) {
    return Form(
      key: context.read<LoginCubit>().formKey,
      child: Column(
        children: [
          CustomTextFormField(
            label: "Email",
            hintText: "Enter your email",
            keyboardType: TextInputType.emailAddress,
            controller: context.read<LoginCubit>().emailController,
            validator: (value) {
              final trimmedValue = value?.trim() ?? '';
              if (trimmedValue.isEmpty ||
                  !AppRegex.isEmailValid(trimmedValue)) {
                return 'Please enter a valid email address.';
              }
              return null;
            },
          ),

          verticalSpace(20),

          CustomTextFormField(
            label: "Password",
            hintText: "Enter your password",
            isObscureText: !isPasswordVisible,
            suffixIcon: IconButton(
              icon: Icon(
                isPasswordVisible ? Icons.visibility : Icons.visibility_off,
                color: LightAppColors.grey700,
              ),
              onPressed: () {
                setState(() {
                  isPasswordVisible = !isPasswordVisible;
                });
              },
            ),
            controller: context.read<LoginCubit>().passwordController,
            validator: (value) {
              if (value == null || value.isEmpty) {
                return 'Please enter your password.';
              }
              return null;
            },
          ),

          verticalSpace(12),

          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              CupertinoButton(
                onPressed: () {
                  context.pushNamed(Routes.verifyEmailScreen);
                },
                padding: EdgeInsets.zero,
                child: Text(
                  "verify email",
                  style: AppTextStyles.font16SemiBold.copyWith(
                    color: LightAppColors.primary500,
                  ),
                ),
              ),
            ],
          ),

          verticalSpace(80),

          CustomAppButton(
            onPress: () {
              validateThenDoLogin(context);
            },
            text: 'Login',
          ),

          const LoginBlocListener(),
        ],
      ),
    );
  }

  void validateThenDoLogin(BuildContext context) {
    if (context.read<LoginCubit>().formKey.currentState!.validate()) {
      context.read<LoginCubit>().emitLoginStates();
    }
  }
}
