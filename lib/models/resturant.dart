import 'package:collection/collection.dart';
import 'package:flutter/material.dart';
import 'package:food_delivery/models/cartitem.dart';
import 'package:food_delivery/models/food.dart';
import 'package:intl/intl.dart';
class Resturant extends ChangeNotifier {
  final List<Food> _menu = [
    Food(
        name: "Cheese burger",
        description: "jussy beef with melted chedder",
        imagepath: "lib/images/burger/bruger.jpg",
        price: 0.99,
        category: foodCategories.burger,
        availableAdon: [
          Addon(name: "Extra cheese", price:0.23 ),
          Addon(name: "Extra sause", price:0.20 ),

        ]),
    Food(
        name: "classic burger",
        description: "Served with tahini sauce, lettuce, tomato, and pickled vegetables, this burger showcases how diverse dietary needs and global flavors can be "
            "accommodated within the burger realm",
        imagepath: "lib/images/burger/burgggger.jpg",
        price: 0.99,
        category: foodCategories.burger,
        availableAdon: [
          Addon(name: "Extra cheese", price:0.23 ),
          Addon(name: "Extra sause", price:0.20 ),

        ]),
    Food(
        name: "Double Cheese burger",
        description: "hussy beef with melted chedder",
        imagepath: "lib/images/burger/burgerr.jpg",
        price: 0.99,
        category: foodCategories.burger,
        availableAdon: [
          Addon(name: "Extra cheese", price:0.23 ),
          Addon(name: "Extra sause", price:0.20 ),

        ]),
    Food(
        name: "big mac burger",
        description: "hussy beef with melted chedder",
        imagepath: "lib/images/burger/b.jpg",
        price: 0.99,
        category: foodCategories.burger,
        availableAdon: [
          Addon(name: "Extra cheese", price:0.23 ),
          Addon(name: "Extra sause", price:0.20 ),

        ]),
    //salads

    Food(
        name: "Fatouch",
        description: "Fattoush is a Levantine salad composed of mixed greens and toasted or fried khubz, or flatbread. It often includes"
            " vegetables (like tomatoes and onions) and herbs and spices",
        imagepath: "lib/images/salads/s2.webp",
        price: 0.99,
        category: foodCategories.salads,
        availableAdon: [
          Addon(name: "Extra tomato", price:0.23 ),
          Addon(name: "Extra onions", price:0.20 ),

        ]),
    Food(
        name: "Niçoise Salad",
        description: "Traditionally, salade niçoise is made with tomatoes, hard-boiled eggs, anchovies or tuna, and Niçoise olives. Modern versions of the salad can include potatoes and seasonal vegetables. The famous French dish — which originated in Nice — can be served tossed or composed,"
            " but you'll most often find it tossed in olive oil",
        imagepath: "lib/images/salads/s3.webp",
        price: 0.99,
        category: foodCategories.salads,
        availableAdon: [
          Addon(name: "Extra tomato", price:0.23 ),
          Addon(name: "Extra onions", price:0.20 ),

        ]),
    Food(
        name: "Cobb Salad",
        description: "A Cobb is a hearty salad, so it's generally served as an entree instead of a side dish. It's made with chopped lettuce, bacon, grilled chicken, hard-boiled eggs, tomatoes, avocados, Roquefort cheese, and red wine vinaigrette. The lettuce is usually found on the bottom of the bowl or serving"
            " dish with the other ingredients arranged neatly on top.",
        imagepath: "lib/images/salads/s4.webp",
        price: 0.99,
        category: foodCategories.salads,
        availableAdon: [
          Addon(name: "Extra tomato", price:0.23 ),
          Addon(name: "Extra onions", price:0.20 ),

        ]),
    //drinks

    Food(
        name: "juice",
        description: "fresh juice with ice",
        imagepath: "lib/images/drinks/d1.jpg",
        price: 0.99,
        category: foodCategories.drinks,
        availableAdon: [
          Addon(name: "Extra ice", price:0.23 ),
          Addon(name: "Extra fruit", price:0.20 ),

        ]),
    Food(
        name: "healthy juice",
        description: "healthy juice with ice",
        imagepath: "lib/images/drinks/d2.jpg",
        price: 0.99,
        category: foodCategories.drinks,
        availableAdon: [
          Addon(name: "Extra ice", price:0.23 ),
          Addon(name: "Extra fruit", price:0.20 ),

        ]),
    Food(
        name: "soda",
        description: "fresh soda with ice",
        imagepath: "lib/images/drinks/d3.jpg",
        price: 0.99,
        category: foodCategories.drinks,
        availableAdon: [
          Addon(name: "Extra ice", price:0.23 ),
          Addon(name: "Extra fruit", price:0.20 ),

        ]),
  //sides

    Food(
        name: "tomato",
        description: "nice side with rice and meat",
        imagepath: "lib/images/sides/s1.jpg",
        price: 0.99,
        category: foodCategories.sides,
        availableAdon: [
          Addon(name: "Extra sause", price:0.23 ),
          Addon(name: "Extra tomato", price:0.20 ),

        ]),
    Food(
        name: "french potato",
        description: "nice side with rice and meat",
        imagepath: "lib/images/sides/s2.jpg",
        price: 0.99,
        category: foodCategories.sides,
        availableAdon: [
          Addon(name: "Extra sause", price:0.23 ),
          Addon(name: "Extra tomato", price:0.20 ),

        ]),
    Food(
        name: "potato",
        description: "nice side with rice and meat",
        imagepath: "lib/images/sides/s3.jpg",
        price: 0.99,
        category: foodCategories.sides,
        availableAdon: [
          Addon(name: "Extra sause", price:0.23 ),
          Addon(name: "Extra tomato", price:0.20 ),

        ]),
    //deserts
    Food(
        name: "Easy No-Bake Cheesecake",
        description: "No-bake and bursting with fresh berries, it’s perfect for summer. When I first tried this recipe, my husband said it was better than the baked ones, and that was a big plus for me!"
            " —Joyce Mummau, Baltimore, Maryland",
        imagepath: "lib/images/desserts/d1.jpg",
        price: 0.99,
        category: foodCategories.desserts,
        availableAdon: [
          Addon(name: "Extra sause", price:0.23 ),
          Addon(name: "Extra tomato", price:0.20 ),

        ]),
    Food(
        name: "Contest-Winning Easy Tiramisu",
        description: "This recipe makes a great quick dessert for a special supper…or anytime. It's easily doubled if needed. What a fun use"
            " for pudding snack cups! —Betty Claycomb, Adverton, Pennsylvania",
        imagepath: "lib/images/desserts/d2.jpg",
        price: 0.99,
        category: foodCategories.desserts,
        availableAdon: [
          Addon(name: "Extra Adverton", price:0.23 ),
          Addon(name: "Extra Pennsylvania", price:0.20 ),

        ]),
    Food(
        name: "Chocolate Peanut Butter Dream Bars",
        description: "Who doesn't like this dessert duo? Add your favorite combination of candies to garnish the tops of these chocolate "
            "peanut butter dream bars. —Cindi DeClue, Anchorage, Alaska",
        imagepath: "lib/images/desserts/d3.jpg",
        price: 0.99,
        category: foodCategories.desserts,
        availableAdon: [
          Addon(name: "Extra Anchorage", price:0.23 ),
          Addon(name: "Extra Alaska", price:0.20 ),

        ]),

  ];
  final List<CartItem> _cart=[];
  String DeliveryAdress='Adnan';
  //getters
  List<Food> get menu =>_menu;
  List<CartItem> get cart =>_cart;
String get _deliveryAdress =>DeliveryAdress;
  //operations


//add to cart
void addToCart(Food food,List<Addon> selectedAddons) {
CartItem? cartItem=_cart.firstWhereOrNull((item)  {
  bool isSameFood = item.food ==food;
  bool isSameAddos=
  ListEquality().equals(item.selectedAddons,selectedAddons);
return isSameFood &&  isSameAddos;
});
if(cartItem!=null) {
  cartItem.quantity++;
}
else{
  _cart.add(CartItem(food: food, selectedAddons: selectedAddons));
}
notifyListeners();
}
//remove from cart
void removefromcart(CartItem cartItem){
int cartindex=_cart.indexOf(cartItem);
if(cartindex!=-1) {
  if(_cart[cartindex].quantity>1){
    _cart[cartindex].quantity--;
  }
  else{
    _cart.removeAt(cartindex);
  }
}
notifyListeners();
}
//get total price of cart
double getTotalPrice() {
  double total=0.0;
  for(CartItem cartItem in _cart) {
    double itemtotal=cartItem.food.price;
    for(Addon addon in cartItem.selectedAddons) {
itemtotal+=addon.price;
    }
    total+=itemtotal*cartItem.quantity;
  }
  return total;

}
//get total price of items
int getTotalItemsCount(){
int totalItemCount=0;
for(CartItem cartItem in _cart){
  totalItemCount+=cartItem.quantity;
}
return totalItemCount;
}
//clear cart
void clearcart(){
  _cart.clear();
  notifyListeners();
}
void updateDeliveryAdress(String newAddress) {
  DeliveryAdress=newAddress;
  notifyListeners();
}
String displaycartreciept() {
  final receipt=StringBuffer();
  receipt.writeln('Here is your receipt');
  receipt.writeln();

  String formattedDate= DateFormat('yyyy-MM-HH-:mm:ss').
  format(DateTime.now());
  receipt.writeln(formattedDate);
  receipt.writeln();
  receipt.writeln('--------');
  for(final cartItem in _cart) {
    receipt.writeln('${cartItem.quantity} x ${cartItem.food.name} -'
        ' ${_formatPrice(cartItem.food.price)}');
    if(cartItem.selectedAddons.isNotEmpty){
      receipt.writeln('Add-ons : ${_formatAddons(cartItem.selectedAddons)}');
    }
    receipt.writeln();
  }
  receipt.writeln('--------');
  receipt.writeln();
  receipt.writeln("Total items : ${getTotalItemsCount()}");
  receipt.writeln('Total price: ${_formatPrice(getTotalPrice()) }' );
  receipt.writeln();
  receipt.writeln("Delivering to $DeliveryAdress" );
return receipt.toString();
}
String _formatPrice(double price) {
  return '\$${price.toStringAsFixed(2)}';

}
String _formatAddons (List<Addon> addons) {
return addons.map((addon) => "${addon.name} (${_formatPrice(addon.price)})").join(', ');
}
}
