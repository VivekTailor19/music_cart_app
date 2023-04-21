
import 'package:flutter/material.dart';
import 'package:music_cart_app/screen/provider/music_provider.dart';
import 'package:provider/provider.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  MusicProvider? provider;

  @override
  void initState() {
    super.initState();
    provider = Provider.of<MusicProvider>(context, listen: false);
  }

  @override
  Widget build(BuildContext context) {
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
            "Music Warehouse",
            style: TextStyle(fontSize: 20, color: Color(0xff131313)),
          ),
          centerTitle: true,
          elevation: 0,
          actions: [
            IconButton(
              icon: Icon(Icons.shopping_cart),
              iconSize: 25,
              color: Color(0xff666666),
              onPressed: () {
                provider!.finalbill();
                Navigator.pushNamed(context, "cart");
                //,arguments: provider!.total);
              },
            )
          ],
        ),
        body: Column(
          children: [
            SizedBox(height: 5),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 9,vertical: 5),
              child: Container(height: 35,
                child: Expanded(
                  child: ListView(
                    scrollDirection: Axis.horizontal,
                    children: [
                      Tabs("All"),
                      Tabs("Percussion"),
                      Tabs("String"),
                      Tabs("Wind"),

                    ],
                  ),
                ),
              ),
            ),
              Expanded(
              child: GridView.builder(
                  scrollDirection: Axis.vertical,
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    crossAxisSpacing: 15,
                    mainAxisSpacing: 10,
                  ),
                  itemCount: provider!.itemlist.length,
                  itemBuilder: (context, index) => InkWell(
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
                                child: ClipRRect(
                                    borderRadius: BorderRadius.circular(15),
                                    child: Image.asset(
                                      "${provider!.itemlist[index].photo}",
                                      fit: BoxFit.cover,
                                    )),
                              ),
                              SizedBox(height: 5),
                              Text(
                                "${provider!.itemlist[index].name}",
                                style: TextStyle(
                                  fontSize: 16,
                                ),
                              ),
                              Text(
                                "₹ ${provider!.itemlist[index].price}",
                                style: TextStyle(
                                    fontSize: 15, color: Color(0xff666666)),
                              ),
                            ],
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
      padding: const EdgeInsets.symmetric(horizontal:5),
      child: Container(
                      height: 30,
                      width: 85,
                      decoration: BoxDecoration(

                          borderRadius: BorderRadius.circular(25),
                      border: Border.all(color: Colors.black12)),
                      alignment: Alignment.center,

                      child: Text("$titlename",style: TextStyle(fontSize: 13.5),),
                    ),
    );
  }
}
