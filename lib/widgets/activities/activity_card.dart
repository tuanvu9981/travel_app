import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:travel_app/apis/auth.api.dart';
import 'package:travel_app/models/activity.model.dart';

class ActivityCard extends ConsumerWidget {
  final Activity activity;
  const ActivityCard({super.key, required this.activity});

  Widget buildInfoBox(String text, Color? bgColor, Color? textColor) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(5.0),
        color: bgColor ?? const Color.fromARGB(255, 212, 239, 252),
      ),
      padding: const EdgeInsets.all(3.5),
      margin: const EdgeInsets.only(right: 4.0, top: 4.0),
      child: Text(
        text,
        style: TextStyle(
          fontFamily: 'VNPro',
          fontSize: 12.5,
          fontWeight: FontWeight.w600,
          color: textColor ?? const Color.fromARGB(255, 106, 200, 243),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final userLocale = ref.watch(userProvider)!.systemLanguage;
    final mapLocale = ref.watch(mapLocaleProvider);
    return Stack(
      children: [
        Container(
          margin: const EdgeInsets.fromLTRB(20.0, 5.0, 20.0, 5.0),
          height: 190.0,
          width: double.infinity, // ?????
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(10.0),
            boxShadow: const [
              BoxShadow(
                color: Colors.black26,
                offset: Offset(0.0, 2.0),
                blurRadius: 6.0,
              ),
            ],
          ),

          child: Padding(
            padding: const EdgeInsets.fromLTRB(130.0, 20.0, 20.0, 20.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(
                      width: 200.0,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            activity.name!.get(userLocale) ?? "",
                            style: const TextStyle(
                              fontSize: 16.0,
                              fontWeight: FontWeight.w600,
                              fontFamily: 'VNPro',
                            ),
                            maxLines: 2,
                            overflow: TextOverflow.ellipsis,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                activity.price!.get(userLocale) ?? "",
                                style: const TextStyle(
                                  fontSize: 12.5,
                                  fontWeight: FontWeight.w600,
                                  color: Colors.greenAccent,
                                  fontFamily: 'VNPro',
                                ),
                              ),
                              Container(
                                width: 60.0,
                                padding: const EdgeInsets.all(2.5),
                                alignment: Alignment.topLeft,
                                child: Text(
                                  "${activity.rating} ⭐",
                                  style: const TextStyle(
                                    fontSize: 13.5,
                                    fontFamily: 'VNPro',
                                    fontWeight: FontWeight.w600,
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 5.0),
                Wrap(
                  children: activity.type!
                      .map<Widget>(
                        (e) =>
                            buildInfoBox(mapLocale[userLocale][e], null, null),
                      )
                      .toList(),
                ),
                const SizedBox(height: 12.5),
                buildInfoBox(
                  "${AppLocalizations.of(context)!.businessTime}: ${activity.businessTime}",
                  Colors.transparent,
                  Colors.greenAccent,
                )
              ],
            ),
          ),
        ),
        Positioned(
          left: 30.0,
          top: 20.0,
          // only left, top: the image still not cover. add both top & bottom
          bottom: 20.0,
          child: ClipRRect(
            borderRadius: BorderRadius.circular(10.0),
            child: Image(
              width: 110.0,
              image: NetworkImage(activity.imageUrl ?? ""),
              fit: BoxFit.cover,
            ),
          ),
        ),
      ],
    );
  }
}
