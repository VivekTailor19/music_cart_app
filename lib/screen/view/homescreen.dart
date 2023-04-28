import 'package:flutter/material.dart';
import 'package:music_cart_app/screen/provider/music_provider.dart';
import 'package:provider/provider.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  MusicProvider? providerF;
  MusicProvider? providerT;

  @override
  void initState() {
    super.initState();

    Provider.of<MusicProvider>(context, listen: false).addDataToFilter();
  }

  @override
  Widget build(BuildContext context) {
    providerF = Provider.of<MusicProvider>(context, listen: false);
    providerT = Provider.of<MusicProvider>(context, listen: true);

    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          leading: Icon(
            Icons.sort_rounded,
            size: 25,
            color: Color(0xff666666),
          ),
          backgroundColor: Colors.white,
          title: Text(
            "The Music Warehouse",
            style: TextStyle(fontSize: 20, color: Color(0xff131313)),
          ),
          centerTitle: true,
          elevation: 0,
          actions: [
            IconButton(
              icon: Icon(Icons.shopping_bag),
              iconSize: 25,
              color: Color(0xff666666),
              onPressed: () {
                providerT!.finalbill();
                Navigator.pushNamed(context, "cart");
                //,arguments: provider!.total);
              },
            )
          ],
        ),
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(height: 5),
            Container(
              height: 170,
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: providerF!.storyphoto.length,
                itemBuilder: (context, index) {
                  return Story("${providerF!.storyphoto[index]}");
                },
              ),
            ),
            SizedBox(height: 5),
            Container(
              height: 30,
              child: ListView(
                scrollDirection: Axis.horizontal,
                children: [
                  InkWell(
                      onTap: () {
                        providerF!.changeCategory("All");
                      },
                      child: Tabs("All")),
                  InkWell(
                      onTap: () {
                        providerF!.changeCategory("Percussion");
                      },
                      child: Tabs("Percussion")),
                  InkWell(
                      onTap: () {
                        providerF!.changeCategory("String");
                      },
                      child: Tabs("String")),
                  InkWell(
                      onTap: () {
                        providerF!.changeCategory("Wind");
                      },
                      child: Tabs("Wind")),
                ],
              ),
            ),
            SizedBox(height: 10),
            Container(
              height: 200,
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: providerT!.filterlist.length,
                itemBuilder: (context, index) => Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 10, vertical: 15),
                  child: (
                      providerT!.category ==
                              providerT!.filterlist[index].type) ||
                          (providerT!.category == "All")
                      ? InkWell(
                          onTap: () => Navigator.pushNamed(context, "itemview",
                              arguments: index),
                          child: Container(
                            height: 170,
                            width: 160,
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(15),
                                // color: Color(0x10131313),
                                color: Colors.white),
                            child: Column(
                              children: [
                                Container(
                                  height: 120,
                                  width: 160,
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(15),
                                  ),
                                  child: Image.asset(
                                    "${providerF!.filterlist[index].photo}",
                                    fit: BoxFit.cover,
                                  ),
                                ),
                                SizedBox(height: 5),
                                Text(
                                  "${providerF!.filterlist[index].name}",
                                  style: TextStyle(
                                    fontSize: 16,
                                  ),
                                ),
                                Text(
                                  "₹ ${providerF!.filterlist[index].price}",
                                  style: TextStyle(
                                      fontSize: 15, color: Color(0xff666666)),
                                ),
                              ],
                            ),
                          ),
                        )
                      : Container(),
                ),
              ),
            ),
            Divider(
              color: Colors.black12,
              thickness: 0.65,
            ),
            Padding(
              padding: const EdgeInsets.only(left: 15.0),
              child: Container(
                height: 20,
                width: 85,
                alignment: Alignment.centerLeft,
                child: Text(
                  "Favorites",
                  style: TextStyle(fontSize: 15),
                ),
              ),
            ),
            Container(
              height: 170,
              child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: providerT!.filterlist.length,
                  itemBuilder: (context, index) => Padding(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 10, vertical: 15),
                        child: providerT!.filterlist[index].fav == false
                            ? Container()
                            : InkWell(
                                onTap: () {},
                                child: Container(
                                  height: 170,
                                  width: 160,
                                  decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(15),
                                      // color: Color(0x10131313),
                                      color: Colors.white),
                                  child: Column(
                                    children: [
                                      Container(
                                        height: 100,
                                        width: 160,
                                        decoration: BoxDecoration(
                                          borderRadius:
                                              BorderRadius.circular(15),
                                        ),
                                        child: Image.asset(
                                          "${providerT!.filterlist[index].photo}",
                                          fit: BoxFit.cover,
                                        ),
                                      ),
                                      SizedBox(height: 3),
                                      Text(
                                        "${providerT!.filterlist[index].name}",
                                        style: TextStyle(
                                          fontSize: 16,
                                        ),
                                      ),
                                      Text(
                                        "₹ ${providerT!.filterlist[index].price}",
                                        style: TextStyle(
                                            fontSize: 15,
                                            color: Color(0xff666666)),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                      )),
            ),
          ],
        ),
      ),
    );
  }

  Widget Tabs(String titlename) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 5),
      child: Container(
        height: 30,
        width: 85,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(25),
            border: Border.all(color: Colors.black12)),
        alignment: Alignment.center,
        child: Text(
          "$titlename",
          style: TextStyle(fontSize: 13.5),
        ),
      ),
    );
  }

  Widget Story(String stphoto) {
    return Padding(
      padding: const EdgeInsets.all(10.0),
      child: Container(
        height: 150,
        width: 330,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(15),
          border: Border.all(width: 0.65, color: Colors.black12),
        ),
        child: Image.asset(
          "$stphoto",
          height: 155,
          width: 320,
          fit: BoxFit.fill,
        ),
      ),
    );
  }
}

//
// Expanded(
// child: GridView.builder(
// gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
// crossAxisCount: 1
// ),
// scrollDirection:Axis.horizontal,
// itemCount: providerT!.filterlist.length,
// itemBuilder: (
// context, index) => Padding(
// padding: const EdgeInsets.symmetric(horizontal: 10,vertical: 15),
// child: InkWell(
// onTap: () => Navigator.pushNamed(context, "itemview",
// arguments: index),
// child: Container(
// height: 170,
// width: 160,
// decoration: BoxDecoration(
// borderRadius: BorderRadius.circular(15),
// // color: Color(0x10131313),
// color: Colors.white),
// child: Column(
// children: [
// Container(
// height: 120,
// width: 160,
// decoration: BoxDecoration(
// borderRadius: BorderRadius.circular(15),
// ),
// child: ClipRRect(
// borderRadius: BorderRadius.circular(15),
// child: Image.asset(
// "${providerF!.filterlist[index].photo}",
// fit: BoxFit.cover,
// )),
// ),
// SizedBox(height: 5),
// Text(
// "${providerF!.filterlist[index].name}",
// style: TextStyle(
// fontSize: 16,
// ),
// ),
// Text(
// "₹ ${providerF!.filterlist[index].price}",
// style: TextStyle(
// fontSize: 15, color: Color(0xff666666)),
// ),
// ],
// ),
// ),
// ),
// )),
//),
