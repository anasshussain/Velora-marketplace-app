import 'package:flutter/material.dart';

import '../../app/app_routes.dart';
import '../../core/constants/app_sizes.dart';
import '../../core/constants/app_strings.dart';
import '../../core/theme/app_colors.dart';
import '../../core/theme/app_text_styles.dart';
import '../../shared/widgets/app_text_field.dart';
import '../../shared/widgets/fade_in_up.dart';
import '../../shared/widgets/primary_button.dart';
import 'widgets/auth_header.dart';
import 'widgets/social_row.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final _formKey = GlobalKey<FormState>();
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();

  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  void _submit() {
    if (_formKey.currentState?.validate() ?? false) {
      Navigator.of(context).pushNamedAndRemoveUntil(
        AppRoutes.main,
        (route) => false,
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.fromLTRB(
            AppSizes.screenPadding,
            AppSizes.l,
            AppSizes.screenPadding,
            AppSizes.xxxl,
          ),
          child: FadeInUp(
            child: Form(
              key: _formKey,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const AuthHeader(
                    title: AppStrings.welcomeBack,
                    subtitle: AppStrings.loginSubtitle,
                  ),
                  const SizedBox(height: AppSizes.xxxl),
                  AppTextField(
                    hint: AppStrings.email,
                    icon: Icons.mail_outline_rounded,
                    controller: _emailController,
                    keyboardType: TextInputType.emailAddress,
                    textInputAction: TextInputAction.next,
                    validator: (value) {
                      if (value == null || value.trim().isEmpty) {
                        return 'Email required hai';
                      }
                      if (!value.contains('@')) return 'Valid email likhein';
                      return null;
                    },
                  ),
                  const SizedBox(height: AppSizes.m),
                  AppTextField(
                    hint: AppStrings.password,
                    icon: Icons.lock_outline_rounded,
                    controller: _passwordController,
                    obscure: true,
                    textInputAction: TextInputAction.done,
                    onSubmitted: (_) => _submit(),
                    validator: (value) {
                      if (value == null || value.length < 6) {
                        return 'Kam se kam 6 characters';
                      }
                      return null;
                    },
                  ),
                  const SizedBox(height: AppSizes.s),
                  Align(
                    alignment: Alignment.centerRight,
                    child: TextButton(
                      onPressed: () {},
                      child: Text(
                        AppStrings.forgotPassword,
                        style: AppTextStyles.label.copyWith(
                          color: AppColors.textPrimary,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(height: AppSizes.l),
                  PrimaryButton(label: AppStrings.signIn, onPressed: _submit),
                  const SizedBox(height: AppSizes.xxl),
                  const SocialRow(),
                  const SizedBox(height: AppSizes.xxl),
                  Center(
                    child: GestureDetector(
                      onTap: () => Navigator.of(context)
                          .pushReplacementNamed(AppRoutes.register),
                      child: RichText(
                        text: TextSpan(
                          text: AppStrings.noAccount,
                          style: AppTextStyles.bodyMuted,
                          children: [
                            TextSpan(
                              text: AppStrings.signUp,
                              style: AppTextStyles.body.copyWith(
                                fontWeight: FontWeight.w700,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
