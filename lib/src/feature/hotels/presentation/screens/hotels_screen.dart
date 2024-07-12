import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:frifri/src/core/localization/extension_alias.dart';
import 'package:frifri/src/core/ui_kit/decorations/form_list_tile.dart';
import 'package:frifri/src/core/ui_kit/icons/app_icons.dart';
import 'package:frifri/src/core/ui_kit/styles/app_text_styles.dart';
import 'package:frifri/src/core/utils/logger.dart';
import 'package:frifri/src/feature/hotels/bloc/hotels_search_form_cubit.dart';
import 'package:frifri/src/feature/hotels/presentation/modals/location_picker_screen.dart';

class HotelsScreen extends StatelessWidget {
  const HotelsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(24),
          child: SingleChildScrollView(
            child: BlocProvider(
              create: (context) => HotelsSearchFormCubit(),
              child: const _HotelsSearchForm(),
            ),
          ),
        ),
      ),
    );
  }
}

class _HotelsSearchForm extends StatelessWidget {
  const _HotelsSearchForm();

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const Align(
          alignment: Alignment.topLeft,
          child: _HotelsScreenHeader(),
        ),
        const SizedBox(height: 24),
        GestureDetector(
          onTap: () {
            showModalBottomSheet(
              context: context,
              useRootNavigator: true,
              isScrollControlled: true,
              useSafeArea: true,
              builder: (context) => const LocationPickerScreen(),
            );
          },
          child: FormListTile(
            icon: AppIcons.hotelsLocation,
            child: Text(
              context.l10n.city,
              style: AppTextStyles.formTilePaleBody,
            ),
          ),
        ),
        const SizedBox(height: 8),
        FormListTile(
          icon: AppIcons.hotelsCalendarStart,
          child: Text(
            context.l10n.arrivalDate,
            style: AppTextStyles.formTilePaleBody,
          ),
        ),
        const SizedBox(height: 8),
        FormListTile(
          icon: AppIcons.hotelsCalendarEnd,
          child: Text(
            context.l10n.departureDate,
            style: AppTextStyles.formTilePaleBody,
          ),
        ),
        const SizedBox(height: 8),
        FormListTile(
          icon: AppIcons.hotelsPeople,
          child: const _PeopleCounterWidget(),
        )
      ],
    );
  }
}

class _PeopleCounterWidget extends StatefulWidget {
  const _PeopleCounterWidget();

  @override
  State<_PeopleCounterWidget> createState() => _PeopleCounterWidgetState();
}

class _PeopleCounterWidgetState extends State<_PeopleCounterWidget> {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<HotelsSearchFormCubit, HotelsSearchFormState>(
      builder: (context, state) {
        return Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            _RoundedIconButton(
              onPressed: () => _onCounterChange(state.countOfAdults - 1),
              icon: const Icon(
                Icons.remove,
              ),
            ),
            Text(
              '${state.countOfAdults} взрослый',
              style: AppTextStyles.formTileBody,
            ),
            _RoundedIconButton(
              onPressed: () => _onCounterChange(state.countOfAdults + 1),
              icon: const Icon(
                Icons.add,
              ),
            ),
          ],
        );
      },
    );
  }

  void _onCounterChange(int newValue) {
    if (newValue <= 0 || newValue > 25) {
      return;
    }

    setState(() {
      logger.i('onCounterChange: $newValue');
      context.read<HotelsSearchFormCubit>().setCountOfAdults(newValue);
    });
  }
}

class _RoundedIconButton extends StatelessWidget {
  final Icon icon;
  final VoidCallback? onPressed;

  const _RoundedIconButton({
    required this.icon,
    this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return IconButton(
      onPressed: onPressed,
      icon: icon,
      iconSize: 21,
      style: IconButton.styleFrom(
        side: const BorderSide(
          color: Color(0xFFEBF3FD),
        ),
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.all(
            Radius.circular(12),
          ),
        ),
      ),
    );
  }
}

class _HotelsScreenHeader extends StatelessWidget {
  const _HotelsScreenHeader();

  @override
  Widget build(BuildContext context) {
    return Text(
      'Подберём лучший отель',
      style: AppTextStyles.formTitle,
    );
  }
}
