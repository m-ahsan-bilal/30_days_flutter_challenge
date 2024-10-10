// food model
class Food {
  final String name; // Pure milk
  final String description; // Pure organic milk
  final String imagePath; // assstes/images
  final double price; //. 270 rupees
  final FoodCategory category; // milk
// add on items list
  List<Addon> availableAddons; // []
  Food(
      {required this.name,
      required this.category,
      required this.description,
      required this.imagePath,
      required this.price,
      required this.availableAddons});
}

// food category enum
enum FoodCategory {
  milk, // [ "fresh milk ", "pure fresh milk",]
  sides, // ["dahi bhallay"]
  desserts, // ["ras malai", " khoya", "barfi",]
  drinks, // [ meetha dhoodh, faluda , rabri dhoodh]
}

// food addons model
class Addon {
  String name;
  double price;
  Addon({required this.name, required this.price});
}
