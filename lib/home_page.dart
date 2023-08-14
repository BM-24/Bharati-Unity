import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'table.dart';
import 'texts.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            context.watch<Texts>().texts[1],
            style: const TextStyle(
              fontSize: 20,
            ),
          ),
          Text(
            context.watch<Texts>().texts[2],
            style: const TextStyle(
              fontSize: 20,
            ),
          ),
          Text(
            context.watch<Texts>().texts[3],
            style: const TextStyle(
              fontSize: 20,
            ),
          ),
          Text(
            context.watch<Texts>().texts[4],
            style: const TextStyle(
              fontSize: 20,
            ),
          ),
          Text(
            context.watch<Texts>().texts[5],
            style: const TextStyle(
              fontSize: 20,
            ),
          ),
          const SizedBox(
            height: 20,
          ),
          MyTable(),
        ],
      ),
    );
  }
}
