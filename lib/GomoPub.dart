import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:pass_data/GomoList.dart';
import 'package:pass_data/cartitem.dart';
import 'package:provider/provider.dart';

import 'GomoCart.dart';

class GomoPub extends StatefulWidget {
  GomoPub({Key key, this.title}) : super(key: key);
  final String title;

  @override
  _GomoPubState createState() => _GomoPubState();
}

class _GomoPubState extends State<GomoPub> {
  List<GomoList> _gomo = List<GomoList>();
  List<GomoList> _gomocart = List<GomoList>();

  @override
  void initState() {
    super.initState();
    populateGomo();
  }
  @override
  Widget build(BuildContext context) {
    return Consumer <cartitem>(builder: (context, notifier, child) {
      return Scaffold(
        appBar: AppBar(
          title: Text("Gomo's Pub & Grill"),
          backgroundColor: Colors.redAccent[100],
          actions: <Widget>[
            Padding(
              padding: const EdgeInsets.only(right: 16.0, top: 8.0),
              child: GestureDetector(
                child: Stack(
                  alignment: Alignment.topCenter,
                  children: <Widget>[
                    Icon(
                      Icons.shopping_basket,
                      size: 35.0,
                    ),
                    if (_gomocart.length > 0)
                      Padding(
                        padding: const EdgeInsets.only(left: 2.0),
                        child: CircleAvatar(
                          radius: 8.0,
                          backgroundColor: Colors.red,
                          foregroundColor: Colors.white,
                          child: Text(
                            _gomocart.length.toString(),
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 12.0,
                            ),
                          ),
                        ),
                      ),
                  ],
                ),
                onTap: () {
                  if (_gomocart.isNotEmpty)
                    Navigator.of(context).push(
                      MaterialPageRoute(
                        builder: (context) => GomoCart(_gomocart),
                      ),
                    );

                  setState(() {
                    if (_gomocart.isEmpty) {
                      Fluttertoast.showToast(
                          msg: "Cart Empty, Add items to Cart",
                          toastLength: Toast.LENGTH_LONG,
                          gravity: ToastGravity.BOTTOM,
                          timeInSecForIosWeb: 1,
                          backgroundColor: Colors.red[200],
                          textColor: Colors.white,
                          fontSize: 16.0);
                    }
                  });
                },
              ),
            )
          ],
        ),
        body: _buildListView(),
      );
    }
    );
  }
  ListView _buildListView() {
    return ListView.builder(
      itemCount: _gomo.length,
      itemBuilder: (context, index) {
        var item = _gomo[index];
        return Padding(
            padding: const EdgeInsets.symmetric(
              horizontal: 8.0,
              vertical: 2.0,
            ),
            child: Card(
              elevation: 4.0,
              child: ListTile(
                leading: Text(item.category),
                /*Icon(
                item.icon,
                color: item.color,
              ),*/
                title: Text(item.ItemName),
                subtitle: Text("R" + item.price.toString()),
                trailing: GestureDetector(
                    child: (!_gomocart.contains(item))
                        ? Icon(
                      Icons.add_circle,
                      color: Colors.green,
                    )
                        : Icon(
                      Icons.remove_circle,
                      color: Colors.red,
                    ),
                    onTap: () {
                      setState(() {
                        if (!_gomocart.contains(item)) {
                          _gomocart.add(item);

                          Fluttertoast.showToast(
                              msg: "Drink Added To Cart",
                              toastLength: Toast.LENGTH_SHORT,
                              gravity: ToastGravity.BOTTOM,
                              timeInSecForIosWeb: 1,
                              backgroundColor: Colors.green[200],
                              textColor: Colors.white,
                              fontSize: 16.0);
                        }
                       else if(_gomocart.contains(item)) {
                          _gomocart.remove(item);

                          Fluttertoast.showToast(
                              msg: "Drink Removed From cart",
                              toastLength: Toast.LENGTH_SHORT,
                              gravity: ToastGravity.BOTTOM,
                              timeInSecForIosWeb: 1,
                              backgroundColor: Colors.red[200],
                              textColor: Colors.white,
                              fontSize: 16.0);
                        }
                      });
                    }),
              ),
            ));
      },
    );
  }

  void populateGomo() {
    var list = <GomoList>[
      GomoList(
    category: "Beer",
    ItemName: "Windhoek",
    price: 24
      ),

      GomoList(
        category: "Ciders",
        ItemName: "Savana",
        price: 26
      ),

      GomoList(
        category: "Champagne",
        ItemName: "House of BNG",
        price: 315
      ),

      GomoList(
        category: "Vodka",
        ItemName: "Ciroc",
        price: 49
      )

    ];

    setState(() {
      _gomo = list;
    });
  }
}
