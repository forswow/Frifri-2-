import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:frifri/src/core/theme/colors.dart';
import 'package:frifri/src/core/ui_kit/buttons/confirm_button.dart';
import 'package:frifri/src/core/ui_kit/modals/default_modal.dart';
import 'package:frifri/src/core/ui_kit/modals/default_modal_header.dart';
import 'package:frifri/src/feature/more/domain/settings_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:google_fonts/google_fonts.dart';

const _contentPadding = 24.0;

class SettingsModal extends StatelessWidget {
  const SettingsModal({super.key});

  @override
  Widget build(BuildContext context) {
    return const DefaultModalWrapper(
      child: Column(
        children: [
          DefaultModalHeader(
            centerText: "Настройки",
          ),
          _SettingsModalContent(),
        ],
      ),
    );
  }
}

class _SettingsModalContent extends StatefulWidget {
  const _SettingsModalContent();

  @override
  State<_SettingsModalContent> createState() => _SettingsModalContentState();
}

class _SettingsModalContentState extends State<_SettingsModalContent> {
  late bool initialPushNotificationEnabled;
  late bool pushNotificationEnabled;
  late bool commitButtonEnabled;

  @override
  void initState() {
    super.initState();
    initialPushNotificationEnabled =
        context.read<PushNotificationCubit>().state;
    pushNotificationEnabled = initialPushNotificationEnabled;

    commitButtonEnabled = false;
  }

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Container(
        padding: const EdgeInsets.all(_contentPadding),
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
            const Spacer(),
            SizedBox(
              width: MediaQuery.sizeOf(context).width - _contentPadding * 2,
              height: 48,
              child: ConfirmationButton(
                onPressed: commitButtonEnabled
                    ? () {
                        context
                            .read<PushNotificationCubit>()
                            .setPushEnabled(pushNotificationEnabled);
                        context.pop();
                      }
                    : null,
                child: Text(
                  AppLocalizations.of(context)!.confirm,
                  style: GoogleFonts.inter(
                    color: Colors.white,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
