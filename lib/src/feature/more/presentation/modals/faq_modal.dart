import 'package:flutter/material.dart';
import 'package:frifri/src/core/ui_kit/modals/base_modal.dart';
import 'package:frifri/src/core/ui_kit/modals/default_modal_header.dart';

class FaqModal extends BottomSheetStatelessModalBase {
  const FaqModal({super.key, required this.scrollController});

  final ScrollController scrollController;

  static const TextStyle _headerTextStyle = TextStyle(
    fontSize: 16.0,
    fontWeight: FontWeight.bold,
  );

  static const TextStyle _bodyTextStyle = TextStyle(
    fontSize: 12.0,
  );

  static const _defaultListDivider = Divider(
    height: 1,
    thickness: 0.5,
    indent: 44,
  );

  @override
  Widget buildHeader(BuildContext context) {
    return DefaultModalHeader(
      centerText: "Самые частые вопросы",
    );
  }

  @override
  Widget buildContent(BuildContext context) {
    return Expanded(
      child: Container(
        alignment: Alignment.topLeft,
        padding: const EdgeInsets.symmetric(
          horizontal: 20.0,
          vertical: 24.0,
        ),
        child: ListView(
          controller: scrollController,
          children: [
            SizedBox(
              height: 12,
            ),
            Text(
              "Как авиабилет?",
              style: _headerTextStyle,
              textAlign: TextAlign.left,
            ),
            Text(
              textAlign: TextAlign.justify,
              """
          Чтобы выяснить, получится ли сдать билет, вам нужно обратиться напрямую к его продавцу. Вот как это сделать. 
          
          1. Найти свой билет и посмотреть в нём, какая компания его продала вам и какие у неё указаны контакты. 
          2. Связаться с этим билетным агентством, назвать свои данные, и они объяснят, можно ли вернуть билет и сколько это будет стоить. 
          
          Условия и возможность зависят от его тарифа. 
          Сами бы подсказали вам условия возврата, но мы только ищем билеты и сравниваем цены, а для покупки вы переходите на сайты наших партнёров — авиакомпаний и агентств.""",
              style: _bodyTextStyle,
            ),
            // ------- Как вернуть билет (END)
            SizedBox(
              height: 24,
            ),
            _defaultListDivider,
            SizedBox(
              height: 24,
            ),
            // ------- Не пришёл билет - что делать? (START)
            Text(
              "Не пришёл билет - что делать?",
              style: _headerTextStyle,
            ),
            SizedBox(
              height: 12,
            ),
            Text(
              """
            Проверьте, пожалуйста, папку «Спам» в своём почтовом ящике — часто потерянные письма оказываются именно там. 
            
            Если там билета нет, то нужно обратиться к его продавцу, попросить проверить адрес почты и отправить билет повторно. Для этого проверьте смс о списании денег — в нём будет указано наименование компании, где вы совершали покупку. Если не сможете разобраться, вернитесь в приложении на шаг назад и пришлите нам скриншот о списании на почту или в социальные сети из раздела «Нужна помощь?» — мы подскажем. 
            
            Сами бы прислали вам маршрутную квитанцию, но мы только ищем билеты и сравниваем цены, а для покупки вы переходите на сайты наших партнёров — авиакомпаний и агентств.""",
              style: _bodyTextStyle,
            ),
          ],
        ),
      ),
    );
  }
}
