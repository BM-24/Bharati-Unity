import 'dart:async';

import 'package:bharati_unity/shared_pref.dart';
import 'package:bharati_unity/texts.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'splash_screen.dart';
import 'my_app_page.dart';

void main() {
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context) => Texts()),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        home: const MyApp(),
      ),
    ),
  );
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});
  final String keyIsFirstLoaded = 'is_first_loaded';

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  void getLanguage() async {
    final chosenLanguage = await SharedPref().read('language');
    context.read<Texts>().setLanguage(chosenLanguage);
  }

  @override
  void initState() {
    super.initState();
    getLanguage();
  }

  showDialogIfFirstLoaded(BuildContext context) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    bool? isFirstLoaded = prefs.getBool(widget.keyIsFirstLoaded);
    if (isFirstLoaded == null) {
      showDialog(
        context: context,
        barrierDismissible: false,
        builder: (BuildContext context) {
          // return object of type Dialog
          return AlertDialog(
            title: const Text("Language"),
            content: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                const Text("Please select the language of your choice."),
                DropdownButton<String>(
                  value: context.watch<Texts>().chosenLanguage.toString(),
                  icon: const Icon(Icons.arrow_downward),
                  iconSize: 24,
                  elevation: 16,
                  style: const TextStyle(color: Colors.deepPurple),
                  underline: Container(
                    height: 2,
                    color: Colors.deepPurpleAccent,
                  ),
                  onChanged: (String? newValue) {
                    context.read<Texts>().setLanguage(int.parse(newValue!));
                    SharedPref().save('language', int.parse(newValue));
                    // setState(() {
                    //   //
                    //   SharedPref().save('language', int.parse(newValue));
                    // });
                  },
                  items: context
                      .watch<Texts>()
                      .languages
                      .asMap()
                      .entries
                      .map<DropdownMenuItem<String>>(
                        (e) => DropdownMenuItem<String>(
                          value: e.key.toString(),
                          child: Container(
                            margin: EdgeInsets.all(8.0),
                            child: Text(e.value),
                          ),
                        ),
                      )
                      .toList(),
                ),
              ],
            ),
            actions: [
              // usually buttons at the bottom of the dialog
              TextButton(
                child: const Text("Ok"),
                onPressed: () {
                  // Close the dialog
                  Navigator.of(context).pop();
                  prefs.setBool(widget.keyIsFirstLoaded, false);

                  setState(() {});
                },
              ),
            ],
          );
        },
      );
    } else {
      Future.delayed(const Duration(seconds: 3)).then((val) {
        // Navigation Here
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(
            builder: (context) => MyAppPage(),
          ),
        );
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    Future.delayed(Duration.zero, () => showDialogIfFirstLoaded(context));

    // Future.delayed(const Duration(seconds: 3)).then((val) {
    //   // Navigation Here
    //   Navigator.pushReplacement(
    //     context,
    //     MaterialPageRoute(
    //       builder: (context) => MyAppPage(),
    //     ),
    //   );
    // });

    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const SplashScreen(),
    );
  }
}
