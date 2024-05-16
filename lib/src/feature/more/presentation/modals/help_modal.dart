import 'package:flutter/material.dart';
import 'package:frifri/src/core/ui_kit/modals/default_modal.dart';
import 'package:frifri/src/core/ui_kit/modals/default_modal_header.dart';
import 'package:frifri/src/feature/more/presentation/modals/faq_modal.dart';
import 'package:frifri/src/feature/more/presentation/widgets/rounded_list_container.dart';

const TextStyle _listTileTextStyle = TextStyle(
  fontSize: 16.0,
);

const _defaultListDivider = Divider(
  height: 1,
  thickness: 0.5,
  indent: 16,
);

class HelpModal extends StatelessWidget {
  const HelpModal({super.key});

  @override
  Widget build(BuildContext context) {
    return const DefaultModalWrapper(
      child: Column(
        children: [
          DefaultModalHeader(
            centerText: "Помощь",
          ),
          _HelpModalContent(),
        ],
      ),
    );
  }
}

class _HelpModalContent extends StatelessWidget {
  const _HelpModalContent();

  @override
  Widget build(BuildContext context) {
    return RoundedListContainer(
      separator: _defaultListDivider,
      children: [
        GestureDetector(
          onTap: () {
            showModalBottomSheet(
              context: context,
              isScrollControlled: true,
              builder: (context) => DraggableScrollableSheet(
                expand: false,
                // Здесь передаём контроллер в модалку
                // чтобы скролл внутри модалки позволял её закрыть
                initialChildSize: 0.9,
                minChildSize: 0.85,
                maxChildSize: 0.9,
                builder: (context, controller) => FaqModal(
                  scrollController: controller,
                ),
              ),
            );
          },
          child: const ListTile(
            contentPadding: EdgeInsets.only(left: 16, right: 12),
            title: Text(
              "Самые частые вопросы",
              style: _listTileTextStyle,
            ),
            trailing: Icon(
              Icons.keyboard_arrow_right,
            ),
          ),
        ),
        GestureDetector(
          onTap: () {
            showModalBottomSheet(
              context: context,
              isScrollControlled: true,
              builder: (context) => DraggableScrollableSheet(
                expand: false,
                // Здесь передаём контроллер в модалку
                // чтобы скролл внутри модалки позволял её закрыть
                initialChildSize: 0.9,
                minChildSize: 0.8,
                maxChildSize: 0.9,
                builder: (context, controller) => FaqModal(
                  scrollController: controller,
                ),
              ),
            );
          },
          child: const ListTile(
            contentPadding: EdgeInsets.only(left: 16, right: 12),
            title: Text(
              "Отмена рейсов",
              style: _listTileTextStyle,
            ),
            trailing: Icon(
              Icons.keyboard_arrow_right,
            ),
          ),
        ),
        GestureDetector(
          onTap: () {
            showModalBottomSheet(
              context: context,
              isScrollControlled: true,
              builder: (context) => DraggableScrollableSheet(
                expand: false,
                // Здесь передаём контроллер в модалку
                // чтобы скролл внутри модалки позволял её закрыть
                initialChildSize: 0.9,
                minChildSize: 0.8,
                maxChildSize: 0.9,
                builder: (context, controller) => FaqModal(
                  scrollController: controller,
                ),
              ),
            );
          },
          child: const ListTile(
            contentPadding: EdgeInsets.only(left: 16, right: 12),
            title: Text(
              "Оформление билета",
              style: _listTileTextStyle,
            ),
            trailing: Icon(
              Icons.keyboard_arrow_right,
            ),
          ),
        ),
      ],
    );
  }
}
