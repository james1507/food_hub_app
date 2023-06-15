import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:food_hub_app/presentation/util/util.dart';


class CustomWidget {
  static Widget lineSignIn(Color color) {
    return SizedBox(
      width: 84.0,
      height: 1.0,
      child: DecoratedBox(
        decoration: BoxDecoration(color: color),
      ),
    );
  }

  static Container topImage(
    BuildContext context,
  ) {
    return Container(
      width: MediaQuery.of(context).size.width,
      height: 75,
      decoration: BoxDecoration(
        image: DecorationImage(
          fit: BoxFit.fill,
          image: ImagePaths.topImage,
        ),
      ),
    );
  }

  static Widget spaceH(double value) {
    return SizedBox(
      height: value,
    );
  }

  static Widget spaceW(double value) {
    return SizedBox(
      width: value,
    );
  }

  static errorDialog(BuildContext context, {String errorString = ""}) {
    return showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: Text('shareDialogTextError'.tr()),
          content: Text(errorString),
          actions: [
            TextButton(
              child: Text('shareDialogTextClose'.tr()),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      },
    );
  }
}
