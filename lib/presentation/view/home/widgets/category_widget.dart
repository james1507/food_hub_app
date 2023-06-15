import 'package:flutter/material.dart';
import 'package:food_hub_app/presentation/util/app_colors.dart';
import 'package:food_hub_app/presentation/view/home/datas/food_item.dart';

class CategoriesWidget extends StatefulWidget {
  const CategoriesWidget({super.key});

  @override
  State<CategoriesWidget> createState() => _CategoriesWidgetState();
}

class _CategoriesWidgetState extends State<CategoriesWidget> {
  int _valueClick = 0;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 150,
      child: ListView.builder(
        itemCount: FoodItems.all.length,
        shrinkWrap: true,
        scrollDirection: Axis.horizontal,
        itemBuilder: (context, index) {
          return Row(
            children: [
              SizedBox(
                  width: 70,
                  height: 120,
                  child: ElevatedButton(
                    style: ButtonStyle(
                      backgroundColor: MaterialStatePropertyAll(
                        _valueClick == index
                            ? AppColors.primaryColor
                            : AppColors.primaryBackgroundColor,
                      ),
                      shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                        RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(40.0),
                        ),
                      ),
                      padding: const MaterialStatePropertyAll(
                        EdgeInsets.only(left: 5, right: 5, top: 5),
                      ),
                    ),
                    onPressed: () {
                      setState(() {
                        _valueClick = index;
                      });
                    },
                    child: _buildfoodCategory(FoodItems.all[index].icon,
                        FoodItems.all[index].title, _valueClick == index),
                  )),
              const SizedBox(
                width: 10,
              )
            ],
          );
        },
      ),
    );
  }

  Widget _buildfoodCategory(String image, String title, bool isClick) {
    return Column(
      children: [
        SizedBox(
          height: 60,
          width: 60,
          child: ClipRRect(
            borderRadius: const BorderRadius.all(Radius.circular(60)),
            child: Image.asset(
              image,
              fit: BoxFit.cover,
            ),
          ),
        ),
        const SizedBox(
          height: 15,
        ),
        Text(title,
            style: TextStyle(
                fontSize: 12,
                color: isClick
                    ? AppColors.primaryBackgroundColor
                    : AppColors.textColor1)),
      ],
    );
  }
}
