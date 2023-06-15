import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:food_hub_app/presentation/controller/auth_phone_controller.dart';
import 'package:food_hub_app/presentation/util/app_colors.dart';
import 'package:food_hub_app/presentation/util/image_paths.dart';
import 'package:food_hub_app/presentation/view/phone_registration/widgets/phone_res_widget.dart';

import 'package:pinput/pinput.dart';

final defaultPinTheme = PinTheme(
  width: 56,
  height: 56,
  textStyle: const TextStyle(
      fontSize: 20,
      color: Color.fromRGBO(30, 60, 87, 1),
      fontWeight: FontWeight.w600),
  decoration: BoxDecoration(
    border: Border.all(color: const Color.fromRGBO(234, 239, 243, 1)),
    borderRadius: BorderRadius.circular(20),
  ),
);

final focusedPinTheme = defaultPinTheme.copyDecorationWith(
  border: Border.all(color: const Color.fromRGBO(114, 178, 238, 1)),
  borderRadius: BorderRadius.circular(8),
);

class VerificationScreen extends ConsumerStatefulWidget {
  final String verificationIdReceived;

  const VerificationScreen({
    super.key,
    this.verificationIdReceived = "",
  });

  @override
  ConsumerState<ConsumerStatefulWidget> createState() =>
      _VerificationScreenState();
}

class _VerificationScreenState extends ConsumerState<VerificationScreen> {
  String? verificationId;
  final pinController = TextEditingController();

  @override
  void initState() {
    super.initState();

    verificationId = widget.verificationIdReceived;
  }

  @override
  Widget build(BuildContext context) {
    ref.listen(authPhoneControllerProvider, ((previous, next) {
      if (next == true) {
        Navigator.pushNamed(context, '/home');
      }
    }));
    return WillPopScope(
      onWillPop: () {
        Navigator.pushNamedAndRemoveUntil(
            context, '/login', ModalRoute.withName('/welcome'));
        return Future.value(false);
      },
      child: Scaffold(
        backgroundColor: AppColors.primaryBackgroundColor,
        body: LayoutBuilder(
          builder: (context, constrains) => SingleChildScrollView(
            child: IntrinsicHeight(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Stack(
                    children: [
                      Container(
                        width: MediaQuery.of(context).size.width,
                        height: 75,
                        decoration: BoxDecoration(
                          image: DecorationImage(
                            fit: BoxFit.fill,
                            image: ImagePaths.topImage,
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(
                          top: 35,
                          left: 20,
                        ),
                        child: SizedBox(
                          height: 38,
                          width: 38,
                          child: ElevatedButton(
                            style: ButtonStyle(
                              padding: const MaterialStatePropertyAll(
                                  EdgeInsets.only(left: 5)),
                              backgroundColor:
                                  const MaterialStatePropertyAll<Color>(
                                AppColors.primaryBackgroundColor,
                              ),
                              shape: MaterialStatePropertyAll(
                                RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(13.0),
                                ),
                              ),
                            ),
                            onPressed: () {},
                            child: const Icon(
                              Icons.arrow_back_ios,
                              color: AppColors.textColor1,
                              size: 16,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 80,
                  ),
                  Expanded(
                    flex: 1,
                    child: Padding(
                      padding: const EdgeInsets.only(
                        left: 25,
                        top: 20,
                      ),
                      child: Text(
                        'signUpVerificationPhone'.tr(),
                        style: const TextStyle(
                          fontFamily: 'Sofia Pro',
                          fontSize: 36.41,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 15,
                  ),
                  Expanded(
                    flex: 7,
                    child: Padding(
                      padding: const EdgeInsets.only(
                        left: 25,
                        right: 20,
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'signUpTitleVerificationPhone'.tr(),
                            style: const TextStyle(
                              fontFamily: 'Sofia Pro',
                              fontSize: 14,
                              color: AppColors.textColor,
                            ),
                          ),
                          const SizedBox(
                            height: 30,
                          ),
                          Pinput(
                            length: 6,
                            defaultPinTheme: defaultPinTheme,
                            focusedPinTheme: focusedPinTheme,
                            // validator: (s) {
                            //   return s == '123456' ? null : 'Pin is incorrect';
                            // },
                            pinputAutovalidateMode:
                                PinputAutovalidateMode.onSubmit,
                            onCompleted: (pin) {
                              ref
                                  .read(authPhoneControllerProvider.notifier)
                                  .signUpWithPhone(context,
                                      smsCode: pin,
                                      verificationId: verificationId);
                            },

                            showCursor: true,
                            controller: pinController,
                          ),
                          const SizedBox(
                            height: 15,
                          ),
                          PhoneResWidget.resendOTP(
                            context,
                            onPressed: () {},
                          )
                        ],
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
