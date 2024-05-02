class Food{
  final String name;
  final String description;
  final String imagepath;
  final double price;
final foodCategories category;
List<Addon> availableAdon;
  Food({required this.name, required this.description, required this.imagepath, required
  this.price,required this.category,required this.availableAdon});
}
enum foodCategories{
burger,
salads,
sides,
desserts,
drinks,
}
class Addon{
   String name;
   double price;
   Addon({required this.name,required this.price});
}
