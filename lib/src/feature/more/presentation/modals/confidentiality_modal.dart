import 'package:flutter/material.dart';
import 'package:frifri/src/core/ui_kit/modals/default_modal.dart';
import 'package:frifri/src/core/ui_kit/modals/default_modal_header.dart';
import 'package:frifri/src/feature/more/presentation/widgets/rounded_list_container.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

const TextStyle _listTileTextStyle = TextStyle(
  fontSize: 16.0,
);

const _defaultListDivider = Divider(
  height: 1,
  thickness: 0.5,
  indent: 16,
);

class ConfidentialityModal extends StatelessWidget {
  const ConfidentialityModal({super.key});

  @override
  Widget build(BuildContext context) {
    return DefaultModalWrapper(
      child: Column(
        children: [
          DefaultModalHeader(
            centerText: AppLocalizations.of(context).confidentiality,
          ),
          const Divider(
            height: 1,
            thickness: 0.5,
          ),
          const _ConfidentialityModalContent()
        ],
      ),
    );
  }
}

class _ConfidentialityModalContent extends StatelessWidget {
  const _ConfidentialityModalContent();

  @override
  Widget build(BuildContext context) {
    return RoundedListContainer(
      separator: _defaultListDivider,
      children: [
        GestureDetector(
          onTap: () {},
          child: ListTile(
            contentPadding: const EdgeInsets.only(left: 16, right: 12),
            title: Text(
              AppLocalizations.of(context).privacyPolicy,
              style: _listTileTextStyle,
            ),
            trailing: const Icon(
              Icons.keyboard_arrow_right,
            ),
          ),
        ),
        GestureDetector(
          onTap: () {},
          child: ListTile(
            contentPadding: const EdgeInsets.only(left: 16, right: 12),
            title: Text(
              AppLocalizations.of(context).licenseAgreement,
              style: _listTileTextStyle,
            ),
            trailing: const Icon(
              Icons.keyboard_arrow_right,
            ),
          ),
        ),
      ],
    );
  }
}
