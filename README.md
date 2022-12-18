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