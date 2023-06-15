import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:food_hub_app/presentation/util/app_colors.dart';
import 'package:food_hub_app/presentation/util/image_paths.dart';
import 'package:food_hub_app/presentation/view/home/datas/feature_item.dart';

class FeatureRestaurantWidget extends ConsumerWidget {
  final FeatureItemModel featureItemModel;

  const FeatureRestaurantWidget({super.key, required this.featureItemModel});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Container(
      padding: const EdgeInsets.only(bottom: 10, right: 10),
      width: 250,
      decoration: BoxDecoration(
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.3),
            spreadRadius: 1,
            blurRadius: 3,
          ),
        ],
        color: AppColors.primaryBackgroundColor,
        borderRadius: BorderRadius.circular(10),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Stack(
            children: [
              ClipRRect(
                borderRadius: const BorderRadius.only(
                  topLeft: Radius.circular(10),
                  topRight: Radius.circular(10),
                ),
                child: featureItemModel.backgroundImage,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Container(
                    margin: const EdgeInsets.only(top: 10, left: 10),
                    padding: const EdgeInsets.all(5),
                    decoration: BoxDecoration(
                      color: AppColors.primaryBackgroundColor,
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: Row(
                      children: [
                        Text(
                          "${featureItemModel.voteStart}",
                          style: const TextStyle(
                            color: AppColors.textColor1,
                            fontSize: 10,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(bottom: 1, left: 5),
                          child: ImagePaths.starIconFeature,
                        ),
                        Padding(
                          padding: const EdgeInsets.only(bottom: 3, left: 5),
                          child: Text("(${featureItemModel.countVote}+)",
                              style: const TextStyle(
                                fontFamily: 'Sofia Pro',
                                fontSize: 10,
                              )),
                        ),
                      ],
                    ),
                  ),
                  Container(
                    margin: const EdgeInsets.only(top: 10, left: 10, right: 10),
                    padding: const EdgeInsets.all(5),
                    decoration: BoxDecoration(
                      color: AppColors.primaryColor,
                      borderRadius: BorderRadius.circular(15),
                    ),
                    child: ImagePaths.heartIconFeature,
                  ),
                ],
              ),
            ],
          ),
          Padding(
            padding: const EdgeInsets.all(10.0),
            child: Row(
              children: [
                Text(
                  featureItemModel.title,
                  style: const TextStyle(
                      fontFamily: 'Sofia Pro',
                      fontSize: 16,
                      fontWeight: FontWeight.bold),
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 10),
                  child: ImagePaths.verifyIconFeature,
                ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(
              left: 10,
            ),
            child: Row(
              children: [
                Padding(
                    padding: const EdgeInsets.only(
                      right: 5,
                    ),
                    child: ImagePaths.deliveryIconFeature),
                Text(
                  featureItemModel.statusDelivery,
                  style: const TextStyle(
                    fontFamily: 'Sofia Pro',
                    fontSize: 12,
                    color: AppColors.textColor,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(
                    left: 10,
                    right: 5,
                  ),
                  child: ImagePaths.timeIconFeature,
                ),
                Text(
                  featureItemModel.timeDelivery,
                  style: const TextStyle(
                    fontFamily: 'Sofia Pro',
                    fontSize: 12,
                    color: AppColors.textColor,
                  ),
                ),
              ],
            ),
          ),
          SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: Row(
              children: List.generate(
                featureItemModel.categoryFoods.length,
                (index) => _buildfood(featureItemModel.categoryFoods[index]),
              ),
              // Row(
              //   children: [
              //     _buildfood("BURGER"),
              //     _buildfood("BURGER"),
              //     _buildfood("BURGER"),
              //   ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildfood(String foodName) {
    return Container(
      margin: const EdgeInsets.only(top: 10, left: 10),
      padding: const EdgeInsets.only(left: 10, right: 10, top: 5, bottom: 5),
      decoration: BoxDecoration(
        color: AppColors.textColor.withOpacity(0.2),
        borderRadius: BorderRadius.circular(5),
      ),
      child: Text(
        foodName,
        style: const TextStyle(
          color: AppColors.textColor1,
          fontSize: 10,
          fontWeight: FontWeight.bold,
        ),
      ),
    );
  }
}
