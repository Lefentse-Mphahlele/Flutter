import 'package:flutter/material.dart';
import 'package:pass_data/GomoPub.dart';
import 'package:pass_data/Imbizo.dart';
import 'package:pass_data/cartitem.dart';
import 'package:pass_data/dish_object.dart';
import 'package:provider/provider.dart';
import 'package:pass_data/main.dart';

class LefentsePlus extends StatefulWidget {
  @override
  _LefentsePlusState createState() => _LefentsePlusState();
}

class _LefentsePlusState extends State<LefentsePlus> {
  @override
  Widget build(BuildContext context) {
    return Consumer <cartitem>(builder: (context, notifier, child) {
      return Scaffold(
          appBar: AppBar(
            title: Text("Lefentse Plus"),
            backgroundColor: Colors.redAccent[100],
          ),
          body: Container(
              child: SingleChildScrollView(
                  child: Align(
                      alignment: Alignment.center,
                      child: Column(
                          mainAxisSize: MainAxisSize.min,
                          children: <Widget>[
                            Container(
                              height: 55,
                              width: 350,
                              child: GestureDetector(
                                onTap: () {
                                  Navigator.of(context).push(
                                    MaterialPageRoute(
                                        builder: (context) => MyHomePage()),
                                  );
                                },
                                child: Card(
                                  color: Colors.redAccent[100],
                                  shape: RoundedRectangleBorder(
                                      borderRadius:
                                      new BorderRadius.circular(18.0),
                                      side: BorderSide(
                                          color: const Color(0xFFFFFFF))),
                                  elevation: 20,
                                  child: Padding(
                                    padding: const EdgeInsets.symmetric(
                                        vertical: 10, horizontal: 8),
                                    child: Center(
                                      child: Text("The Wing Republic Plus",
                                          style: TextStyle(
                                              fontSize: 15,
                                              fontWeight: FontWeight.bold,
                                              color: Colors.white)),
                                    ),
                                  ),
                                ),
                              ),
                            ),

                            Container(
                              height: 55,
                              width: 350,
                              child: GestureDetector(
                                onTap: () {
                                  Navigator.of(context).push(
                                    MaterialPageRoute(
                                        builder: (context) => Imbizo()),
                                  );
                                },
                                child: Card(
                                    color: Colors.redAccent[100],
                                    shape: RoundedRectangleBorder(
                                        borderRadius: new BorderRadius.circular(
                                            18.0),
                                        side: BorderSide(
                                            color: const Color(0xFFFFFFF))),
                                    elevation: 20,
                                    child: Padding(
                                      padding: const EdgeInsets.symmetric(
                                          vertical: 10, horizontal: 8),
                                      child: Center(
                                        child: Text("Imbizo Shisanyama",
                                            style: TextStyle(
                                                fontSize: 15,
                                                fontWeight: FontWeight.bold,
                                                color: Colors.white)),
                                      ),
                                    )),
                              ),
                            ),

                            Container(
                              height: 55,
                              width: 350,
                              child: GestureDetector(
                                onTap: () {
                                  Navigator.of(context).push(
                                    MaterialPageRoute(
                                        builder: (context) => GomoPub()),
                                  );
                                },
                                child: Card(
                                    color: Colors.redAccent[100],
                                    shape: RoundedRectangleBorder(
                                        borderRadius: new BorderRadius.circular(
                                            18.0),
                                        side: BorderSide(
                                            color: const Color(0xFFFFFFF))),
                                    elevation: 20,
                                    child: Padding(
                                      padding: const EdgeInsets.symmetric(
                                          vertical: 10, horizontal: 8),
                                      child: Center(
                                        child: Text("Gomo's Pub And Grill",
                                            style: TextStyle(
                                                fontSize: 15,
                                                fontWeight: FontWeight.bold,
                                                color: Colors.white)),
                                      ),
                                    )),
                              ),
                            )


                          ]
                      )
                  )
              )
          )

      );
    }
    );
  }
}
