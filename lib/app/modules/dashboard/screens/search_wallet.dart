import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:hollow/app/helpers/helpers.dart';
import 'package:hollow/app/modules/components/buttons.dart';
import 'package:hollow/app/modules/dashboard/models/home_model.dart';
import 'package:hollow/app/modules/dashboard/widgets.dart';
import 'package:hollow/utils/asset_paths.dart';
import 'package:hollow/utils/constants.dart';
import 'package:hollow/utils/strings.dart';

class SearchWallet extends StatefulWidget {
  const SearchWallet({Key? key}) : super(key: key);

  @override
  State<SearchWallet> createState() => _SearchWalletState();
}

class _SearchWalletState extends State<SearchWallet> {
  BottomNavyBarItem? item;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        leading: inkWell(
          onPressed: () {
            Navigator.pop(context);
          },
          child: const Icon(
            Icons.arrow_back_outlined,
            color: kDeepGreyColor,
          ),
        ),
      ),
      body: Container(
        padding: const EdgeInsets.symmetric(horizontal: kMediumPadding),
        child: Column(
          children: [
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    createWalletText,
                    style: textTheme(context).headline1!.copyWith(
                          fontWeight: FontWeight.w700,
                          fontSize: 26,
                        ),
                  ),
                  const SizedBox(
                    height: kSmallPadding,
                  ),
                  Text(
                    createWalletTextSub,
                    style: textTheme(context).headline2,
                  ),
                  const SizedBox(
                    height: kMacroPadding,
                  ),
                  Text(
                    selectCountry,
                    style: textTheme(context)
                        .headline3!
                        .copyWith(color: kHintTextColor),
                  ),
                  const SizedBox(
                    height: kSmallPadding,
                  ),
                  const CountryOverlay(), // DropdownButtonFormField(
                ],
              ),
            ),
            ButtonWidget(
              onPressed: () {
                buildShowModalBottomSheet(context);
                // pushTo(context, SearchWallet());
              },
              buttonText: proceed,
              textColor: kPrimaryWhite,
              backGroundColor: kBlueDeepColor,
            ),
            const SizedBox(
              height: 20,
            ),
          ],
        ),
      ),
    );
  }
}

class CountryOverlay extends StatefulWidget {
  const CountryOverlay({
    Key? key,
  }) : super(key: key);

  @override
  State<CountryOverlay> createState() => _CountryOverlayState();
}

class _CountryOverlayState extends State<CountryOverlay> {
  final FocusNode _focusNode = FocusNode();
  TextEditingController controller = TextEditingController();

  OverlayEntry? _overlayEntry;

  @override
  void initState() {
    createOverlay();
  }

  createOverlay() {
    _focusNode.addListener(() {
      if (_focusNode.hasFocus) {
        _overlayEntry = _createOverlayEntry();
        Overlay.of(context)!.insert(_overlayEntry!);
      } else {
        _overlayEntry!.remove();
      }
    });
  }

  OverlayEntry _createOverlayEntry() {
    final RenderBox renderBox = context.findRenderObject() as RenderBox;
    var size = renderBox.size;
    var offset = renderBox.localToGlobal(Offset.zero);

    return OverlayEntry(
        builder: (context) => Positioned(
              left: offset.dx,
              top: offset.dy + size.height + 5.0,
              width: size.width,
              child: Material(
                elevation: 4.0,
                child: ListView(
                    padding: EdgeInsets.zero,
                    shrinkWrap: true,
                    children: fiatTypes
                        .map(
                          (e) => inkWell(
                            onPressed: () {
                              setState(() => controller.text = e.text!);
                              _overlayEntry!.remove();
                              // Future.delayed(Duration(seconds: 1)).then(
                              //     (value) =>
                              //         );
                            },
                            child: Padding(
                              padding: const EdgeInsets.all(kRegularPadding),
                              child: Row(
                                children: [
                                  SvgPicture.asset(e.icon),
                                  const SizedBox(width: kSmallPadding),
                                  Text(e.text!,
                                      style: textTheme(context).headline2),
                                ],
                              ),
                            ),
                          ),
                        )
                        .toList()),
              ),
            ));
  }

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      focusNode: _focusNode,
      controller: controller,
      onChanged: (val) {
        if (val.isEmpty) {
          _overlayEntry = _createOverlayEntry();
          Overlay.of(context)!.insert(_overlayEntry!);
        } else {
          _overlayEntry!.remove();
        }
      },
      decoration: InputDecoration(
        hintText: "Search item",
        hintStyle:
            textTheme(context).headline2!.copyWith(color: kHintTextColor),
        enabledBorder: const OutlineInputBorder(
          borderSide: BorderSide(color: kBorderColor),
          borderRadius: kBorderSmallRadius,
        ),
        focusedBorder: const OutlineInputBorder(
          borderSide: BorderSide(color: kColorGreen),
          borderRadius: kBorderSmallRadius,
        ),
      ),
    );
  }

}
