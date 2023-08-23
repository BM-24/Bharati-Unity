import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';

import 'package:url_launcher/url_launcher.dart';

import 'package:provider/provider.dart';
import 'texts.dart';

class LastPage extends StatelessWidget {
  const LastPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      margin: const EdgeInsets.only(top: 64, left: 16, right: 16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisSize: MainAxisSize.max,
        children: [
          Text(
            context.watch<Texts>().texts[10],
            style: context.read<Texts>().isBharati
                ? const TextStyle(
                    fontSize: 36,
                    fontFamily: 'NavBharati',
                  )
                : const TextStyle(
                    fontSize: 36,
                  ),
          ),
          const SizedBox(
            height: 32,
          ),
          RichText(
            textAlign: TextAlign.center,
            text: TextSpan(
              children: [
                TextSpan(
                  text: 'nptel.ac.in',
                  style: const TextStyle(
                      color: Colors.blue,
                      decoration: TextDecoration.underline,
                      fontSize: 24),
                  recognizer: TapGestureRecognizer()
                    ..onTap = () {
                      launchUrl(Uri.parse('https://nptel.ac.in'));
                    },
                ),
                TextSpan(
                  text: context.watch<Texts>().texts[11],
                  style: context.read<Texts>().isBharati
                      ? const TextStyle(
                          fontSize: 24,
                          color: Colors.grey,
                          fontFamily: 'NavBharati',
                        )
                      : const TextStyle(
                          fontSize: 24,
                          color: Colors.grey,
                        ),
                ),
              ],
            ),
          ),
          const SizedBox(
            height: 8,
          ),
          RichText(
            textAlign: TextAlign.center,
            text: TextSpan(
              children: [
                TextSpan(
                  text: 'vigyanprasar.gov.in',
                  style: const TextStyle(
                      color: Colors.blue,
                      decoration: TextDecoration.underline,
                      fontSize: 24),
                  recognizer: TapGestureRecognizer()
                    ..onTap = () {
                      launchUrl(Uri.parse('https://vigyanprasar.gov.in'));
                    },
                ),
                TextSpan(
                  text: context.watch<Texts>().texts[12],
                  style: context.read<Texts>().isBharati
                      ? const TextStyle(
                          fontSize: 24,
                          color: Colors.grey,
                          fontFamily: 'NavBharati',
                        )
                      : const TextStyle(
                          fontSize: 24,
                          color: Colors.grey,
                        ),
                ),
              ],
            ),
          ),
          const SizedBox(
            height: 8,
          ),
          RichText(
            textAlign: TextAlign.center,
            text: TextSpan(
              children: [
                TextSpan(
                  text: 'bharatiscript.com',
                  style: const TextStyle(
                      color: Colors.blue,
                      decoration: TextDecoration.underline,
                      fontSize: 24),
                  recognizer: TapGestureRecognizer()
                    ..onTap = () {
                      launchUrl(Uri.parse('https://bharatiscript.com'));
                    },
                ),
                TextSpan(
                  text: context.watch<Texts>().texts[13],
                  style: context.read<Texts>().isBharati
                      ? const TextStyle(
                          fontSize: 24,
                          color: Colors.grey,
                          fontFamily: 'NavBharati',
                        )
                      : const TextStyle(
                          fontSize: 24,
                          color: Colors.grey,
                        ),
                ),
              ],
            ),
          ),
          const SizedBox(
            height: 8,
          ),
          RichText(
              textAlign: TextAlign.center,
              text: TextSpan(
                children: [
                  TextSpan(
                    text: 'arvindguptatoys.com',
                    style: const TextStyle(
                        color: Colors.blue,
                        decoration: TextDecoration.underline,
                        fontSize: 24),
                    recognizer: TapGestureRecognizer()
                      ..onTap = () {
                        launchUrl(Uri.parse('https://arvindguptatoys.com'));
                      },
                  ),
                  TextSpan(
                    text: context.watch<Texts>().texts[14],
                    style: context.read<Texts>().isBharati
                        ? const TextStyle(
                            fontSize: 24,
                            color: Colors.grey,
                            fontFamily: 'NavBharati',
                          )
                        : const TextStyle(
                            fontSize: 24,
                            color: Colors.grey,
                          ),
                  ),
                ],
              )),
          const SizedBox(
            height: 8,
          ),
        ],
      ),
    );
  }
}
