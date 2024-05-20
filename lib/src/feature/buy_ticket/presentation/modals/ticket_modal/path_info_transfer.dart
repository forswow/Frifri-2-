import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class PathInfoTransfer extends StatelessWidget {
  const PathInfoTransfer({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.fromLTRB(20, 10, 20, 10),
      alignment: Alignment.center,
      width: double.infinity,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(6),
        color: const Color(0xFFF8F8F8),
      ),
      child: Stack(
        alignment: Alignment.center,
        children: <Widget>[
          const Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Text('Пересадка\nВ Стамбуле'),
                ],
              ),
              Text('3h 55m'),
            ],
          ),
          Positioned(
            child: SvgPicture.asset('assets/icons/walking.svg'),
          )
        ],
      ),
    );
  }
}
