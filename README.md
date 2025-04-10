# 🌍 Cupertino Country Picker

A beautiful, customizable **iOS-style country picker** built with Flutter's Cupertino design system. Easily select countries with flags, calling codes, and search functionality. Perfect for apps that require region selection or phone number inputs.

<p align="center">
  <img src="demo.gif/" width="300"  alt=""/>
  <br />
  <sub><i>Loading preview... if it doesn't show, click <a href="https://github.com/UmangPandav/cupertino_country_picker/blob/master/demo.gif" target="_blank">here</a></i></sub>
</p>

---

## ✨ Features

✅ iOS-style modal bottom sheet picker  
✅ Search countries by name or calling code  
✅ Built-in country list with flags, codes, and calling codes  
✅ Easily retrieve countries using utility methods  
✅ Display flag images easily using `CountryHelper.packageName`

```dart
CountryHelper.getByCountryCode('IN');     // 🇮🇳 India
CountryHelper.getByName('Germany');       // 🇩🇪 Germany
CountryHelper.getByCallingCode('+44');    // 🇬🇧 United Kingdom
CountryHelper.getListByQuery('can');      // 🇨🇦 Canada, 🇨🇻 Cape Verde, etc.
```

---

## 🛠 Installation

Add the package in your `pubspec.yaml`:

```yaml
dependencies:
  cupertino_country_picker: ^1.0.0
```

Run:

```bash
flutter pub get
```

---

## 🚀 How to Use

### 1. Show the Country Picker

Call the `showCupertinoCountryPicker()` function anywhere in your app:

```dart
import 'package:cupertino_country_picker/cupertino_country_picker.dart';

ElevatedButton(
  onPressed: () {
    showCupertinoCountryPicker(
      context: context,
      onCountryPicked: (CountryModel country) {
        print('Selected Country: \${country.name}');
      },
    );
  },
  child: Text('Pick Country'),
);
```

### 🖼 Output:

A modal bottom sheet appears with a search bar, list of countries, flags, and calling codes.

---

## 🧠 Utility Methods

You can use `CountryHelper` to get country data programmatically.

### 🔹 Get by Country Code

```dart
final country = CountryHelper.getByCountryCode('US');
print(country?.name); // United States
```

### 🔹 Get by Country Name

```dart
final country = CountryHelper.getByName('Japan');
print(country?.callingCode); // +81
```

### 🔹 Get by Calling Code

```dart
final country = CountryHelper.getByCallingCode('+49');
print(country?.name); // Germany
```

### 🔹 Search Country by Query

```dart
final results = CountryHelper.getListByQuery('in');
results.forEach((country) => print(country.name));
```

---

## 💡 Example Use Case

```dart
String? _selectedCountry;

void _pickCountry(BuildContext context) {
  showCupertinoCountryPicker(
    context: context,
    onCountryPicked: (country) {
      setState(() {
        _selectedCountry = '\${country.flag} \${country.name} (\${country.callingCode})';
      });
    },
  );
}

@override
Widget build(BuildContext context) {
  return Column(
    children: [
      Text(_selectedCountry ?? 'No country selected'),
      ElevatedButton(
        onPressed: () => _pickCountry(context),
        child: Text('Pick Country'),
      )
    ],
  );
}
```

---

## 🖼 Displaying Flag Images

To display country flag images in your UI, you can use the `CountryHelper.packageName` with the `Image.asset()` widget:

```dart
final country = CountryHelper.getByCountryCode('IN');
if (country != null) {
  Image.asset(
    country.flag,
    package: CountryHelper.packageName,
    width: 32,
    height: 20,
  );
}
```

---

## 📚 Full Example

Check the [example](demo.gif/) directory for a working demo.

---

## 🧑‍💻 Contributing

Feel free to open issues or pull requests to improve this package.

---

## 📝 License

This project is licensed under the [MIT License](LICENSE) — free to use and distribute. No restrictions, just give credit.

