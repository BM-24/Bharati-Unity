import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'texts.dart';
import 'last_page.dart';

class Result extends StatelessWidget {
  const Result({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        children: [
          Text(
            context.watch<Texts>().texts[7],
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
          Image.asset(
            'images/india.png',
            //height: 200,
            //width: 200,
          ),
          const SizedBox(
            height: 32,
          ),
          Text(
            context.watch<Texts>().texts[8],
            style: context.read<Texts>().isBharati
                ? const TextStyle(
                    fontSize: 30,
                    fontStyle: FontStyle.italic,
                    color: Colors.black54,
                    fontFamily: 'NavBharati',
                  )
                : const TextStyle(
                    fontSize: 30,
                    fontStyle: FontStyle.italic,
                    color: Colors.black54,
                  ),
          ),
          const SizedBox(
            height: 8,
          ),
          Align(
            alignment: Alignment.centerRight,
            child: Container(
              margin: const EdgeInsets.only(right: 16.0),
              child: Text(
                context.watch<Texts>().texts[9],
                style: context.read<Texts>().isBharati
                    ? const TextStyle(
                        fontSize: 36,
                        fontWeight: FontWeight.bold,
                        fontFamily: 'NavBharati',
                      )
                    : const TextStyle(
                        fontSize: 36,
                        fontWeight: FontWeight.bold,
                      ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
