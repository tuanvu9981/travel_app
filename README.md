## travel_app

Travelling app, made by an amateur

## Reference
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