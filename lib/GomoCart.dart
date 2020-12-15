import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:pass_data/GomoList.dart';

class GomoCart extends StatefulWidget {
  final List<GomoList> _GMcart;
  GomoCart(this._GMcart);

  @override
  _GomoCartState createState() => _GomoCartState(_GMcart);
}

class _GomoCartState extends State<GomoCart> {
  _GomoCartState(this._GMcart);
  List<GomoList> _GMcart;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.redAccent[100],
        title: Text(
          'Cart',
          style: TextStyle(fontSize: 20, fontWeight: FontWeight.normal),
        ),
        actions: <Widget>[
          IconButton(
              icon: Icon(Icons.send_rounded),
              tooltip: "Confirm Order",
              onPressed: () {
                if (_GMcart.isNotEmpty) {
                  setState(() {
                    Fluttertoast.showToast(
                        msg: "Order Confirmed",
                        toastLength: Toast.LENGTH_LONG,
                        gravity: ToastGravity.BOTTOM,
                        timeInSecForIosWeb: 1,
                        backgroundColor: Colors.green[200],
                        textColor: Colors.white,
                        fontSize: 16.0);
                  });
                }
                if (_GMcart.isEmpty) {
                  setState(() {
                    Fluttertoast.showToast(
                        msg: "Cart Empty",
                        toastLength: Toast.LENGTH_LONG,
                        gravity: ToastGravity.BOTTOM,
                        timeInSecForIosWeb: 1,
                        backgroundColor: Colors.red,
                        textColor: Colors.white,
                        fontSize: 16.0);
                  });
                }
              }),
          if (_GMcart.length > 0)
            Padding(
              padding: const EdgeInsets.only(right: 5.0, bottom: 10.0),
              child: CircleAvatar(
                radius: 10.0,
                backgroundColor: Colors.red,
                foregroundColor: Colors.white,
                child: Text(
                  _GMcart.length.toString(),
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 12.0,
                  ),
                ),
              ),
            ),
        ],
      ),
      body: ListView.builder(
        itemCount: _GMcart.length + 1,
        itemBuilder: (context, index) {
          if (index == _GMcart.length)
            return Align(
              alignment: Alignment.bottomLeft,
              child: Padding(
                padding:
                const EdgeInsets.symmetric(horizontal: 10.0, vertical: 2.0),
                child: Card(
                  shape: RoundedRectangleBorder(
                    borderRadius: new BorderRadius.circular(18.0),
                  ),
                  elevation: 4.0,
                  child: Text(
                      "Cart Total: R" +
                          _GMcart
                              .fold<int>(0, (a, b) => a + b.totalPrice())
                              .toString(),
                      style: TextStyle(
                          fontWeight: FontWeight.w500,
                          fontSize: 25,
                          color: Colors.redAccent[200])),
                ),
              ),
            );
          var item = _GMcart[index];
          return Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8.0, vertical: 1.0),
            child: Card(
              elevation: 4.0,
              child: ListTile(
                //Leading
                leading: Text(
                  item.category + "\n" + "R" + item.price.toString(),
                ),

                //Title
                title: Text(item.ItemName +
                    "\n" +
                    "(" +
                    item.counter.toString() +
                    ")"),
                //Subtitle
                subtitle: GestureDetector(
                  child: Icon(
                    Icons.add,
                    color: Colors.green,
                  ),
                  onTap: () {
                    setState(() {
                      item.incrementCounter();
                    });
                  },
                ),

                //Trailing
                trailing: GestureDetector(
                  child: Icon(
                    Icons.remove_circle,
                    color: Colors.red,
                  ),
                  onTap: () {
                    setState(() {
                      item.decrementCounter();
                    });
                  },
                ),
                isThreeLine: true,
              ),
            ),
          );
        },
      ),
    );
  }
}
