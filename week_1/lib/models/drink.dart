abstract class Drink {
  final String name;
  final double price;

  Drink(this.name, this.price);

  String getPreparationMethod();

  String getDisplayName() => name;
  double getPrice() => price;
}

class Shai extends Drink {
  Shai() : super("Shai", 10);

  @override
  String getPreparationMethod() => "Brew tea leaves with hot water and sugar";
}

class TurkishCoffee extends Drink {
  TurkishCoffee() : super("Turkish Coffee", 25);

  @override
  String getPreparationMethod() => "Grind beans fine, brew in cezve with sugar";
}

class HibiscusTea extends Drink {
  HibiscusTea() : super("Hibiscus Tea", 15);

  @override
  String getPreparationMethod() => "Steep hibiscus flowers in hot water";
}
