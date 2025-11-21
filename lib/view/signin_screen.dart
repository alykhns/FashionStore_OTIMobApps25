import 'package:flutter/material.dart';
import 'package:otimobapps25/utils/app_textstyles.dart';
import 'package:otimobapps25/controllers/auth_controllers.dart';
import 'package:otimobapps25/view/main_screen.dart';
import 'package:otimobapps25/view/signup_screen.dart';
import 'package:otimobapps25/view/forgot_password_screen.dart';
import 'package:otimobapps25/view/widgets/custom_textfield.dart';
import 'package:get/get.dart';

class SigninScreen extends StatelessWidget {
  SigninScreen({super.key});

  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final isDark = Theme.of(context).brightness == Brightness.dark;
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(24),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "Welcome Back!",
                style: AppTextStyles.withColor(
                  AppTextStyles.h1,
                  Theme.of(context).textTheme.bodyLarge!.color!,
                ),
              ),
              const SizedBox(height:8),
              Text('Sign in to continue shopping',
                style: AppTextStyles.withColor(
                  AppTextStyles.bodyLarge,
                  isDark ? Colors.grey[400]! : Colors.grey[600]!,
                )
              ),
              const SizedBox(height:40),
              //email  textfield
              CustomTextField(
                label: 'Email',
                prefixIcon: Icons.email_outlined,
                keyboardType: TextInputType.emailAddress,
                controller: _emailController,
                validator: (value){
                  if(value == null || value.isEmpty){
                    return 'Please enter your email';
                  }
                  if(!GetUtils.isEmail(value)){
                    return 'Please enter a valid email';
                  }
                  return null;
                }
              ),
              const SizedBox(height:16),
              CustomTextField(
                label: 'Password',
                prefixIcon: Icons.lock_outline,
                keyboardType: TextInputType.visiblePassword,
                isPassword: true,
                controller: _passwordController,
                validator: (value){
                  if(value == null || value.isEmpty){
                    return 'Please enter your password';
                  }
                  return null;
                }
              ),
              const SizedBox(height:8),
              Align(
                alignment: Alignment.centerRight,
                child: TextButton(
                  onPressed: () => Get.to(() => ForgotPasswordScreen()),
                  child: Text('Forgot Password?',
                    style: AppTextStyles.withColor(
                      AppTextStyles.buttonMedium,
                      Theme.of(context).primaryColor,
                    ),
                  ),
                ),
              ),
              const SizedBox(height:24),
              SizedBox(
                width: double.infinity,
                height: 48,
                child: ElevatedButton(
                  onPressed: _handleSignIn,
                  style: ElevatedButton.styleFrom(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                    backgroundColor: Theme.of(context).primaryColor,
                    padding: const EdgeInsets.symmetric(vertical: 16),
                  ),
                  child: Text('Sign In',
                    style: AppTextStyles.withColor(
                      AppTextStyles.buttonLarge,
                      Colors.white,
                    ),
                  ),
                  
                ),
              ),
              const SizedBox(height:24),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    "Don't have an account?",
                    style: AppTextStyles.withColor(
                      AppTextStyles.bodyMedium,
                      isDark ? Colors.grey[400]! : Colors.grey[600]!,
                    ),
                  ),
                  TextButton(
                    onPressed: () => Get.to(() => SignupScreen()),
                    
                    child: Text('Sign Up',
                      style: AppTextStyles.withColor(
                        AppTextStyles.buttonMedium,
                        Theme.of(context).primaryColor,
                      ),
                    ),
                  )
                ],
              )
            ],
          )
        )
      )
    );
  }

  void _handleSignIn() {
    final AuthController authController = Get.find<AuthController>();
    authController.login();
    Get.offAll(() => const MainScreen());
  }
}