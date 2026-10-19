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

class RegisterScreen extends StatefulWidget {
  const RegisterScreen({super.key});

  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  final _formKey = GlobalKey<FormState>();
  final _nameController = TextEditingController();
  final _emailController = TextEditingController();
  final _phoneController = TextEditingController();
  final _passwordController = TextEditingController();

  @override
  void dispose() {
    _nameController.dispose();
    _emailController.dispose();
    _phoneController.dispose();
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
                    title: AppStrings.createAccount,
                    subtitle: AppStrings.registerSubtitle,
                  ),
                  const SizedBox(height: AppSizes.xxxl),
                  AppTextField(
                    hint: AppStrings.fullName,
                    icon: Icons.person_outline_rounded,
                    controller: _nameController,
                    textInputAction: TextInputAction.next,
                    validator: (value) =>
                        (value == null || value.trim().length < 3)
                            ? 'Poora naam likhein'
                            : null,
                  ),
                  const SizedBox(height: AppSizes.m),
                  AppTextField(
                    hint: AppStrings.email,
                    icon: Icons.mail_outline_rounded,
                    controller: _emailController,
                    keyboardType: TextInputType.emailAddress,
                    textInputAction: TextInputAction.next,
                    validator: (value) =>
                        (value == null || !value.contains('@'))
                            ? 'Valid email likhein'
                            : null,
                  ),
                  const SizedBox(height: AppSizes.m),
                  AppTextField(
                    hint: AppStrings.phone,
                    icon: Icons.phone_outlined,
                    controller: _phoneController,
                    keyboardType: TextInputType.phone,
                    textInputAction: TextInputAction.next,
                    validator: (value) =>
                        (value == null || value.trim().length < 7)
                            ? 'Valid number likhein'
                            : null,
                  ),
                  const SizedBox(height: AppSizes.m),
                  AppTextField(
                    hint: AppStrings.password,
                    icon: Icons.lock_outline_rounded,
                    controller: _passwordController,
                    obscure: true,
                    textInputAction: TextInputAction.done,
                    onSubmitted: (_) => _submit(),
                    validator: (value) => (value == null || value.length < 6)
                        ? 'Kam se kam 6 characters'
                        : null,
                  ),
                  const SizedBox(height: AppSizes.xl),
                  PrimaryButton(label: AppStrings.signUp, onPressed: _submit),
                  const SizedBox(height: AppSizes.xxl),
                  const SocialRow(),
                  const SizedBox(height: AppSizes.xxl),
                  Center(
                    child: GestureDetector(
                      onTap: () => Navigator.of(context)
                          .pushReplacementNamed(AppRoutes.login),
                      child: RichText(
                        text: TextSpan(
                          text: AppStrings.haveAccount,
                          style: AppTextStyles.bodyMuted,
                          children: [
                            TextSpan(
                              text: AppStrings.signIn,
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
