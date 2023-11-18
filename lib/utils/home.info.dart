import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:intl/intl.dart';

import './btm.nav.info.dart';

class Greeting {
  String text;
  IconData icons;
  Greeting({required this.text, required this.icons});
}

class HomeInfoUtil {
  // futureL: call api to get user avatar instead of hard-coded

  List<BtmNavInfo> buildBtmNavIcons(String avatarUrl, BuildContext context) {
    List<BtmNavInfo> btmNavIcons = [
      BtmNavInfo(
        icon: const Icon(Icons.home, size: 30.0),
        label: AppLocalizations.of(context)!.home,
      ),
      BtmNavInfo(
        icon: const Icon(Icons.collections_bookmark_outlined, size: 30.0),
        label: AppLocalizations.of(context)!.history,
      ),
      BtmNavInfo(
        icon: CircleAvatar(
          radius: 14.0,
          backgroundImage: NetworkImage(avatarUrl),
        ),
        label: AppLocalizations.of(context)!.personal,
      ),
    ];
    return btmNavIcons;
  }

  Greeting greetingByHour(int hour, String fullname, BuildContext context) {
    Greeting greeting = Greeting(
      text: "Welcome, $fullname",
      icons: Icons.block,
    );
    if (hour <= 12 && hour >= 5) {
      greeting.text = "${AppLocalizations.of(context)!.gMorning}, $fullname";
      greeting.icons = Icons.wb_sunny;
    } else if ((hour > 12) && (hour <= 17)) {
      greeting.text = "${AppLocalizations.of(context)!.gAfternoon}, $fullname";
      greeting.icons = Icons.wb_sunny;
    } else if ((hour > 17) && (hour < 23)) {
      greeting.text = "${AppLocalizations.of(context)!.gEvening}, $fullname";
      greeting.icons = Icons.nights_stay;
    } else {
      greeting.text = "${AppLocalizations.of(context)!.gNight}, $fullname";
      greeting.icons = Icons.nights_stay;
    }
    return greeting;
  }

  String formatDateTime(DateTime? datetime) {
    return DateFormat('EEEE, d MMM yyyy - HH:mm').format(datetime!);
  }

  int calculateStayedDays(DateTime? checkInDay, DateTime? checkOutDay) {
    return checkOutDay!.difference(checkInDay!).inDays;
  }
}
