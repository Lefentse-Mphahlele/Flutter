import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:pass_data/ImbizoCart.dart';
import 'package:pass_data/ImbizoList.dart';
import 'package:pass_data/cartitem.dart';
import 'package:provider/provider.dart';

class Imbizo extends StatefulWidget {
  Imbizo({Key key, this.title}) : super(key: key);
  final String title;

  @override
  _ImbizoState createState() => _ImbizoState();
}

class _ImbizoState extends State<Imbizo> {
  List<ImbizoList> _imbz = List<ImbizoList>();
  List<ImbizoList> imbzcart = List<ImbizoList>();

  @override
  void initState() {
    super.initState();
    populateImbizo();
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<cartitem>(builder: (context, notifier, child) {
      return Scaffold(
        appBar: AppBar(
          title: Text("Imbizo Shisanyama"),
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
                    if (imbzcart.length > 0)
                      Padding(
                        padding: const EdgeInsets.only(left: 2.0),
                        child: CircleAvatar(
                          radius: 8.0,
                          backgroundColor: Colors.red,
                          foregroundColor: Colors.white,
                          child: Text(
                            imbzcart.length.toString(),
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
                  if (imbzcart.isNotEmpty)
                    Navigator.of(context).push(
                      MaterialPageRoute(
                        builder: (context) => ImbizoCart(imbzcart),
                      ),
                    );

                  setState(() {
                    if (imbzcart.isEmpty) {
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
      itemCount: _imbz.length,
      itemBuilder: (context, index) {
        var item = _imbz[index];
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
                    child: (!imbzcart.contains(item))
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
                        if (!imbzcart.contains(item))
                          {
                            imbzcart.add(item);

                            Fluttertoast.showToast(
                                msg: "Drink Added To Cart",
                                toastLength: Toast.LENGTH_SHORT,
                                gravity: ToastGravity.BOTTOM,
                                timeInSecForIosWeb: 1,
                                backgroundColor: Colors.green[200],
                                textColor: Colors.white,
                                fontSize: 16.0);
                          }

                        else if(imbzcart.contains(item))
                        {
                          imbzcart.remove(item);

                          Fluttertoast.showToast(
                              msg: "Drink removed from Cart",
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

  void populateImbizo() {
    var list = <ImbizoList>[
      ImbizoList(
          category: "Specialties",
          ItemName: "African Origibal Braai Mix",
          price: 325),
      ImbizoList(category: "Traditional", ItemName: "Lamb Neck", price: 155),
      ImbizoList(category: "Ciders", ItemName: "Bernini Classic", price: 147)
    ];

    setState(() {
      _imbz = list;
    });
  }
}
