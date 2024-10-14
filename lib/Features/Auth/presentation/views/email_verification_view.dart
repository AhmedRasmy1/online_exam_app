import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../view_model/EmailVerification_ViewModel/email_verification_view_cubit.dart';
import '../widgets/bloc_consumer_email_verification_page.dart';
import '../../../../core/functions/extenstions.dart';
import '../../../../core/resources/app_constants.dart';
import '../../../../di/di.dart';
import '../../../../core/resources/color_manager.dart';
import '../../../../core/resources/font_manager.dart';
import '../../../../core/resources/strings_manager.dart';
import '../../../../core/resources/values_manager.dart';
import '../widgets/custom_app_bar.dart';

class OtpVerificationPage extends StatefulWidget {
  const OtpVerificationPage({super.key});

  @override
  createState() => _OtpVerificationPageState();
}

class _OtpVerificationPageState extends State<OtpVerificationPage> {
  late VerifyCodeViewModel viewModel;
  final List<TextEditingController> _controllers =
      List.generate(6, (_) => TextEditingController());
  bool _isCodeInvalid = false; // Track invalid code state

  final String _errorMessage = AppStrings.invalidCode;

  @override
  void initState() {
    viewModel = getIt.get<VerifyCodeViewModel>();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => viewModel,
      child: SafeArea(
        child: Scaffold(
          body: Padding(
            padding: const EdgeInsets.only(
                top: AppPadding.p8,
                left: AppPadding.p16,
                right: AppPadding.p16),
            child: Column(
              children: [
                CustomAppBar(
                  title: AppStrings.password,
                  onTap: () {
                    Navigator.pop(context);
                  },
                ),
                const SizedBox(height: AppSize.s40),
                Text(
                  AppStrings.emailVerification,
                  style: TextStyle(
                    fontSize: FontSize.s18,
                    color: ColorManager.black,
                    fontWeight: FontWeightManager.medium,
                  ),
                ),
                const SizedBox(height: AppSize.s16),
                Text(
                  AppStrings.subTitleOfEmailVerification,
                  style: TextStyle(
                    fontSize: FontSize.s14,
                    color: ColorManager.grey,
                    fontWeight: FontWeightManager.regular,
                  ),
                ),
                const SizedBox(height: AppSize.s32),
                Form(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: List.generate(
                      AppConstants.listGenerate,
                      (index) {
                        return SizedBox(
                          width: context.screenWidth / 7.4,
                          height: context.screenWidth / 6,
                          child: TextFormField(
                            controller: _controllers[index],
                            onChanged: (value) {
                              if (value.isNotEmpty) {
                                if (value.length == 1 && index < 5) {
                                  FocusScope.of(context).nextFocus();
                                } else if (index == 5) {
                                  String enteredOtp = _controllers
                                      .map((controller) => controller.text)
                                      .join();
                                  viewModel.verifyCode(code: enteredOtp);
                                  FocusScope.of(context).unfocus();
                                }
                              } else if (value.isEmpty && index > 0) {
                                FocusScope.of(context).previousFocus();
                              }
                            },
                            keyboardType:
                                const TextInputType.numberWithOptions(),
                            textAlign: TextAlign.center,
                            inputFormatters: [
                              LengthLimitingTextInputFormatter(1),
                              FilteringTextInputFormatter.digitsOnly,
                            ],
                            decoration: InputDecoration(
                              filled: true,
                              fillColor: ColorManager.colorOfEmailverification,
                              enabledBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(10),
                                borderSide: BorderSide(
                                  color: _isCodeInvalid
                                      ? ColorManager.error
                                      : ColorManager.colorOfEmailverification,
                                  width: 2,
                                ),
                              ),
                              focusedBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(10),
                                borderSide: BorderSide(
                                  color: _isCodeInvalid
                                      ? ColorManager.error
                                      : ColorManager.colorOfEmailverification,
                                  width: 2,
                                ),
                              ),
                              contentPadding: const EdgeInsets.symmetric(
                                vertical: AppPadding.p24,
                              ),
                            ),
                            style: const TextStyle(fontSize: 20),
                          ),
                        );
                      },
                    ),
                  ),
                ),
                const SizedBox(height: 16),
                if (_isCodeInvalid)
                  Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      const Icon(
                        Icons.error_outline,
                        size: AppSize.s16,
                        color: ColorManager.error,
                      ),
                      Text(
                        _errorMessage,
                        style: const TextStyle(color: ColorManager.error),
                      ),
                    ],
                  ),
                const SizedBox(height: 24),
                BlocConsumerForOtpVerificationPage(
                  onCodeInvalid: (isInvalid) {
                    setState(() {
                      _isCodeInvalid = isInvalid;
                    });
                  },
                ),
                const SizedBox(height: 24),
                RichText(
                  text: TextSpan(
                    children: [
                      TextSpan(
                        text: AppStrings.dontReciveCode,
                        style: TextStyle(
                          fontSize: FontSize.s16,
                          fontWeight: FontWeightManager.regular,
                          color: ColorManager.black,
                        ),
                      ),
                      TextSpan(
                        text: AppStrings.resend,
                        style: TextStyle(
                          fontSize: FontSize.s16,
                          fontWeight: FontWeightManager.regular,
                          color: ColorManager.blue,
                          decoration: TextDecoration.underline,
                          decorationColor: ColorManager.blue,
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
