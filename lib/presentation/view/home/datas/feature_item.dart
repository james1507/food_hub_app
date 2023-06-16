import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:food_hub_app/presentation/util/image_paths.dart';

class FeatureItemModel {
  final String title;
  final Image backgroundImage;
  final double voteStart;
  final int countVote;
  final bool isLike;
  final bool isVerify;
  final String statusDelivery;
  final String timeDelivery;
  final List<String> categoryFoods;

  FeatureItemModel({
    required this.title,
    required this.backgroundImage,
    required this.voteStart,
    required this.countVote,
    required this.isLike,
    required this.isVerify,
    required this.statusDelivery,
    required this.timeDelivery,
    required this.categoryFoods,
  });
}

class FeatureItems {
  listRestaurant() {
    return FirebaseFirestore.instance
        .collection('foods')
        .snapshots()
        .map((snashot) => snashot.docs.map((doc) => doc.data()).toList());
  }

  static var mcDonalds = FeatureItemModel(
    title: "McDonald's",
    backgroundImage: ImagePaths.backgroundImageFeature,
    categoryFoods: [
      'BURGER',
      'CHICKEN',
      'FAST FOOD',
      'BURGER',
      'CHICKEN',
      'FAST FOOD'
    ],
    countVote: 25,
    isLike: true,
    isVerify: true,
    statusDelivery: 'Free Delivery',
    timeDelivery: '30-40 min',
    voteStart: 4.5,
  );

  static var starbucks = FeatureItemModel(
    title: "McDonald's",
    backgroundImage: ImagePaths.backgroundImageFeature,
    categoryFoods: ['BURGER', 'CHICKEN', 'FAST FOOD'],
    countVote: 25,
    isLike: true,
    isVerify: true,
    statusDelivery: 'Free Delivery',
    timeDelivery: '30-40 min',
    voteStart: 4.5,
  );

  static var kFC = FeatureItemModel(
    title: "McDonald's",
    backgroundImage: ImagePaths.backgroundImageFeature,
    categoryFoods: ['BURGER', 'CHICKEN', 'FAST FOOD'],
    countVote: 25,
    isLike: true,
    isVerify: true,
    statusDelivery: 'Free Delivery',
    timeDelivery: '30-40 min',
    voteStart: 4.5,
  );

  static var subway = FeatureItemModel(
    title: "McDonald's",
    backgroundImage: ImagePaths.backgroundImageFeature,
    categoryFoods: ['BURGER', 'CHICKEN', 'FAST FOOD'],
    countVote: 25,
    isLike: true,
    isVerify: true,
    statusDelivery: 'Free Delivery',
    timeDelivery: '30-40 min',
    voteStart: 4.5,
  );

  static List<FeatureItemModel> all = [
    mcDonalds,
    starbucks,
    kFC,
    subway,
  ];
}
