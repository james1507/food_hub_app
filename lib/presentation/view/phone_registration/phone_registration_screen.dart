import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:food_hub_app/model/sign_up_model.dart';
import 'package:food_hub_app/presentation/controller/auth_controller.dart';
import 'package:food_hub_app/presentation/controller/auth_phone_controller.dart';
import 'package:food_hub_app/presentation/util/app_colors.dart';
import 'package:food_hub_app/presentation/view/custom_widgets/custom_button_widget.dart';
import 'package:food_hub_app/presentation/view/custom_widgets/custom_text_widget.dart';
import 'package:food_hub_app/presentation/view/custom_widgets/custom_widget.dart';
import 'package:food_hub_app/presentation/view/phone_registration/verification_screen.dart';
import 'package:food_hub_app/presentation/view/phone_registration/widgets/phone_res_widget.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

List<String> listCountryCode = <String>['VN', 'KR', 'JP', 'US'];
List<Map<String, String>> listCountryCodePhone = [
  {'VN': '+84'},
  {'KR': '+82'},
  {'JP': '+81'},
  {'US': '+1'},
];

class PhoneRegistrationScreen extends ConsumerStatefulWidget {
  const PhoneRegistrationScreen({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() =>
      _PhoneRegistrationScreenState();
}

class _PhoneRegistrationScreenState
    extends ConsumerState<PhoneRegistrationScreen> {
  String dropDownValue = listCountryCode.first;
  int dropDownIndex = 0;
  String checkPhoneTypeText = "";
  bool checkPhoneType = false;

  final phoneTextField = TextEditingController();

  SignUpModel signUpModel = const SignUpModel();

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.primaryBackgroundColor,
      body: LayoutBuilder(
        builder: (context, constrains) => SingleChildScrollView(
          child: IntrinsicHeight(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Stack(
                  children: [
                    CustomWidget.topImage(context),
                    CustomButtonWidget.backButton(
                      context,
                      onPressed: () {},
                    ),
                  ],
                ),
                CustomWidget.spaceH(100),
                CustomTextWidget.titleName(
                    context, AppLocalizations.of(context)!.registrationPhone),
                CustomWidget.spaceH(15),
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
                          AppLocalizations.of(context)!.titleRegistrationPhone,
                          style: const TextStyle(
                            fontFamily: 'Sofia Pro',
                            fontSize: 14,
                            color: AppColors.textColor,
                          ),
                        ),
                        CustomWidget.spaceH(38),
                        Container(
                          padding: const EdgeInsets.only(
                            left: 20,
                            top: 5,
                            bottom: 5,
                          ),
                          decoration: BoxDecoration(
                              border: Border.all(color: AppColors.primaryColor),
                              borderRadius: const BorderRadius.all(
                                Radius.circular(15.0),
                              )),
                          child: Row(
                            children: [
                              PhoneResWidget.dropDownButton(
                                dropDownValue: dropDownValue,
                                onChanged: (value) {
                                  setState(() {
                                    dropDownValue = value!;
                                    dropDownIndex =
                                        listCountryCode.indexOf(value);
                                  });
                                },
                              ),
                              CustomWidget.spaceW(10),
                              for (var countryCodePhone in listCountryCodePhone)
                                if (countryCodePhone.keys
                                    .contains(dropDownValue))
                                  Padding(
                                    padding: const EdgeInsets.only(bottom: 5),
                                    child: Text(
                                      "(${countryCodePhone[dropDownValue]})",
                                      style: const TextStyle(
                                          fontFamily: 'Sofia Pro',
                                          color: AppColors.textColor1,
                                          fontSize: 16),
                                    ),
                                  ),
                              Expanded(
                                child: Padding(
                                  padding: const EdgeInsets.only(bottom: 5.5),
                                  child: TextField(
                                    onChanged: (value) {
                                      if (value == "") {
                                        setState(() {
                                          checkPhoneTypeText = "";
                                          checkPhoneType = false;
                                        });
                                      } else if (value.length < 9) {
                                        setState(() {
                                          checkPhoneTypeText =
                                              AppLocalizations.of(context)!
                                                  .invalidValue;
                                          checkPhoneType = false;
                                        });
                                      } else if (value.length > 10) {
                                        setState(() {
                                          checkPhoneTypeText =
                                              AppLocalizations.of(context)!
                                                  .invalidValue;
                                          checkPhoneType = false;
                                        });
                                      } else {
                                        setState(() {
                                          checkPhoneTypeText = "";
                                          checkPhoneType = true;
                                        });
                                      }
                                    },
                                    controller: phoneTextField,
                                    style: const TextStyle(
                                        fontFamily: 'Sofia Pro',
                                        color: AppColors.textColor1,
                                        fontSize: 16),
                                    keyboardType: TextInputType.number,
                                    inputFormatters: [
                                      FilteringTextInputFormatter.digitsOnly
                                    ],
                                    textAlignVertical: TextAlignVertical.center,
                                    decoration: const InputDecoration(
                                      border: InputBorder.none,
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                        Center(
                            child: Text(
                          checkPhoneTypeText,
                          style: const TextStyle(color: Colors.red),
                        )),
                        CustomWidget.spaceH(51),
                        PhoneResWidget.loginButtonWidget(
                          context,
                          onPress: () {
                            if (checkPhoneType == true) {
                              ref
                                  .read(authPhoneControllerProvider.notifier)
                                  .sendOtpCode(context,
                                      phone:
                                          "${listCountryCodePhone[dropDownIndex].values.toString().replaceAll("(", "").replaceAll(")", "")}${phoneTextField.text}");
                            } else {
                              setState(() {
                                AppLocalizations.of(context)!.invalidValue;
                                checkPhoneType = false;
                              });
                            }
                          },
                        ),
                      ],
                    ),
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
