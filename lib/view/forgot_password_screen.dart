import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:otimobapps25/utils/app_textstyles.dart';
import 'package:otimobapps25/view/widgets/custom_textfield.dart';

class ForgotPasswordScreen extends StatelessWidget {
  ForgotPasswordScreen({super.key});

  final TextEditingController _emailController = TextEditingController();

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
              IconButton(
                onPressed: () => Get.back(), 
                icon: Icon(
                  Icons.arrow_back_ios,
                  color: isDark ? Colors.white : Colors.black,
                )
              ),
              const SizedBox(height:20),
              Text(
                "Reset Password",
                style: AppTextStyles.withColor(
                  AppTextStyles.h1,
                  Theme.of(context).textTheme.bodyLarge!.color!,
                ),
              ),
              const SizedBox(height:8),
              Text( 
                'Enter your email to reset your password',
                style: AppTextStyles.withColor(
                  AppTextStyles.bodyLarge,
                  isDark ? Colors.grey[400]! : Colors.grey[600]!,
                )
              ),
              const SizedBox(height:40),
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
              const SizedBox(height:24),
              SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                  onPressed: (){
                    showSuccessDialog(context);
                  },
                  style: ElevatedButton.styleFrom(
                    padding: const EdgeInsets.symmetric(vertical:16),
                    backgroundColor: Theme.of(context).primaryColor,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                  ),
                  child: Text('Send Reset Link',
                    style: AppTextStyles.withColor(
                      AppTextStyles.buttonMedium,
                      Colors.white,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      )
    );
  }
  void showSuccessDialog(BuildContext context) {
    Get.dialog(
      AlertDialog(
        title: Text(
          'Check Your Email',
          style: AppTextStyles.h3,
        ),
        content: Text(
          'A password reset link has been sent to your email.',
          style: AppTextStyles.bodyMedium,
        ),
        actions : [
          TextButton(onPressed: () => Get.back(),
          child: Text(
            'OK',
            style: AppTextStyles.withColor(
              AppTextStyles.buttonMedium,
              Theme.of(context).primaryColor,
            ),
          )
          ),
        ]
      ),
      );
    
  } 
}