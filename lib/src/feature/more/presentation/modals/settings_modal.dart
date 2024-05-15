import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:frifri/src/core/theme/colors.dart';
import 'package:frifri/src/core/ui_kit/buttons/confirm_button.dart';
import 'package:frifri/src/core/ui_kit/modals/base_modal.dart';
import 'package:frifri/src/core/ui_kit/modals/default_modal_header.dart';
import 'package:frifri/src/feature/more/domain/settings_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:google_fonts/google_fonts.dart';

class SettingsModal extends BottomSheetStatefulModalBase {
  @override
  State<BottomSheetStatefulModalBase> createState() {
    return SettingsModalState();
  }
}

class SettingsModalState extends BottomSheetStatefulModalBaseState {
  @override
  Widget buildHeader(BuildContext context) {
    return DefaultModalHeader(
      centerText: "Настройки",
    );
  }

  static const _contentPadding = 24.0;

  late bool initialPushNotificationEnabled;
  late bool pushNotificationEnabled;

  late bool commitButtonEnabled;

  @override
  void initState() {
    super.initState();
    initialPushNotificationEnabled =
        context.read<PushNotificationCubit>().state;
    pushNotificationEnabled = initialPushNotificationEnabled;

    commitButtonEnabled =
        initialPushNotificationEnabled != pushNotificationEnabled;
  }

  @override
  Widget buildContent(BuildContext context) {
    return Expanded(
      child: Container(
        padding: EdgeInsets.all(_contentPadding),
        child: Column(
          children: [
            Row(
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
                  child: CupertinoSwitch(
                    value: pushNotificationEnabled,
                    onChanged: (value) {
                      setState(() {
                        pushNotificationEnabled = value;
                        commitButtonEnabled = initialPushNotificationEnabled !=
                            pushNotificationEnabled;
                      });
                    },
                    activeColor: kPrimaryAppColor,
                  ),
                ),
              ],
            ),
            Spacer(),
            SizedBox(
              width: MediaQuery.sizeOf(context).width - _contentPadding * 2,
              height: 48,
              child: ConfirmationButton(
                child: Text(
                  AppLocalizations.of(context)!.confirm,
                  style: GoogleFonts.inter(
                    color: Colors.white,
                  ),
                ),
                onPressed: commitButtonEnabled
                    ? () {
                        context
                            .read<PushNotificationCubit>()
                            .setPushEnabled(pushNotificationEnabled);
                        context.pop();
                      }
                    : null,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
