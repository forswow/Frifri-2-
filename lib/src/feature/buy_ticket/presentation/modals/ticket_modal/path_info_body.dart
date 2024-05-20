import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:frifri/src/core/ui_kit/styles/styles.dart';

class PathInfoBody extends StatelessWidget {
  const PathInfoBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(crossAxisAlignment: CrossAxisAlignment.start, children: <Widget>[
      Column(
        children: <Widget>[
          SvgPicture.asset(
            'assets/icons/circle-icon.svg',
            width: 18,
          ),
          Container(
            width: 2,
            height: 50,
            color: const Color(0xFFE4E9F3),
          ),
          SvgPicture.asset(
            'assets/icons/circle-icon.svg',
            width: 18,
          )
        ],
      ),
      const SizedBox(
        width: 16,
      ),
      Column(
        children: <Widget>[
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Text('21:35',
                  style: AppStyles.textStylePoppins
                      .copyWith(fontWeight: FontWeight.w600)),
              Text('30ap wen',
                  style: AppStyles.textStylePoppins
                      .copyWith(color: Colors.black45, fontSize: 12)),
            ],
          ),
          const SizedBox(
            height: 16,
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Text('21:35',
                  style: AppStyles.textStylePoppins
                      .copyWith(fontWeight: FontWeight.w600)),
              Text('30ap wen',
                  style: AppStyles.textStylePoppins
                      .copyWith(color: Colors.black45, fontSize: 12)),
            ],
          )
        ],
      ),
      const SizedBox(
        width: 16,
      ),
      Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Text('Батуми',
                  style: AppStyles.textStylePoppins
                      .copyWith(fontWeight: FontWeight.w600)),
              Text('Александр Картвели, BUS',
                  style: AppStyles.textStylePoppins
                      .copyWith(color: Colors.black45, fontSize: 12)),
            ],
          ),
          const SizedBox(
            height: 16,
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Text('Батуми',
                  style: AppStyles.textStylePoppins
                      .copyWith(fontWeight: FontWeight.w600)),
              Text('Александр Картвели, BUS',
                  style: AppStyles.textStylePoppins
                      .copyWith(color: Colors.black45, fontSize: 12)),
            ],
          ),
        ],
      ),
    ]);
  }
}
