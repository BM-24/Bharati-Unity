import 'package:bharati_unity/shared_pref.dart';
import 'package:bharati_unity/texts.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'home_page.dart';
import 'last_page.dart';
import 'result.dart';

class MyAppPage extends StatefulWidget {
  MyAppPage({super.key});

  @override
  State<MyAppPage> createState() => _MyAppPageState();
}

class _MyAppPageState extends State<MyAppPage> {
  int _counter = 0;
  @override
  void initState() {
    super.initState();
    _counter = 0;
  }

  void increaseCounter() {
    setState(() {
      _counter++;
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: WillPopScope(
        onWillPop: () async {
          bool val = false;
          setState(() {
            if (_counter != 0) {
              _counter--;
            } else {
              val = true;
            }
          });
          return val;
        },
        child: Scaffold(
          appBar: AppBar(
            title: const Text('Hindi-Telugu-Bengali Unity'),
            backgroundColor: Colors.orange,
            automaticallyImplyLeading: false,
            centerTitle: true,
            leading: IconButton(
              onPressed: (() {
                showDialog(
                  context: context,
                  builder: (context) => AlertDialog(
                    title: const Text(
                      'About',
                    ),
                    content: const Text(
                      'Developed by :\nBiswadip Mandal.\n\nFor any queries, contact me at biswadipmandal2001@gmail.com',
                    ),
                    actions: [
                      TextButton(
                        onPressed: () {
                          Navigator.pop(context);
                        },
                        child: const Text(
                          'Ok',
                        ),
                      ),
                    ],
                  ),
                );
              }),
              icon: const Icon(Icons.info_outline),
            ),
            actions: [
              PopupMenuButton(
                onSelected: (value) {
                  context.read<Texts>().setLanguage(value);

                  // save chosen language to shared preferences
                  SharedPref().save('language', value);
                },
                itemBuilder: ((context) => context
                    .read<Texts>()
                    .languages
                    .map((e) => PopupMenuItem(
                          value: context.read<Texts>().languages.indexOf(e),
                          child: Text(
                            e,
                          ),
                        ))
                    .toList()),
              )
            ],
          ),
          body: CustomScrollView(
            slivers: [
              SliverFillRemaining(
                hasScrollBody: false,
                child: Container(
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      _counter == 0
                          ? const HomePage()
                          : _counter == 1
                              ? const Result()
                              : const LastPage(),
                      const Spacer(),
                      _counter != 2
                          ? Container(
                              margin: const EdgeInsets.all(16),
                              child: Align(
                                alignment: Alignment.center,
                                child: ElevatedButton(
                                  style: ElevatedButton.styleFrom(
                                    minimumSize: const Size.fromHeight(50),
                                    primary: Colors.green,
                                    shape: const RoundedRectangleBorder(
                                      borderRadius: BorderRadius.all(
                                        Radius.circular(10),
                                      ),
                                    ),
                                  ),
                                  onPressed: () {
                                    increaseCounter();
                                  },
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Text(
                                        context.watch<Texts>().texts[6],
                                        style: const TextStyle(
                                          fontSize: 24,
                                        ),
                                      ),
                                      // Icon(Icons.candlestick_chart)
                                      // using click_icon.png
                                      Image.asset(
                                        'images/hand_click_icon.png',
                                        height: 30,
                                        width: 30,
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            )
                          : Container(
                              margin: const EdgeInsets.all(16.0),
                              child: const Text(
                                'This app has been built as a part of NSS work of IITM, and is kept for free public usage.',
                                textAlign: TextAlign.center,
                              ),
                            ),
                    ],
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
