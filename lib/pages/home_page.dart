import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_tutorial/models/catalog.dart';
// import 'package:flutter_tutorial/widgets/items_widget.dart';
import 'package:flutter/services.dart';
import 'package:flutter_tutorial/utils/route.dart';
import 'package:flutter_tutorial/widgets/home_widgets/catalog_header.dart';
import 'package:flutter_tutorial/widgets/home_widgets/catalog_list.dart';
import 'package:flutter_tutorial/widgets/themes.dart';
import 'dart:convert';
// import '../widgets/drawer.dart';
import 'package:velocity_x/velocity_x.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  void initState() {
    super.initState();
    loadData();
  }

  loadData() async {
    await Future.delayed(Duration(seconds: 2));
    final catalogJson =
        await rootBundle.loadString("assets/files/catalog.json");
    final decodedData = jsonDecode(catalogJson);
    var productsData = decodedData["products"];
    CatalogModel.items = List.from(productsData)
        .map<Item>((item) => Item.fromMap(item))
        .toList();
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: context.canvasColor,
      floatingActionButton: FloatingActionButton(
        onPressed: () => Navigator.pushNamed(context, MyRoutes.cartRoute),
        backgroundColor: context.theme.buttonColor,
        child: Icon(
          CupertinoIcons.cart,
          color: Colors.white,
        ),
      ),
      body: SafeArea(
        child: Container(
            padding: Vx.m32,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                CatalogHeader(),
                if (CatalogModel.items != null &&
                    CatalogModel.items!.isNotEmpty)
                  CatalogList().py16().expand()
                else
                  CircularProgressIndicator().centered().py16().expand(),
              ],
            )),
      ),
    );
  }

  // @override
  // Widget build(BuildContext context) {
  //   return Scaffold(
  //     appBar: AppBar(
  //       title: Text("Catalog App"),
  //     ),
  //     body: Padding(
  //       padding: const EdgeInsets.all(16.0),
  //       child: (CatalogModel.items != null && CatalogModel.items!.isNotEmpty)
  //           ? GridView.builder(
  //               gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
  //                   crossAxisCount: 2,
  //                   mainAxisSpacing: 16,
  //                   crossAxisSpacing: 16),
  //               itemBuilder: (context, index) {
  //                 final item = CatalogModel.items![index];
  //                 return Card(
  //                     clipBehavior: Clip.antiAlias,
  //                     shape: RoundedRectangleBorder(
  //                         borderRadius: BorderRadius.circular(10)),
  //                     child: GridTile(
  //                         header: Container(
  //                             padding: const EdgeInsets.all(12),
  //                             decoration: BoxDecoration(
  //                               color: Colors.lightBlue,
  //                             ),
  //                             child: Text(
  //                               item.name,
  //                               style: TextStyle(color: Colors.white),
  //                             )),
  //                         footer: Container(
  //                             padding: const EdgeInsets.all(12),
  //                             decoration: BoxDecoration(
  //                               color: Colors.black,
  //                             ),
  //                             child: Text(
  //                               item.price.toString(),
  //                               style: TextStyle(color: Colors.white),
  //                             )),
  //                         child: Image.network(item.image)));
  //               },
  //               itemCount: CatalogModel.items!.length,
  //             )
  //           // ? ListView.builder(
  //           //     itemCount: CatalogModel.items!.length,
  //           //     itemBuilder: (context, index) => ItemWidget(
  //           //       item: CatalogModel.items![index],
  //           //     ),
  //           //   )
  //           : Center(
  //               child: CircularProgressIndicator(),
  //             ),
  //     ),
  //     drawer: MyDrawer(),
  //   );
  // }
}
