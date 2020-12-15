
class Drinks {
  final String category;
  final String brandName;
  final int price;

  int counter = 1;
  int sum;

  int totalPrice() {
    return sum = price * counter;
  }

  void decrementCounter() {
    if(counter>1)
      {
        counter --;
      }
  }

  void incrementCounter() {
    counter++;
  }

  Drinks({this.category, this.brandName, this.price});
}
