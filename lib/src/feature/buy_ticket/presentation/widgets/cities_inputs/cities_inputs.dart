import 'package:flutter/material.dart';
import 'package:frifri/src/feature/buy_ticket/presentation/screens/search_ticket_form_screen.dart';
import 'package:frifri/src/feature/buy_ticket/presentation/widgets/cities_inputs/cities_input_widget.dart';
import 'package:go_router/go_router.dart';

class CitiesInputs extends StatefulWidget {
  const CitiesInputs(
      {super.key, required this.citiesNames, required this.searchModel});

  final SearchModel searchModel;

  final Map<String, String> citiesNames;

  @override
  State<CitiesInputs> createState() => _CitiesInputsState();
}

class _CitiesInputsState extends State<CitiesInputs> {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(15),
      ),
      child: Column(
        children: <Widget>[
          CitiesInput(
              cityName: widget.citiesNames['flyFrom'] ?? "Укажите город",
              callback: () {
                setState(
                  () {
                    context.pop();
                    // var temp = widget.citiesNames['flyFrom'];
                    // widget.citiesNames['flyFrom'] =
                    //     widget.citiesNames['flyTo']!;
                    // widget.citiesNames['flyTo'] = temp!;
                  },
                );
              },
              iconPath: 'assets/icons/arrow-up-down.svg'),
          const Divider(
            color: Colors.grey,
            thickness: 0.5,
            indent: 20,
          ),
          CitiesInput(
              cityName: widget.citiesNames['flyTo'] ?? "Укажите город",
              callback: () {
                setState(
                  () {
                    context.pop();
                    // widget.citiesNames['flyTo'] = '';
                  },
                );
              },
              iconPath: 'assets/icons/x.svg')
        ],
      ),
    );
  }
}
