import 'package:get/get.dart';

class HC3 extends GetxController {
  final RxSet<String> hiddenCards = <String>{}.obs;

  bool isCardHidden(String cardId) {
    return hiddenCards.contains(cardId);
  }


  void hideCard(String cardId) {
    hiddenCards.add(cardId);
    update();
  }

  void showCard(String cardId) {
    hiddenCards.remove(cardId);
    update();
  }
}