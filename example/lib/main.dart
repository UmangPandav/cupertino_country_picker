import 'package:cupertino_country_picker/cupertino_country_picker.dart';
import 'package:cupertino_country_picker/helper/country_picker_helper.dart'
    show CountryPickerHelper;
import 'package:cupertino_country_picker/model/country_model.dart'
    show CountryModel;
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(brightness: Brightness.light),
      home: const HomePage(),
    );
  }
}

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  CountryModel? selectedCountry;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        centerTitle: true,
        automaticallyImplyLeading: false,
        title: const Text(
          'Country Picker Example',
          style: TextStyle(fontSize: 18),
        ),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            if (selectedCountry != null) ...[
              ClipRRect(
                borderRadius: BorderRadius.circular(10),
                child: Image.asset(
                  selectedCountry!.flag,
                  package: CountryPickerHelper.packageName,
                  height: 50,
                ),
              ),
              const SizedBox(height: 10),
              Text(
                'Selected Country: ${selectedCountry!.name}',
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                textAlign: TextAlign.center,
              ),
              Text(
                'Calling Code: ${selectedCountry!.callingCode}',
                textAlign: TextAlign.center,
              ),
              Text(
                'Country Code: ${selectedCountry!.countryCode}',
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 10),
            ],
            ElevatedButton(
              onPressed: toggleButton,
              style: ButtonStyle(
                backgroundColor: WidgetStatePropertyAll(Colors.blue),
                shape: WidgetStatePropertyAll(
                  RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),
              ),
              child: Text(
                'Open Country Picker',
                style: TextStyle(color: Colors.white),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Future<void> toggleButton() => showCupertinoCountryPicker(
    context: context,
    // allowedCountries: [
    //   CountryCodeEnum.in_,
    //   CountryCodeEnum.us,
    // ],
    onCountryPicked: (country) {
      setState(() {
        selectedCountry = country;
      });
    },
  );
}
