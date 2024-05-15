import 'package:flutter/material.dart';
import 'package:frifri/src/core/ui_kit/modals/base_modal.dart';
import 'package:frifri/src/core/ui_kit/modals/default_modal_header.dart';
import 'package:frifri/src/feature/more/presentation/modals/faq_modal.dart';
import 'package:frifri/src/feature/more/presentation/widgets/rounded_list_container.dart';

class HelpModal extends BottomSheetStatelessModalBase {
  const HelpModal({super.key});

  static const TextStyle _listTileTextStyle = TextStyle(
    fontSize: 16.0,
  );

  static const _defaultListDivider = Divider(
    height: 1,
    thickness: 0.5,
    indent: 16,
  );

  @override
  Widget buildHeader(BuildContext context) {
    return DefaultModalHeader(
      centerText: "Помощь",
    );
  }

  @override
  Widget buildContent(BuildContext context) {
    return Container(
      child: RoundedListContainer(
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
            child: ListTile(
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
            child: ListTile(
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
            child: ListTile(
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
      ),
    );
  }
}
