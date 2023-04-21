
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
  Widget build(BuildContext context) {
    int i = 0;

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
            "The Music Bar",
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
          children: [
            SizedBox(height: 5),

            Container(height: 180,
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: providerF!.storyphoto.length,
              itemBuilder: (context, index) {
                return Story("${providerF!.storyphoto[index]}");

            },
            ),),

            SizedBox(height: 15),
            Container(height: 30,
              child: Expanded(
                child: ListView(
                  scrollDirection: Axis.horizontal,
                  children: [
                    InkWell(onTap: () {
                      providerT!.filter("All");
                    },
                    child: Tabs("All")),


                    InkWell(onTap: () {
                      providerT!.filter("Percussion");
                     },
                      child: Tabs("Percussion")),

                    InkWell(
                        onTap: () {
                          providerT!.filter("String");
                        },
                        child: Tabs("String")),

                    InkWell(
                        onTap: () {
                          providerT!.filter("Wind");
                        },
                        child: Tabs("Wind")),

                  ],
                ),
              ),
            ),

            SizedBox(height: 15),

            providerT!.option == "All" ?
              Expanded(
              child: GridView.builder(
                scrollDirection: Axis.vertical,
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2

                  ),
                  itemCount: providerT!.filterlist.length,
                  itemBuilder: (
                      context, index) => InkWell(
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
                                      "${providerF!.filterlist[index].photo}",
                                      fit: BoxFit.cover,
                                    )),
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
                      )),
            ) :
              Expanded(
              child: ListView.builder(
                  scrollDirection:Axis.horizontal,
                  itemCount: providerT!.filterlist.length,
                  itemBuilder: (
                      context, index) => Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 10,vertical: 15),
                    child: InkWell(
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
                                    "${providerF!.filterlist[index].photo}",
                                    fit: BoxFit.cover,
                                  )),
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

  Widget Story(String stphoto)
  {
    return Padding(
      padding: const EdgeInsets.all(10.0),
      child: Container(
        height: 155,width: 320,
        decoration: BoxDecoration(borderRadius: BorderRadius.circular(15),
          border: Border.all(width: 0.65,color: Colors.black12),),
        child: Image.asset("$stphoto",height: 155,width: 320,fit: BoxFit.fill,),
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