import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/common/widgets/custom_app_button.dart';
import '../../../../core/common/widgets/custom_text_form_field.dart';
import '../../../../core/helpers/app_regex.dart';
import '../../../../core/helpers/spacing.dart';
import '../../../../core/theme/app_colors/light_app_colors.dart';
import '../logic/signup_cubit.dart';
import 'signup_bloc_listener.dart';

class CustomSignupForm extends StatefulWidget {
  const CustomSignupForm({super.key});

  @override
  State<CustomSignupForm> createState() => _CustomSignupFormState();
}

class _CustomSignupFormState extends State<CustomSignupForm> {
  bool isPasswordVisible = false;

  @override
  Widget build(BuildContext context) {
    return Form(
      key: context.read<SignupCubit>().formKey,
      child: Column(
        children: [
          CustomTextFormField(
            label: "First Name",
            hintText: "Enter your first name",
            controller: context.read<SignupCubit>().firstNameController,
            validator: (value) {
              if (value == null || value.isEmpty) {
                return 'Please enter your first name.';
              }
              return null;
            },
          ),

          verticalSpace(20),

          CustomTextFormField(
            label: "Last Name",
            hintText: "Enter your last name",
            controller: context.read<SignupCubit>().lastNameController,
            validator: (value) {
              if (value == null || value.isEmpty) {
                return 'Please enter your last name.';
              }
              return null;
            },
          ),

          verticalSpace(20),

          CustomTextFormField(
            label: "Email",
            hintText: "Enter your email",
            keyboardType: TextInputType.emailAddress,
            controller: context.read<SignupCubit>().emailController,
            validator: (value) {
              final trimmedValue = value?.trim() ?? '';
              if (trimmedValue.isEmpty ||
                  !AppRegex.isEmailValid(trimmedValue)) {
                return 'Please enter a valid email.';
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
            controller: context.read<SignupCubit>().passwordController,
            validator: (value) {
              if (value == null || value.isEmpty) {
                return 'Please enter a valid password.';
              }
              if (!AppRegex.hasLowerCase(value)) {
                return 'Password must contain a lowercase letter.';
              }
              if (!AppRegex.hasUpperCase(value)) {
                return 'Password must contain an uppercase letter.';
              }
              if (!AppRegex.hasNumber(value)) {
                return 'Password must contain a number.';
              }
              if (!AppRegex.hasSpecialCharacter(value)) {
                return 'Password must contain a special character.';
              }
              if (!AppRegex.hasMinLength(value)) {
                return 'Password must be at least 8 characters long.';
              }
              return null;
            },
          ),

          verticalSpace(80),

          CustomAppButton(
            onPress: () {
              validateThenDoSignup(context);
            },
            text: 'Sign Up',
          ),

          const SignupBlocListener(),
        ],
      ),
    );
  }

  void validateThenDoSignup(BuildContext context) {
    if (context.read<SignupCubit>().formKey.currentState!.validate()) {
      context.read<SignupCubit>().emitSignupStates();
    }
  }
}
