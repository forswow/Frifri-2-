import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:frifri/src/core/theme/colors.dart';
import 'package:frifri/src/feature/more/domain/settings_bloc.dart';
import 'package:frifri/src/feature/more/presentation/modals/base_modal.dart';
import 'package:google_fonts/google_fonts.dart';

class SettingsModal extends BottomSheetModalBase {
  const SettingsModal({super.key});

  @override
  Widget build_header(BuildContext context) {
    return DefaultModalHeader(
      centerText: "Настройки",
    );
  }

  static const _contentPadding = 24.0;

  @override
  Widget build_content(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(_contentPadding),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            AppLocalizations.of(context)!.pushNotification,
            style: GoogleFonts.poppins(
              fontSize: 16,
              fontWeight: FontWeight.w600,
            ),
          ),
          SizedBox(
            child: BlocBuilder<PushNotificationCubit, bool>(
              builder: (context, state) {
                return CupertinoSwitch(
                  value: state,
                  onChanged: (value) {
                    context.read<PushNotificationCubit>().setPushEnabled(value);
                  },
                  activeColor: kPrimaryAppColor,
                );
              },
            ),
          )
        ],
      ),
    );
  }
}
