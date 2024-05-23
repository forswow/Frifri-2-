import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class SkeletonInitial extends StatefulWidget {
  const SkeletonInitial({super.key});

  @override
  State<SkeletonInitial> createState() => _SkeletonInitialState();
}

class _SkeletonInitialState extends State<SkeletonInitial> {
  @override
  Widget build(BuildContext context) {
    final screenHeight = MediaQuery.sizeOf(context).height;
    final screenWidth = MediaQuery.sizeOf(context).width;
    return Container(
      padding: const EdgeInsets.all(5),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(16),
        color: Colors.white,
      ),
      margin: const EdgeInsets.all(20),
      height: screenHeight * 0.15,
      width: screenWidth,
      child: const Column(
        children: [
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    Icon(
                      Icons.add,
                      size: 40,
                    ),
                    SizedBox(width: 10),
                    Text(
                      '0000000000',
                      style: TextStyle(fontSize: 20),
                    ),
                    Spacer(),
                    Text('000000000')
                  ],
                ),
                Spacer(),
                Expanded(
                  child: Row(
                    children: [
                      Text(
                        '0000000000000000000',
                      ),
                      SizedBox(width: 20),
                      Text('00000000')
                    ],
                  ),
                ),
              ],
            ),
          ),
          Spacer(),
          Expanded(
            child: Row(
              children: [
                Text('0000000'),
                SizedBox(width: 40),
                Text('0000000'),
                SizedBox(width: 20),
                Text('00000000')
              ],
            ),
          ),
        ],
      ),
    );
  }
}
