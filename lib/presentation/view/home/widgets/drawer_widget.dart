import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:food_hub_app/presentation/view/home/datas/drawer_item.dart';

class DrawerWidget extends StatelessWidget {
  final ValueChanged<DrawerItemModel> onSelectItem;

  const DrawerWidget({super.key, required this.onSelectItem});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.fromLTRB(10, 32, 10, 0),
      child: SingleChildScrollView(
        child: Column(
          children: [
            buildDrawerItems(context),
          ],
        ),
      ),
    );
  }

  Widget buildDrawerItems(BuildContext context) {
    return Column(
      children: DrawerItems.all
          .map(
            (item) => ListTile(
              leading: SvgPicture.asset(
                item.icon,
              ),
              title: Padding(
                padding: const EdgeInsets.only(bottom: 5),
                child: Text(
                  item.title,
                  style: const TextStyle(
                    fontFamily: 'Sofia Pro',
                    fontSize: 14,
                  ),
                ),
              ),
              onTap: () => onSelectItem(item),
            ),
          )
          .toList(),
    );
  }
}
