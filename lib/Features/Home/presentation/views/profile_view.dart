import 'package:flutter/material.dart';
import '../widgets/custom_circle_avatar.dart';
import '../../../../core/functions/extenstions.dart';
import '../../../../core/functions/form_helpers.dart';
import '../../../../core/resources/app_constants.dart';
import '../../../../core/resources/color_manager.dart';
import '../../../../core/resources/font_manager.dart';
import '../../../../core/widgets/custom_app_bar.dart';
import '../../../../core/resources/strings_manager.dart';
import '../../../../core/resources/values_manager.dart';
import '../../../../core/widgets/custom_elevated_button.dart';
import '../../../../core/widgets/custom_text_form_field.dart';

class ProfileView extends StatefulWidget {
  const ProfileView({super.key});

  @override
  State<ProfileView> createState() => _ProfileViewState();
}

class _ProfileViewState extends State<ProfileView> {
  final TextEditingController _userNameController = TextEditingController();
  final TextEditingController _firstNameController = TextEditingController();
  final TextEditingController _lastNameController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _phoneController = TextEditingController();
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  Color buttonColor = ColorManager.blue;
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: ListView(
          children: [
            Padding(
              padding: const EdgeInsets.only(
                  top: AppPadding.p8,
                  left: AppPadding.p16,
                  right: AppPadding.p16),
              child: Form(
                key: _formKey,
                child: Column(
                  children: [
                    const CustomAppBar(title: AppStrings.profile, onTap: null),
                    const SizedBox(height: AppSize.s24),
                    const CustomCircleAvatar(),
                    const SizedBox(height: AppSize.s24),
                    CustomTextFormField(
                      controller: _userNameController,
                      labelText: AppStrings.userName,
                      hintText: AppStrings.enterYourUserName,
                      obscureText: false,
                      validator: (value) => validateNotEmpty(
                          value, AppStrings.enterValidUserName),
                    ),
                    const SizedBox(height: AppSize.s24),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        SizedBox(
                          width: context.screenWidth /
                              AppConstants.screenWidthRatio,
                          child: CustomTextFormField(
                            controller: _firstNameController,
                            labelText: AppStrings.firstName,
                            hintText: AppStrings.enterYourFirstName,
                            obscureText: false,
                            validator: (value) => validateNotEmpty(
                                value, AppStrings.entervalidfirstName),
                          ),
                        ),
                        SizedBox(
                          width: context.screenWidth /
                              AppConstants.screenWidthRatio,
                          child: CustomTextFormField(
                            controller: _lastNameController,
                            labelText: AppStrings.lastName,
                            hintText: AppStrings.enterYourLastName,
                            obscureText: false,
                            validator: (value) => validateNotEmpty(
                                value, AppStrings.entervalidLastName),
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: AppSize.s24),
                    CustomTextFormField(
                      keyboardType: TextInputType.emailAddress,
                      controller: _emailController,
                      labelText: AppStrings.email,
                      hintText: AppStrings.enterYourEmail,
                      obscureText: false,
                      validator: (value) =>
                          validateNotEmpty(value, AppStrings.enterValidEmail),
                    ),
                    const SizedBox(height: AppSize.s24),
                    CustomTextFormField(
                      keyboardType: TextInputType.visiblePassword,
                      controller: _passwordController,
                      labelText: AppStrings.password,
                      hintText: AppStrings.enterYourPassword,
                      obscureText: true,
                      validator: (value) => validateNotEmpty(
                          value, AppStrings.enterValidPassword),
                      suffix: GestureDetector(
                        onTap: () {},
                        child: Padding(
                          padding: const EdgeInsets.only(right: AppPadding.p16),
                          child: Text(
                            AppStrings.change,
                            style: TextStyle(
                              color: ColorManager.blue,
                              fontSize: FontSize.s14,
                              fontWeight: FontWeightManager.semiBold,
                            ),
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(height: AppSize.s24),
                    CustomTextFormField(
                      keyboardType: TextInputType.phone,
                      controller: _phoneController,
                      labelText: AppStrings.phoneNumber,
                      hintText: AppStrings.enterPhoneNumber,
                      obscureText: false,
                      validator: (value) => validateNotEmpty(
                          value, AppStrings.enterValidPhoneNumber),
                    ),
                    const SizedBox(height: AppSize.s48),
                    CustomElevatedButton(
                      buttonColor: buttonColor,
                      title: AppStrings.update,
                      onPressed: () {
                        validationMethod(
                          actionPress: () {},
                          updateButtonColor: (Color color) {
                            setState(() {
                              buttonColor = color;
                            });
                          },
                          formKey: _formKey,
                        );
                      },
                    )
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
