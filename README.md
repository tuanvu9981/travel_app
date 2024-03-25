## travel_app

Travelling app, made by an amateur

### Demo 
For full functions' demo, watch [here](https://firebasestorage.googleapis.com/v0/b/fir-getx-flutter-bd7d8.appspot.com/o/demo_app.gif?alt=media&token=91f1a54d-14a8-42d7-a192-a55de253694f)

<p align="center">
    <img src="travel_app_short.gif" height="500" width="250"/>
<p>

### Reference
1. Github: [Travel App github URL](https://github.com/MarcusNg/flutter_travel_ui)
2. Youtube: [Travel App youtube URL](https://www.youtube.com/watch?v=CSa6Ocyog4U&list=PL7BCz8m1M7-tsEB45bZZ3tEjcxk2OqWKa&index=25&t=2657s)

### Format code Dart Flutter
1. Elements in brackets (), {} must be separated by **comma** (,). Auto-format will works very well
```
Object(
    attribute1, 
    attribute2, 
    attribute3, 
);
```

2. Optional Constructors
    - Contain {}
        ```
        Object({
            attribute1, 
            attribute2, 
            attribute3, 
        });
        ```
    - The attributes must belong to type with **?**, like **String?**, **int?**, **double?**
    - If attributes dont belong to type with **?**, the optional constructors need keyword **required** before attributes.
        ```
        Object({
            required attribute1, 
            required attribute2, 
            required attribute3, 
        });
        ```

### Git involving: 
1. Undo **git add .**, using **git reset**
2. Check again using **git status**

### Dart & Flutter involving 
1. **package:font_awesome_flutter/font_awesome_flutter.dart** is not sound null-safety. Use this instead:
```
travel_app $ flutter run --no-sound-null-safety
```

2. **When text overflows**
```
Row(
    mainAxisAlignment: MainAxisAlignment.spaceBetween,
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
        Text(
            activity.name ?? "",
            style: const TextStyle(
                fontSize: 18.0,
                fontWeight: FontWeight.w600,
            ),
        ),
        Text('\$${activity.price}'),
    ],
),
```
- When add ```Padding``` with ```left = 100.0```, ```Text('\$${activity.price}')``` will be overflowed when displayed. 
- Solution: Wrap first **Text** in a **Container** with width = 120, so the second **Text** will have its own enough space to display.
- The code became:
```
Row(
    mainAxisAlignment: MainAxisAlignment.spaceBetween,
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
        Container(
            width: 120.0,
            child: Text(
                activity.name ?? "",
                style: const TextStyle(
                    fontSize: 18.0,
                    fontWeight: FontWeight.w600,
                ),
            ),
        ),
        Text('\$${activity.price}'),
    ],
),
```

3. **Noted when coding**
- Between big image and list view should not render a SizedBox !!!

4. **Carousel and examples**
- Reference: [Carousel from pub](https://pub.dev/packages/carousel_slider/example)
- In order to get animation such as CGV app, adjust CarouselOption as below:
```
options: CarouselOptions(
    aspectRatio: 1.25,
    enlargeCenterPage: true,
    autoPlay: false,
    viewportFraction: 0.65,
    enableInfiniteScroll: true,
),
```

5. **Commands**
- Run without null pointer check, check [this](https://dart.dev/null-safety/unsound-null-safety)
```
$ flutter run --no-sound-null-safety
```

6. **With GridView**
- Cannot adjust **height** or **width** of **Container** inside widget **GridView**
- Using **childAspectRatio** instead:
```
GridView.builder(
    padding: _paddingGrid,
    itemCount: foodList?.length,
    gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        childAspectRatio: 0.75,
    )
);    
```

7. **Naming Convention**
- Constant: lowercase camelcase 
```
final accessToken = 'accessToken';
```

8. **Api & Rebuild completed before initState() finished.**
- Solution: [Solution URL](https://stackoverflow.com/questions/56395081/unhandled-exception-inheritfromwidgetofexacttype-localizationsscope-or-inheri)
```
@override
void initState() {
    super.initState();
    Future.delayed(Duration.zero, _fetchData);
}
```

9. **Call API**
- With assumption: 
```
static Map<String, String> headers = {
    "Content-type": "application/json",
    "Accept": "application/json",
};
```
- Your request's body must be the form of stringified JSON. That's why we need to use
**body: JsonEncode(History.toJson())**
- Solution: [Solution source](https://stackoverflow.com/questions/54849725/bad-state-cannot-set-the-body-fields-of-a-request-with-content-type-applicatio)

10. **After Navigator.pop(), how to refresh the previous page**
- Solution: [Refresh after back to previous page](https://stackoverflow.com/questions/58951312/flutter-how-to-refresh-the-last-page-state-on-navigator-pop)

11. **Round doubles**
- **double_number**.toStringAsFixed(2); // rounding to 2 digit after dot (.)

12. **Change flash screen icon**
- [Change Flash Screen Icon Instruction Video](https://www.youtube.com/watch?v=JVpFNfnuOZM&list=LL&index=13&t=195s)

13. **Change Flutter default lauch icon**
- [Change Flutter default lauch icon Instruction Video](https://www.youtube.com/watch?v=1VGlLjBxYQ4)

14. **Internationalization**
- **Problem**: Before, i installed **i18n** already to use DateFormat & render UI with appropriate form. But **flutter pub add flutter_localizations --sdk=flutter** has some conflicts with **i18n** version.
- **Solution**: Remove **i18n** before, then install step by step the 2 following commands:
```
flutter pub add flutter_localizations --sdk=flutter
flutter pub add intl:any
``` 
- The **pubspec.yaml** will look like this:
```
dependencies:
  flutter:
    sdk: flutter
  flutter_localizations:
    sdk: flutter
  intl: any
```

- Overriding **Locale(lang_code)** will affect to Widget involving with a specific language, such as **CalenderPicker**, like this:
```
children: <Widget>[
    Localizations.override(
        context: context,
        locale: const Locale('vi'),
        child: Builder(
            builder: (context) {
                return CalendarDatePicker(
                    initialDate: DateTime.now(),
                    firstDate: DateTime(1900),
                    lastDate: DateTime(2100),
                    onDateChanged: (value) {},
                );
            },
        ),
    ),
],
```

- Add below command to generate new language file 
```
flutter:
  uses-material-design: true
  generate: true

  assets:
    - assets/images/
    - assets/logos/
```

- Create **l10n.yaml** has the same level as **lib** folder.
```
arb-dir: lib/l10n
template-arb-file: app_en.arb
output-localization-file: app_localizations.dart
```

- Create **l10n** folder inside **lib** folder, add the **app_<lang_code>.arb** files corresponding to the languages you'll use.

- Download **i18n arb editor** extensions from VSCode to modify these arb files. These file using the same keyword, but different value corresponding to each language.

- Run **flutter gen-l10n**, and **DONT REMOVE l10n.yaml** file. Then, import **import 'package:flutter_gen/gen_l10n/app_localizations.dart'** into dart files which you will implement multi-languages. If you cant import, restart VSCode.
```
import 'package:flutter_gen/gen_l10n/app_localizations.dart'
...

return Column(
  children: <Widget>[
    Text(AppLocalizations.of(context)!.hello),
  ],
);
```

- If **app_en.arb** and **app_vi.arb** like this, Widget will render the language you set up in **main.dart** with **locale: Locale('vi')** ... 
```
{
    "hello": "Hello"
},
{
    "hello": "Xin chao"
}
```

15. **Internationalization with Placeholder**

- When a same **key** has multiple values in one languages, we need to use **placeholder**, especially with languages has plural forms, or change the form of the word corressponding with the gender of the subject.

- English arb file
```
{
    "@languageName": {
        "placeholders": {
            "langCode": {
                "type": "String"
            }
        }
    },
    "languageName": "{langCode, select, vi{Vietnamese} ja{Japanese} en{English} other{Unknown}}",
}
```

- If we want to show different string value, just give the languageName function different key 
```
Text(AppLocalizations.of(context)!.languageName('vi'))
Text(AppLocalizations.of(context)!.languageName('en'))
Text(AppLocalizations.of(context)!.languageName('ja'))
```

16. **Gradle version is incompatible with Java version**
- **Solution**: Current Java version is 19.0, so the compatible Gradle version is 7.6. You need to upgrade Gradle version
- Go to **android/gradle/wrapper**, modify gradle version from **7.4** to **7.6** in **gradle-wrapper.properties** file.

17. **Change language**
- Add a new function to search current MainAppState instance (here is TravelAppState)
```
class TravelApp extends ConsumerStatefulWidget {
  const TravelApp({Key? key}) : super(key: key);

  static void setLocale(BuildContext context, Locale newLocale) {
    TravelAppState? state = context.findAncestorStateOfType<TravelAppState>();
    state?.updateLocale(newLocale);
  }

  @override
  TravelAppState createState() => TravelAppState();
}
```

- Then, in another class, if you want to update new Locale, call TravelApp's static function to get current TravelAppState instance, then update Locale, or you'll get an error: "TravelAppState() is not initialized or not existed in Widget Tree"
```
onPressed: () {
    newUser.state!.systemLanguage = _currentLanguage;
    updateGeneral(newUser.state!, context);
    TravelApp.setLocale(context, Locale(_currentLanguage!));
},
```

### Automatically adding "const" and fix (Reference: [here](https://medium.com/@omershafique/say-goodbye-to-manual-const-typing-with-auto-const-in-flutter-eb2c904cc5a6))
1. Open the command palette in VS-Code (**CMD+SHF+P**) or (**CTRL+SHF+P**)
2. Search **Open User Settings**
3. Click on **Open Settings Json Icon**
4. Paste the following commands in **JSON** file
```
"editor.codeActionsOnSave": [
    "source.organizeImports",
    "source.fixAll"
],
```
5. Now whenever you press **CMD+S** (Macbook) or **CTRL+S** it will automatically add **const** keywords wherever it is required. (applied only for dart !!)

6. Install Firebase 
- Error: command not found
```
tuanvu81@host81:~/flutter/travel_app$ flutterfire configure --project=travel-app-f9548
flutterfire: command not found
```
- How to fix: 
```
tuanvu81@host81:~/flutter/travel_app$ 
export PATH="$PATH":"$HOME/.pub-cache/bin"
```

7. Add Firebase to **main.dart** file activating functions (**WidgetsFlutterBinding.ensureInitialized() is necessary**)
```
Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(const ProviderScope(child: TravelApp()));
}
```

8. DocumentSnapshot object is immutable.
- These 2 assign command below are NOT WORKING !
```
docSnapshot.data()["activities"] = activities;
docSnapshot.data()["hotels"] = hotels;
```
- Instead of that, create a copy of snapshot document and assign
```
var processedDocSnapshot = docSnapshot.data();
processedDocSnapshot["activities"] = activities;
processedDocSnapshot["hotels"] = hotels;
```

9. Manage Authentication
- Reference: https://firebase.google.com/docs/auth/flutter/manage-users
- Get Auth Instance:
```
FirebaseAuth auth = FirebaseAuth.instance;
```

10. Manage data access
- Reference: https://firebase.google.com/docs/firestore/security/get-started

11. For Map type
- Error: 
```
var localeMap = <String, dynamic>{};
localeMap[lang]![key] = value;
```

- Solution: 
```
var localeMap = <String, dynamic>{};
localeMap[lang] = <String, String>{};
localeMap[lang]![key] = value;
```

12. Load data from file and using json, 
```
rootBundle.loadString("lib/l10n/$fileName").then((file) { ...
```
- This command using **AssetBundle** widget to load file, so remember to declare assets file path in **pubspec.yaml**
```
assets:
    - assets/images/
    - assets/logos/
    - lib/l10n/
```