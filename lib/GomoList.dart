
  class GomoList
  {
  final String category;
  final String ItemName;
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

  GomoList({this.category,this.ItemName, this.price});
  }

