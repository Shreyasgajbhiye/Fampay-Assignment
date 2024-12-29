import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

class HC3 extends GetxController {
  final RxSet<String> hiddenCards = <String>{}.obs;
  final RxList<String> dismissedCards = <String>[].obs;
  bool isInitialized = false;

  HC3() {
    initializePrefs();
  }

  Future<void> initializePrefs() async {
    if (isInitialized) return;
    
    try {
      final prefs = await SharedPreferences.getInstance();
      final List<String>? storedCards = prefs.getStringList('dismissedCards');
      if (storedCards != null) {
        dismissedCards.value = storedCards; 
      }
      isInitialized = true;
    } catch (e) {
      print("Error $e");
    }
  }

  Future<bool> isCardDismissed(String cardId) async {
    if (!isInitialized) {
      await initializePrefs();
    }
    return dismissedCards.contains(cardId);
  }

  bool isCardHidden(String cardId) {
    return hiddenCards.contains(cardId) || dismissedCards.contains(cardId);
  }

  void dismissCard(String cardId) async {
    try {
      if (!dismissedCards.contains(cardId)) {
        dismissedCards.add(cardId);
        hiddenCards.add(cardId);
        await _saveDismissedCards();
      }
    } catch (e) {
      print("Error dismissing card: $e");
    }
    update();
  }

  void hideCard(String cardId) {
    hiddenCards.add(cardId);
    update();
  }

  void showCard(String cardId) {
    hiddenCards.remove(cardId);
    update();
  }

  Future<void> _saveDismissedCards() async {
    try {
      final prefs = await SharedPreferences.getInstance();
      await prefs.setStringList('dismissedCards', dismissedCards.toList());
    } catch (e) {
      print("Error $e");
    }
  }
}