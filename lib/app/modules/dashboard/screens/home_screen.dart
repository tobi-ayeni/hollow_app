import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:hollow/app/helpers/helpers.dart';
import 'package:hollow/app/modules/components/flush_bar.dart';
import 'package:hollow/app/modules/dashboard/models/home_model.dart';
import 'package:hollow/app/modules/dashboard/screens/create_wallet.dart';
import 'package:hollow/app/navigators/navigators.dart';
import 'package:hollow/utils/asset_paths.dart';
import 'package:hollow/utils/constants.dart';
import 'package:hollow/utils/strings.dart';
import 'package:collection/collection.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);



  @override
  Widget build(BuildContext context) {
    Future.delayed(const Duration(milliseconds: 500)).then(
      (value) => showPendingBar(context, warningText),
    );
    return Container(
      height: double.infinity,
      padding: const EdgeInsets.only(
        top: kFullPadding,
        left: kMediumPadding,
        right: kMediumPadding,
      ),
      child: SingleChildScrollView(
        child: Column(
          children: [
            walletList.isEmpty
                ? Stack(
                    children: [
                      RotationTransition(
                          turns: const AlwaysStoppedAnimation(170 / 360),
                          child: Container(
                            margin: const EdgeInsets.symmetric(
                                horizontal: 15, vertical: 25),
                            height: 200,
                            decoration: BoxDecoration(
                              color: kFlushBarColor.withOpacity(0.3),
                              borderRadius:
                                  BorderRadius.circular(kRegularPadding),
                            ),
                          )),
                      Container(
                        margin: const EdgeInsets.symmetric(
                            horizontal: 15, vertical: 25),
                        height: 200,
                        alignment: Alignment.center,
                        width: double.infinity,
                        decoration: BoxDecoration(
                          color: kFlushBarColor,
                          borderRadius: BorderRadius.circular(kRegularPadding),
                        ),
                        child: inkWell(
                          onPressed: () {
                            pushTo(context, const CreateWallet());
                          },
                          child: DottedBorder(
                            dashPattern: const [9, 9, 9, 9],
                            radius: const Radius.circular(20),
                            borderType: BorderType.RRect,
                            color: kGreyBackground,
                            strokeWidth: 2,
                            child: Padding(
                              padding: const EdgeInsets.symmetric(
                                  horizontal: kMacroPadding,
                                  vertical: kRegularPadding),
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                mainAxisSize: MainAxisSize.min,
                                children: [
                                  Text(
                                    createWallet,
                                    style: textTheme(context).headline4,
                                  ),
                                  const SizedBox(
                                    height: kMediumPadding,
                                  ),
                                  Container(
                                    padding: const EdgeInsets.all(kPadding),
                                    decoration: BoxDecoration(
                                        border: Border.all(
                                            width: 1.5,
                                            color: kCheckBoxInActive),
                                        borderRadius: kBorderRadius),
                                    child: const Icon(
                                      Icons.add,
                                      color: kCheckBoxInActive,
                                      size: 15,
                                    ),
                                  )
                                ],
                              ),
                            ),
                          ),
                        ),
                      ),
                    ],
                  )
                : Stack(
                    children: [
                      buildStackedImages(context)
                    ],
                  ),
            const SizedBox(
              height: kRegularPadding,
            ),
             Container(
              height: 7,
              width: 30,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(kPadding),
                  color: kGreenColor),
            ),
            const SizedBox(
              height: kRegularPadding,
            ),
            Container(
              width: double.infinity,
              padding: const EdgeInsets.symmetric(
                vertical: kMediumPadding,
              ),
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(24),
                  color: kPrimaryWhite),
              child: Wrap(
                crossAxisAlignment: WrapCrossAlignment.center,
                alignment: WrapAlignment.center,
                children: homeItems
                    .map(
                      (item) => Container(
                        width: 120,
                        padding: const EdgeInsets.only(bottom: kMacroPadding),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Container(
                              padding: const EdgeInsets.all(kRegularPadding),
                              decoration: BoxDecoration(
                                shape: BoxShape.circle,
                                color: item.activeColor,
                              ),
                              child: SvgPicture.asset(item.icon),
                            ),
                            const SizedBox(height: kRegularPadding),
                            Text(
                              item.text!,
                              style: textTheme(context).headline3,
                              textAlign: TextAlign.center,
                              overflow: TextOverflow.ellipsis,
                              softWrap: true,
                            )
                          ],
                        ),
                      ),
                    )
                    .toList(),
              ),
            ),
            const SizedBox(
              height: kLargePadding,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  recentTransaction,
                  style: textTheme(context)
                      .headline4!
                      .copyWith(color: kPrimaryColor),
                ),
                Text(
                  seeAll,
                  style: textTheme(context).headline2!.copyWith(
                      color: kBlueDeepColor, fontWeight: FontWeight.w500),
                )
              ],
            ),
            const SizedBox(
              height: kFullPadding,
            ),
            Image.asset(AssetPaths.noTransaction),
            const SizedBox(
              height: kMacroPadding,
            ),
            Text(
              noTransactionText,
              style: textTheme(context).headline2!.copyWith(
                    color: kDeepGreyColor,
                    fontSize: 20,
                  ),
            ),
            const SizedBox(
              height: kMediumPadding,
            ),
          ],
        ),
      ),
    );
  }

  Widget buildStackedImages(BuildContext context) {
    double size = 220;
    final items = walletList
        .map(
          ( e) {
            return buildContainer(e, context);
          },
        )
        .toList();
    return StackedWidgets(items, size);
  }

  Widget buildContainer(WalletList e,  BuildContext context) {
    return Container(
      height: 220,
      padding: const EdgeInsets.all(kMediumPadding),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                "${e.walletType} balance",
                style: textTheme(context)
                    .headline3!
                    .copyWith(color: kCheckBoxInActive),
              ),
              Container(
                padding: const EdgeInsets.all(kPadding),
                decoration: BoxDecoration(
                    border: Border.all(width: 1.5, color: kCheckBoxInActive),
                    borderRadius: kBorderRadius),
                child: const Icon(
                  Icons.add,
                  color: kCheckBoxInActive,
                  size: 15,
                ),
              )
            ],
          ),
          const SizedBox(
            height: kRegularPadding,
          ),
          Text(
            e.amount,
            style: textTheme(context).bodyText1,
          ),
          const SizedBox(
            height: kMacroPadding,
          ),
          Row(
            children: const [
              CardBalance(
                text: "Withdraw",
                color: kCardInfoColor,
                color2: kTransparent,
              ),
              SizedBox(
                width: kRegularPadding,
              ),
              CardBalance(
                text: "Fund",
                color: kFlushBarColor,
                color2: kCardInfoColor,
              ),
            ],
          )
        ],
      ),
    );
  }
}

class CardBalance extends StatelessWidget {
  final String text;
  final Color color, color2;

  const CardBalance(
      {Key? key, required this.text, required this.color, required this.color2})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      height: 50,
      width: 125,
      decoration: BoxDecoration(
          border: Border.all(
            color: kCardInfoColor,
          ),
          borderRadius: BorderRadius.circular(kSmallPadding),
          color: color2),
      child: Text(
        text,
        style: textTheme(context).bodyText2!.copyWith(color: color),
      ),
    );
  }
}

class StackedWidgets extends StatefulWidget {
  List<Widget> items;
  double size;

  StackedWidgets(this.items, this.size);

  @override
  State<StackedWidgets> createState() => _StackedWidgetsState();
}

class _StackedWidgetsState extends State<StackedWidgets> {
  late final List<Widget> _all;
  late final List<Widget> allItems;

  @override
  void initState() {
    super.initState();
    _all = widget.items.reversed.toList();
    allItems = widget.items.reversed.toList();
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: allItems
          .mapIndexed(
            (index, Widget item) => Draggable(
              onDragEnd: (val) {
                setState(
                  () {
                    allItems.remove(item);
                    allItems.insert(0, item);

                  },
                );
              },
              childWhenDragging: RotationTransition(
                  turns: const AlwaysStoppedAnimation(170 / 360),
                  child: Container(
                    margin: const EdgeInsets.symmetric(
                        horizontal: 15, vertical: 25),
                    height: 200,
                    decoration: BoxDecoration(
                      color: kFlushBarColor.withOpacity(0.3),
                      borderRadius: BorderRadius.circular(kRegularPadding),
                    ),
                  )),
              feedback: Container(
                height: widget.size,
                decoration: BoxDecoration(
                  color: _all.indexOf(item) % 2 == 0
                      ? const Color(0XFFFFE57E)
                      : kFlushBarColor,
                  borderRadius: BorderRadius.circular(kRegularPadding),
                ),
                margin: EdgeInsets.only(
                    top: _all.indexOf(item) % 2 == 0 ? 20 : 40,
                    left: _all.indexOf(item) % 2 == 0 ? 30 : 10,
                    right: _all.indexOf(item) % 2 == 0 ? 30 : 10),
                child: item,
              ),
              child: Container(
                height: widget.size,
                decoration: BoxDecoration(
                  color: _all.indexOf(item) % 2 == 0
                      ? const Color(0XFFFFE57E)
                      : kFlushBarColor,
                  borderRadius: BorderRadius.circular(kRegularPadding),
                ),
                margin: EdgeInsets.only(
                    top: _all.indexOf(item) % 2 == 0 ? 20 : 40,
                    left: _all.indexOf(item) % 2 == 0 ? 30 : 10,
                    right: _all.indexOf(item) % 2 == 0 ? 30 : 10),
                child: item,
              ),
            ),
          )
          .toList(),
    );
  }
}
