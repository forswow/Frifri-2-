import 'package:flutter/material.dart';
import 'package:frifri/src/feature/buy_ticket/presentation/screens/tickets_list/components/cities_inputs/cities_input_widget.dart';

class CitiesInputs extends StatefulWidget {
  const CitiesInputs({super.key, required this.citiesNames});

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
                setState(() {
                  var temp = widget.citiesNames['flyFrom'];
                  widget.citiesNames['flyFrom'] = widget.citiesNames['flyTo']!;
                  widget.citiesNames['flyTo'] = temp!;
                });
              },
              iconPath: 'assets/icons/arrow-up-down.svg'),
          Divider(color: Colors.grey, thickness: 0.5, indent: 20),
          CitiesInput(
              cityName: widget.citiesNames['flyTo'] ?? "Укажите город",
              callback: () {
                setState(() {
                  widget.citiesNames['flyTo'] = '';
                });
              },
              iconPath: 'assets/icons/x.svg')
        ],
      ),
    );
  }
}
