// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'food_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_FoodModel _$$_FoodModelFromJson(Map<String, dynamic> json) => _$_FoodModel(
      id: json['id'] as String?,
      categoryID: json['categoryID'] as String?,
      restaurantID: json['restaurantID'] as String?,
      name: json['name'] as String?,
      image: json['image'] as String?,
      cost: json['cost'] as String?,
      detail: json['detail'] as String?,
      isLike: json['isLike'] as bool?,
    );

Map<String, dynamic> _$$_FoodModelToJson(_$_FoodModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'categoryID': instance.categoryID,
      'restaurantID': instance.restaurantID,
      'name': instance.name,
      'image': instance.image,
      'cost': instance.cost,
      'detail': instance.detail,
      'isLike': instance.isLike,
    };
