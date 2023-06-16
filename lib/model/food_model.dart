import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:flutter/foundation.dart';

part 'food_model.freezed.dart';
part 'food_model.g.dart';

@freezed
class FoodModel with _$FoodModel {
  const factory FoodModel({
    String? id,
    String? categoryID,
    String? restaurantID,
    String? name,
    String? image,
    String? cost,
    String? detail,
    bool? isLike,
  }) = _FoodModel;

  factory FoodModel.fromJson(Map<String, Object?> json) =>
      _$FoodModelFromJson(json);
}
