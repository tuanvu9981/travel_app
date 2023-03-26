## travel_app

Travelling app, made by an amateur

### Demo

<p align="center">
    <img src="travel_app_short.gif" height="50%" width="50%"/>
<p>

[Demo full app's function](https://firebasestorage.googleapis.com/v0/b/fir-getx-flutter-bd7d8.appspot.com/o/demo_app.gif?alt=media&token=91f1a54d-14a8-42d7-a192-a55de253694f)

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

8. Api & Rebuild completed before initState() finished.
- Solution: [Solution URL](https://stackoverflow.com/questions/56395081/unhandled-exception-inheritfromwidgetofexacttype-localizationsscope-or-inheri)
```
@override
void initState() {
    super.initState();
    Future.delayed(Duration.zero, _fetchData);
}
```

9. Call API
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

10. After Navigator.pop(), how to refresh the previous page
- Solution: [Refresh after back to previous page](https://stackoverflow.com/questions/58951312/flutter-how-to-refresh-the-last-page-state-on-navigator-pop)