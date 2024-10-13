import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:online_exam_app/Features/Auth/presentation/view_model/verify_code_view_model.dart';
import 'package:online_exam_app/core/resources/color_manager.dart';
import 'package:online_exam_app/core/resources/font_manager.dart';
import 'package:online_exam_app/core/resources/routes_manager.dart';
import 'package:online_exam_app/core/resources/strings_manager.dart';
import 'package:online_exam_app/core/resources/values_manager.dart';
import 'package:online_exam_app/di/di.dart';
import '../widgets/custom_app_bar.dart';

class OtpVerificationPage extends StatefulWidget {
  const OtpVerificationPage({super.key});

  @override
  createState() => _OtpVerificationPageState();
}

class _OtpVerificationPageState extends State<OtpVerificationPage> {
  final List<TextEditingController> _controllers =
      List.generate(6, (_) => TextEditingController());
  bool _isCodeInvalid = false;

  @override
  Widget build(BuildContext context) {
    final VerifyCodeViewModel viewModel = getIt<VerifyCodeViewModel>();

    return BlocProvider(
      create: (context) => viewModel,
      child: BlocConsumer<VerifyCodeViewModel, VerifyCodeState>(
        listener: (context, state) {
          if (state is VerifyCodeSuccess) {
            Navigator.pushNamed(context, RoutesManager.resetPasswordRoute);
          } else if (state is VerifyCodeError) {
            setState(() {
              _isCodeInvalid = true;
            });
          }
        },
        builder: (context, state) {
          return SafeArea(
            child: Scaffold(
              body: Padding(
                padding: const EdgeInsets.symmetric(
                  horizontal: AppPadding.p16,
                  vertical: AppPadding.p8,
                ),
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
                        children: List.generate(6, (index) {
                          return SizedBox(
                            width: MediaQuery.of(context).size.width / 7.4,
                            height: MediaQuery.of(context).size.width / 6,
                            child: TextFormField(
                              controller: _controllers[index],
                              onChanged: (value) {
                                if (_isCodeInvalid) {
                                  setState(() {
                                    _isCodeInvalid = false;
                                  });
                                }

                                if (value.isNotEmpty && index < 5) {
                                  FocusScope.of(context).nextFocus();
                                } else if (value.isEmpty && index > 0) {
                                  FocusScope.of(context).previousFocus();
                                }

                                if (index == 5 && value.isNotEmpty) {
                                  final enteredOtp = _controllers
                                      .map((controller) => controller.text)
                                      .join();
                                  viewModel.verifyCode(code: enteredOtp);
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
                                fillColor: _isCodeInvalid
                                    ? ColorManager.white
                                    : ColorManager.colorOfEmailverification,
                                enabledBorder: OutlineInputBorder(
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
                        }),
                      ),
                    ),
                    if (_isCodeInvalid)
                      const Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          Icon(
                            Icons.error_outline,
                            size: AppSize.s16,
                            color: ColorManager.error,
                          ),
                          Text(
                            AppStrings.invalidCode,
                            style: TextStyle(color: ColorManager.error),
                          ),
                        ],
                      ),
                    const SizedBox(height: AppSize.s24),
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
          );
        },
      ),
    );
  }
}
