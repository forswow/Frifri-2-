import 'package:flutter/material.dart';
import 'package:frifri/src/core/ui_kit/styles/styles.dart';
import 'package:frifri/src/feature/search/presentation/modals/passengers_modal/widgets/counter_button.dart';

class CounterWidget extends StatefulWidget {
  CounterWidget(
      {super.key,
      required this.titleText,
      required this.count,
      required this.onCountChange,
      required this.limit});
  final String titleText;
  int count;
  final onCountChange;
  final int limit;

  @override
  State<CounterWidget> createState() => _CounterWidgetState();
}

class _CounterWidgetState extends State<CounterWidget> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Text(widget.titleText,
              style: AppStyles.textStylePoppins.copyWith(
                  fontWeight: FontWeight.w700,
                  fontSize: 16,
                  color: Color(0xff202020))),
          Container(
            height: 60,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(12),
                border: Border.all(color: Color(0xffEDEDEE))),
            margin: EdgeInsets.only(top: 16),
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    CounterButton(
                      symbol: 'minus',
                      callback: () {
                        setState(() {
                          if (widget.count == 0) return;

                          widget.count--;
                          widget.onCountChange(widget.count);
                        });
                      },
                    ),
                    Text(widget.count.toString(),
                        style: AppStyles.textStylePoppins.copyWith(
                            fontWeight: FontWeight.w600,
                            fontSize: 20,
                            color: Color(0xff202020))),
                    CounterButton(
                      symbol: 'plus',
                      callback: () {
                        setState(() {
                          if (widget.count == widget.limit) return;
                          widget.count++;
                          widget.onCountChange(widget.count);
                        });
                      },
                    ),
                  ]),
            ),
          )
        ],
      ),
    );
  }
}
