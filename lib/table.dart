import 'package:flutter/material.dart';
import 'table_chars.dart';

class MyTable extends StatelessWidget {
  MyTable({super.key});
  ScrollController _scrollController = ScrollController();

  Widget buildCell(int num) {
    return Container(
      padding: const EdgeInsets.all(12.0),
      height: 100,
      width: 80,
      alignment: Alignment.center,
      decoration: BoxDecoration(
        border: Border.all(
          color: Colors.black,
          width: 1,
        ),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            TableChars().table[num ~/ 10][num % 10],
            style: TextStyle(
              fontSize: 24,
            ),
          ),
          const SizedBox(
            height: 8,
          ),
          Text(
            num < 10 ? '0$num' : '$num',
            style: const TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.bold,
            ),
          ),
        ],
      ),
    );
  }

  Widget buildColumn(int col) {
    return Column(
      children: List.generate(
        10,
        (int index) => buildCell(index * 10 + col),
      ),
    );
  }

  Widget biuldTable(int row) {
    return Scrollbar(
      controller: _scrollController,
      thickness: 5,
      thumbVisibility: true,
      trackVisibility: true,
      interactive: false,
      radius: const Radius.circular(5),
      scrollbarOrientation: ScrollbarOrientation.top,
      child: SingleChildScrollView(
        scrollDirection: Axis.horizontal,
        // physics: const BouncingScrollPhysics(),
        child: Row(
          children: List.generate(
            10,
            (int index) => buildColumn(index),
          ),
        ),
      ),
    );
  }

  int row = 10;
  int col = 10;

  @override
  Widget build(BuildContext context) {
    return biuldTable(row);
  }
}
