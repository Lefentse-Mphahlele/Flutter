
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:pass_data/LefentsePlus.dart';
import 'package:pass_data/cartitem.dart';
import 'package:provider/provider.dart';
import 'cart.dart';
import 'dish_object.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => cartitem(),
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          backgroundColor: Colors.green,
        ),
        home: LefentsePlus(),
      ),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);
  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  List<Drinks> _dishes = List<Drinks>();
  List<Drinks> _cartList = List<Drinks>();

  @override
  void initState() {
    super.initState();
    _populateDishes();
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<cartitem>(builder: (context, notifier, child) {
      return Scaffold(
        appBar: AppBar(
          title: Text(
            "The Wing Republic Plus",
            style: TextStyle(fontSize: 20, fontWeight: FontWeight.normal),
          ),
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
                    if (_cartList.length > 0)
                      Padding(
                        padding: const EdgeInsets.only(left: 2.0),
                        child: CircleAvatar(
                          radius: 8.0,
                          backgroundColor: Colors.red,
                          foregroundColor: Colors.white,
                          child: Text(
                            _cartList.length.toString(),
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
                  if (_cartList.isNotEmpty)
                    Navigator.of(context).push(
                      MaterialPageRoute(
                        builder: (context) => Cart(_cartList),
                      ),
                    );

                  setState(() {
                    if (_cartList.isEmpty) {
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

        body: _buildGridView(
        ),
      );
    }
    );
  }


  GridView _buildGridView() {
    return GridView.builder(
        padding: const EdgeInsets.all(4.0),
        gridDelegate:
            SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2),
        itemCount: _dishes.length,
        itemBuilder: (context, index) {
          var item = _dishes[index];
          return Card(
              elevation: 4.0,
              child: Stack(
                fit: StackFit.loose,
                alignment: Alignment.center,
                children: <Widget>[
                  Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Text(item.category,),

                      Text(item.brandName, style: TextStyle(fontWeight: FontWeight.w500),
                        textAlign: TextAlign.center,
                       /* style: Theme.of(context).textTheme.subhead, */
                      ),
                      Text(
                        "R" + item.price.toString(),
                        textAlign: TextAlign.center,
                        style: TextStyle(fontSize: 17, fontWeight: FontWeight.w500),
                      )
                    ],
                  ),
                  Padding(
                    padding: const EdgeInsets.only(
                      right: 15.0,
                      bottom: 10.0,
                    ),
                    child: Align(
                      alignment: Alignment.bottomRight,
                      child: GestureDetector(
                        child: (!_cartList.contains(item))
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
                            if (!_cartList.contains(item)) {
                              _cartList.add(item);
                              Fluttertoast.showToast(
                                  msg: "Drink Added To Cart",
                                  toastLength: Toast.LENGTH_SHORT,
                                  gravity: ToastGravity.BOTTOM,
                                  timeInSecForIosWeb: 1,
                                  backgroundColor: Colors.green[200],
                                  textColor: Colors.white,
                                  fontSize: 16.0);
                            } else if (_cartList.contains((item))) {
                              _cartList.remove(item);
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
                        },
                      ),
                    ),
                  ),
                ],
              ));
        });
  }

  void _populateDishes() {
    var list = <Drinks>[
      Drinks(
        category: 'Gin Cocktails',
        brandName: "Clover Club",
        price: 65,
      ),
      Drinks(
        category: 'WHISK(E)Y COCKTAILS',
        brandName: 'Select Reserve',
        price: 40,
      ),
      Drinks(
        category: 'COGNAC/BRANDY COCKTAILS',
        brandName: 'Side Car',
        price: 110,
      ),
      Drinks(
        category: 'RUM COCKTAILS',
        brandName: 'Mojito',
        price: 60,
      ),
      Drinks(
        category: 'TEQUILLA COCKTAILS',
        brandName: "Margarita",
        price: 65,
      ),
      Drinks(
        category: 'VODKA COCKTAILS',
        brandName: 'Cosmopolitan',
        price: 80,
      ),
      Drinks(
        category: 'MOCKTAILS',
        brandName: 'Pina Colada ',
        price: 45,
      ),
      Drinks(
        category: 'SHOOTERS',
        brandName: 'Liquid Cocaine ',
        price: 35,
      ),

      Drinks(
        category: "BEERS & CIDERS",
        brandName: "Heineken NRB",
        price: 29,
      ),
      Drinks(
        category: "VODKA",
        brandName: "Ciroc",
        price: 35,
      )

    ];

    setState(() {
      _dishes = list;
    });
  }
}
