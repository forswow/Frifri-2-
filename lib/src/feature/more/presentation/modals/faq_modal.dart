import 'package:flutter/material.dart';
import 'package:frifri/src/core/localization/extension_alias.dart';
import 'package:frifri/src/core/ui_kit/modals/default_modal.dart';
import 'package:frifri/src/core/ui_kit/modals/default_modal_header.dart';

const TextStyle _headerTextStyle = TextStyle(
  fontSize: 16,
  fontWeight: FontWeight.bold,
);

const TextStyle _bodyTextStyle = TextStyle(
  fontSize: 12,
);

const _defaultListDivider = Divider(
  height: 1,
  thickness: 0.5,
);

class FaqModal extends StatelessWidget {
  const FaqModal({required this.scrollController, super.key});

  /// Для синхронизации скролла с модальным окном
  final ScrollController scrollController;

  @override
  Widget build(BuildContext context) => DefaultModalWrapper(
        child: Column(
          children: [
            DefaultModalHeader(
              centerText: context.l10n.frequent_questions_title,
            ),
            const Divider(
              height: 1,
              thickness: 0.5,
            ),
            _FaqModalContent(scrollController: scrollController),
          ],
        ),
      );
}

class _FaqModalContent extends StatelessWidget {
  const _FaqModalContent({required this.scrollController});

  final ScrollController scrollController;

  @override
  Widget build(BuildContext context) => Expanded(
        child: ListView(
          controller: scrollController,
          children: const [
            Padding(
              padding: EdgeInsets.symmetric(
                vertical: 20,
                horizontal: 24,
              ),
              child: FaqHowToReturnATicket(),
            ),
            _defaultListDivider,
            Padding(
              padding: EdgeInsets.symmetric(
                vertical: 20,
                horizontal: 24,
              ),
              child: FaqTicketDidntShowUp(),
            ),
          ],
        ),
      );
}

class FaqHowToReturnATicket extends StatelessWidget {
  const FaqHowToReturnATicket({
    super.key,
  });

  @override
  Widget build(BuildContext context) => Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            context.l10n.howReturnTicket,
            style: _headerTextStyle,
            textAlign: TextAlign.left,
          ),
          const SizedBox(
            height: 8,
          ),
          Text(
            textAlign: TextAlign.justify,
            context.l10n.faq_how_to_return_ticket,
            style: _bodyTextStyle,
          ),
          // ------- Как вернуть билет (END)
        ],
      );
}

class FaqTicketDidntShowUp extends StatelessWidget {
  const FaqTicketDidntShowUp({
    super.key,
  });

  @override
  Widget build(BuildContext context) => Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // ------- Не пришёл билет - что делать? (START)
          Text(
            context.l10n.ticket_not_arrived_title,
            style: _headerTextStyle,
          ),
          const SizedBox(
            height: 12,
          ),
          Text(
            context.l10n.faq_ticket_didnt_show_up,
            style: _bodyTextStyle,
          ),
        ],
      );
}
