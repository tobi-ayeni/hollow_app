import 'package:hollow/app/modules/dashboard/widgets.dart';
import 'package:hollow/utils/asset_paths.dart';
import 'package:hollow/utils/constants.dart';
import 'package:hollow/utils/strings.dart';

List<BottomNavyBarItem> homeItems = [
  BottomNavyBarItem(
      icon: AssetPaths.moneySendIcon,
      activeColor: kHomeOrangeColor,
      text: sendMoney),
  BottomNavyBarItem(
      icon: AssetPaths.convertIcon, activeColor: kHomeBlueColor, text: convert),
  BottomNavyBarItem(
      icon: AssetPaths.moneyIcon,
      activeColor: kHomePurpleColor,
      text: airtimeData),
  BottomNavyBarItem(
      icon: AssetPaths.virtualIcon,
      activeColor: kHomePurpleColor200,
      text: virtualAcc),
  BottomNavyBarItem(
      icon: AssetPaths.ticketIcon,
      activeColor: kHomeOrangeColor200,
      text: ticketText),
  BottomNavyBarItem(
      icon: AssetPaths.circleIcon,
      activeColor: kHomeOrangeColor200,
      text: moreText),
];

List<String> walletTypes = ["Crypto Wallet", "Fiat Wallet"];

List<BottomNavyBarItem> fiatTypes = [
  BottomNavyBarItem(
      icon: AssetPaths.ngnIcon,
      activeColor: kHomeOrangeColor,
      text: nairaText),
  BottomNavyBarItem(
      icon: AssetPaths.ngnIcon,
      activeColor: kHomeOrangeColor,
      text: ghanaText),
  BottomNavyBarItem(
      icon: AssetPaths.ngnIcon,
      activeColor: kHomeOrangeColor,
      text: kesText),
  BottomNavyBarItem(
      icon: AssetPaths.ngnIcon,
      activeColor: kHomeOrangeColor,
      text: dollarText),
  BottomNavyBarItem(
      icon: AssetPaths.ngnIcon,
      activeColor: kHomeOrangeColor,
      text: gbpText),
  BottomNavyBarItem(
      icon: AssetPaths.ngnIcon,
      activeColor: kHomeOrangeColor,
      text: eurText),
];


List<WalletList> walletList = [
  WalletList(
    walletType: nairaText,
    amount: "₦ 4,295.03",
  ),
  WalletList(
    walletType: dollarText,
    amount: "\$ 4,295.03",
  ),
  WalletList(
    walletType: euroText,
    amount: "€ 4,295.03",
  ),
];

class WalletList{
  final String walletType, amount;
  WalletList({required this.walletType, required this.amount});
}
