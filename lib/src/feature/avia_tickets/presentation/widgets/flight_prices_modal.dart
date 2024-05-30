import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:frifri/src/core/ui_kit/modals/default_modal.dart';
import 'package:frifri/src/core/ui_kit/styles/styles.dart';

class FlightPricesModal extends StatelessWidget {
  const FlightPricesModal({
    super.key,
    required this.originAirportName,
    required this.destinationAirportName,
  });

  final String originAirportName;
  final String destinationAirportName;

  @override
  Widget build(BuildContext context) {
    return DefaultModalWrapper(
      child: Column(
        children: [
          FlightPricesModalHeader(
            destinationAirportName: destinationAirportName,
            originAirportName: originAirportName,
          ),
          const Divider(
            height: 1,
            thickness: 0.5,
          ),
          const FlightPricesModalContent(),
        ],
      ),
    );
  }
}

class FlightPricesModalHeader extends StatelessWidget {
  const FlightPricesModalHeader({
    super.key,
    required this.originAirportName,
    required this.destinationAirportName,
  });

  final String originAirportName;
  final String destinationAirportName;

  static const _headerTextScaleFactor = 0.27;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(
        horizontal: 26,
        vertical: 17.6,
      ),
      child: Stack(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SizedBox(
                width:
                    MediaQuery.sizeOf(context).width * _headerTextScaleFactor,
                child: FittedBox(
                  fit: BoxFit.scaleDown,
                  child: Text(
                    originAirportName,
                    style: AppStyles.textStylePoppins.copyWith(
                      color: Colors.black,
                      fontWeight: FontWeight.w600,
                      fontSize: 12,
                    ),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(
                  horizontal: 20,
                ),
                child: SvgPicture.asset(
                  "assets/icons/searchfly-airplane.svg",
                ),
              ),
              SizedBox(
                width:
                    MediaQuery.sizeOf(context).width * _headerTextScaleFactor,
                child: FittedBox(
                  fit: BoxFit.scaleDown,
                  child: Text(
                    destinationAirportName,
                    style: AppStyles.textStylePoppins.copyWith(
                      color: Colors.black,
                      fontWeight: FontWeight.w600,
                      fontSize: 12,
                    ),
                  ),
                ),
              ),
            ],
          ),
          Align(
            alignment: Alignment.centerRight,
            child: SvgPicture.asset("assets/icons/close.svg"),
          ),
        ],
      ),
    );
  }
}

class FlightPricesModalContent extends StatefulWidget {
  const FlightPricesModalContent({super.key});

  @override
  State<FlightPricesModalContent> createState() =>
      _FlightPricesModalContentState();
}

class _FlightPricesModalContentState extends State<FlightPricesModalContent> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(14),
      child: Table(
        columnWidths: const {
          0: FlexColumnWidth(), // Тут можно регулировать размеры столбцов
          1: FlexColumnWidth(),
          2: FlexColumnWidth(),
        },
        children: [
          // Заголовок таблицы
          TableRow(
            children: [
              Text(
                "Когда",
                style: AppStyles.textStylePoppins.copyWith(
                  color: Colors.grey,
                  fontSize: 12,
                ),
              ),
              Text(
                "Обратно",
                style: AppStyles.textStylePoppins.copyWith(
                  color: Colors.grey,
                  fontSize: 12,
                ),
              ),
              Text(
                "Цена",
                textAlign: TextAlign.end,
                style: AppStyles.textStylePoppins.copyWith(
                  color: Colors.grey,
                  fontSize: 12,
                ),
              ),
            ],
          ),
          // -------------------------------------
          // Тут формировать строки с результатами
          // с помощью FutureBuilder / BlocBuilder
          // -------------------------------------
        ],
      ),
    );
  }
}
