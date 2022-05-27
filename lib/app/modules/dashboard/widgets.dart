import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:hollow/app/helpers/helpers.dart';
import 'package:hollow/app/modules/components/buttons.dart';
import 'package:hollow/app/modules/dashboard/screens/tab_layout.dart';
import 'package:hollow/app/navigators/navigators.dart';
import 'package:hollow/utils/asset_paths.dart';
import 'package:hollow/utils/constants.dart';
import 'package:hollow/utils/strings.dart';

class CustomAnimatedBottomBar extends StatelessWidget {
  const CustomAnimatedBottomBar({
    Key? key,
    this.selectedIndex = 0,
    this.showElevation = true,
    this.iconSize = 24,
    this.backgroundColor,
    this.itemCornerRadius = 50,
    this.containerHeight = 56,
    this.animationDuration = const Duration(milliseconds: 270),
    this.mainAxisAlignment = MainAxisAlignment.spaceBetween,
    required this.items,
    required this.onItemSelected,
    this.curve = Curves.linear,
  })  : assert(items.length >= 2 && items.length <= 5),
        super(key: key);

  final int selectedIndex;
  final double iconSize;
  final Color? backgroundColor;
  final bool showElevation;
  final Duration animationDuration;
  final List<BottomNavyBarItem> items;
  final ValueChanged<int> onItemSelected;
  final MainAxisAlignment mainAxisAlignment;
  final double itemCornerRadius;
  final double containerHeight;
  final Curve curve;

  @override
  Widget build(BuildContext context) {
    final bgColor = backgroundColor ?? Theme.of(context).bottomAppBarColor;

    return Container(
      margin: const EdgeInsets.symmetric(
          horizontal: kMediumPadding, vertical: kSmallPadding),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(kRegularPadding),
        color: bgColor,
        boxShadow: [
          if (showElevation)
            const BoxShadow(
              color: Color.fromRGBO(0, 0, 0, 0.1),
              blurRadius: 6,
            )
        ],
      ),
      child: SafeArea(
        child: SizedBox(
          width: double.infinity,
          height: containerHeight,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: items.map((item) {
              var index = items.indexOf(item);
              return GestureDetector(
                onTap: () => onItemSelected(index),
                child: _ItemWidget(
                  item: item,
                  iconSize: iconSize,
                  isSelected: index == selectedIndex,
                  backgroundColor: bgColor,
                  itemCornerRadius: itemCornerRadius,
                  animationDuration: animationDuration,
                  curve: curve,
                ),
              );
            }).toList(),
          ),
        ),
      ),
    );
  }
}

class _ItemWidget extends StatelessWidget {
  final double iconSize;
  final bool isSelected;
  final BottomNavyBarItem item;
  final Color backgroundColor;
  final double itemCornerRadius;
  final Duration animationDuration;
  final Curve curve;

  const _ItemWidget({
    Key? key,
    required this.item,
    required this.isSelected,
    required this.backgroundColor,
    required this.animationDuration,
    required this.itemCornerRadius,
    required this.iconSize,
    this.curve = Curves.linear,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Semantics(
      container: true,
      selected: isSelected,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Expanded(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: <Widget>[
                IconTheme(
                  data: IconThemeData(
                    size: iconSize,
                    color: isSelected
                        ? item.activeColor.withOpacity(1)
                        : item.inactiveColor ?? item.activeColor,
                  ),
                  child: SvgPicture.asset(
                    item.icon,
                    color: isSelected ? item.activeColor : kIconColor,
                  ),
                ),
              ],
            ),
          ),
          isSelected
              ? SvgPicture.asset(AssetPaths.bottomLogo)
              : const SizedBox()
        ],
      ),
    );
  }
}

class BottomNavyBarItem {
  BottomNavyBarItem({
    required this.icon,
    this.text,
    this.activeColor = kBlueDeepColor,
    this.textAlign,
    this.inactiveColor,
  });

  final String icon;
  final String?  text;
  final Color activeColor;
  final Color? inactiveColor;
  final TextAlign? textAlign;
}

Future<dynamic> buildShowModalBottomSheet(BuildContext context) {
  return showModalBottomSheet(
      isScrollControlled: true,
      backgroundColor: Colors.transparent,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(kMacroPadding),
          topRight: Radius.circular(kMacroPadding),
        ),
      ),
      context: context,
      builder: (ctx) => Container(
        padding:  const EdgeInsets.all(20),
        decoration: const BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(kMacroPadding),
            topRight: Radius.circular(kMacroPadding),
          ),
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Center(child: Image.asset(AssetPaths.successIcon)),
            const SizedBox(
              height: kMediumPadding,
            ),
            Text(
              successful,
              style: textTheme(context)
                  .bodyText1!
                  .copyWith(fontSize: 26, color: kGreenColor),
            ),
            const SizedBox(
              height: kSmallPadding,
            ),
            Text(
              successfulSub,
              style: textTheme(context).headline2!.copyWith(
                color: kPrimaryGrey700,
              ),
            ),
            const SizedBox(
              height: kLargePadding,
            ),
            ButtonWidget(
                buttonText: fundWallet,
                textColor: kPrimaryWhite,
                backGroundColor: kBlueDeepColor,
                onPressed: () {}),
            const SizedBox(
              height: kSmallPadding,
            ),
            ButtonWidget(
                buttonText: backHome,
                textColor: kBlueDeepColor,
                backGroundColor: kHomePurpleColor300,
                borderColor: Colors.grey,
                onPressed: () {
                  pushTo(context, const TabLayout());
                })
          ],
        ),
      ));
}



