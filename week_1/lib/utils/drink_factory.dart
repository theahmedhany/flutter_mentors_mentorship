import '../models/drink.dart';

class DrinkFactory {
  static final Map<String, Drink Function()> _drinkCreators = {
    'Shai': () => Shai(),
    'Turkish Coffee': () => TurkishCoffee(),
    'Hibiscus Tea': () => HibiscusTea(),
  };

  static List<String> getAvailableDrinks() => _drinkCreators.keys.toList();

  static Drink createDrink(String drinkType) {
    final creator = _drinkCreators[drinkType];
    if (creator == null) {
      throw ArgumentError('Unknown drink type: $drinkType');
    }
    return creator();
  }

  static Map<String, double> getDrinkPrices() {
    final prices = <String, double>{};
    for (final drinkType in _drinkCreators.keys) {
      final drink = createDrink(drinkType);
      prices[drinkType] = drink.getPrice();
    }
    return prices;
  }
}
