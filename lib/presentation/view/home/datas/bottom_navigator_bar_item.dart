import 'package:flutter/material.dart';
import 'package:food_hub_app/presentation/util/image_paths.dart';
import 'package:food_hub_app/presentation/view/home/widgets/home_widgets.dart';

class BottomNatigatorItems {
  var home = BottomNavigationBarItem(
    icon: ImagePaths.iconHomeOff,
    activeIcon: ImagePaths.iconHomeOn,
    label: 'Home',
  );
  var location = BottomNavigationBarItem(
    icon: ImagePaths.iconLocationOff,
    activeIcon: ImagePaths.iconLocationOn,
    label: 'Location',
  );
  var cart = BottomNavigationBarItem(
    icon: HomeWidgets().buttomBarWithWNoti(ImagePaths.iconCartOff, '4'),
    activeIcon: HomeWidgets().buttomBarWithWNoti(ImagePaths.iconCartOn, '4'),
    label: 'Cart',
  );
  var like = BottomNavigationBarItem(
    icon: ImagePaths.iconLikeOff,
    activeIcon: ImagePaths.iconLikeOn,
    label: 'Like',
  );

  var notification = BottomNavigationBarItem(
    icon: HomeWidgets().buttomBarWithWNoti(ImagePaths.iconNotificationOff, '4'),
    activeIcon:
        HomeWidgets().buttomBarWithWNoti(ImagePaths.iconNotificationOn, '4'),
    label: 'Notification',
  );

  List<BottomNavigationBarItem> all() => [
        home,
        location,
        cart,
        like,
        notification,
      ];
}
