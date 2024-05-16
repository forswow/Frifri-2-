import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:frifri/src/core/ui_kit/styles/styles.dart';
import 'package:frifri/src/feature/buy_ticket/presentation/modals/passengers_modal/widgets/counter_button.dart';

class Counter extends StatefulWidget {
  Counter({
    super.key,
    required this.titleText,
    required this.count,
    required this.onCountChange,
    required this.limit,
  });

  final int count;
  final String titleText;
  final Function(int newValue) onCountChange;
  final int limit;

  @override
  State<Counter> createState() => _CounterState();
}

class _CounterState extends State<Counter> {
  late int count;
  late final String titleText;
  late final Function(int newValue) onCountChange;
  late final int limit;

  @override
  void initState() {
    super.initState();
    count = widget.count;
    titleText = widget.titleText;
    onCountChange = widget.onCountChange;
    limit = widget.limit;
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        CounterTitle(titleText: titleText),
        Container(
          height: 60,
          margin: EdgeInsets.only(top: 16),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(12),
            border: Border.all(
              color: Color(0xffEDEDEE),
            ),
          ),
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                CounterButton(
                  child: SvgPicture.asset('assets/icons/search-minus-icon.svg'),
                  onPressed: () {
                    setState(() {
                      if (count == 0) return;
                      count--;
                      onCountChange(count);
                    });
                  },
                ),
                Text(
                  count.toString(),
                  style: AppStyles.textStylePoppins.copyWith(
                    fontWeight: FontWeight.w600,
                    fontSize: 20,
                    color: Color(0xff202020),
                  ),
                ),
                CounterButton(
                  child: SvgPicture.asset('assets/icons/search-plus-icon.svg'),
                  onPressed: () {
                    setState(
                      () {
                        if (count == limit) return;
                        count++;
                        onCountChange(count);
                      },
                    );
                  },
                ),
              ],
            ),
          ),
        )
      ],
    );
  }
}

class CounterTitle extends StatelessWidget {
  const CounterTitle({
    super.key,
    required this.titleText,
  });

  final String titleText;

  @override
  Widget build(BuildContext context) {
    return Text(
      titleText,
      style: AppStyles.textStylePoppins.copyWith(
        fontWeight: FontWeight.w700,
        fontSize: 16,
        color: Color(0xff202020),
      ),
    );
  }
}
