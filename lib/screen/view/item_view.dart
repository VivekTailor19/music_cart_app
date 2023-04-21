import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:music_cart_app/screen/provider/music_provider.dart';
import 'package:provider/provider.dart';

class Item_View extends StatefulWidget {
  const Item_View({Key? key}) : super(key: key);

  @override
  State<Item_View> createState() => _Item_ViewState();
}

class _Item_ViewState extends State<Item_View> {

  MusicProvider? providerF ;
  MusicProvider? providerT ;

  @override
  Widget build(BuildContext context) {

    providerF = Provider.of<MusicProvider>(context,listen: false);
    providerT = Provider.of<MusicProvider>(context,listen: true);

    int index = ModalRoute.of(context)!.settings.arguments as int;

    return SafeArea(
      child: Scaffold(backgroundColor: Colors.white,
        appBar: AppBar(
          backgroundColor: Colors.white,

          leading: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8.0),
            child: IconButton(
              icon: Icon(Icons.arrow_back_ios,size: 30,color: Color(0xff666666)),
              iconSize: 25, color: Colors.indigo,
              onPressed: () {
                Navigator.pop(context);
              },
            ),
          ),
          actions: [Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8.0),
            child: IconButton(
                onPressed: () {
                  providerT!.like(index);
                },icon: (providerT!.filterlist[index].fav == false) ? Icon(Icons.favorite_border_rounded) :Icon(Icons.favorite_rounded)
                ,iconSize: 30,color: Color(0xff666666)),
          )],
          elevation: 0,
        ),

        body: Center(
          child: Column(mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Stack(
                children: [
                  Image.asset("${providerF!.filterlist[index].photo}",height: 400,width: 360,fit: BoxFit.fill,),
                  // Container(height: 200,width: 300,
                  //   decoration: BoxDecoration(color: Colors.,
                  //     borderRadius: BorderRadius.circular(20),
                  //
                  //     image: DecorationImage(image: AssetImage("${providerF!.filterlist[index].photo}")),
                  //   ),
                  // ),
                ],
              ),

              Container(height: 200,
                decoration: BoxDecoration(color: Color(0x10131313),
                    borderRadius: BorderRadius.only(topLeft: Radius.circular(35),topRight: Radius.circular(35))),
                child: Padding(
                  padding: const EdgeInsets.all(10),
                  child: Column(mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [

                      Row(mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          Text("${providerT!.filterlist[index].name}",style: TextStyle(fontSize: 25),),

                          Text("₹ ${providerT!.filterlist[index].price}",style: TextStyle(fontSize: 25),),
                        ],
                      ),

                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 10),
                        child: Text("${providerT!.filterlist[index].detail}",textAlign: TextAlign.justify,style: TextStyle(fontSize: 15),),
                      ),

                      FloatingActionButton.extended(
                        backgroundColor: Color(0xff131313),
                        onPressed: () {

                        providerF!.cartlist.add(providerF!.filterlist[index]);
                        Navigator.pop(context);
                        ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                            backgroundColor: Colors.green.shade50,
                            behavior: SnackBarBehavior.floating,
                            duration: Duration(seconds: 1),
                            content: Text("${providerT!.filterlist[index].name} is added to Cart",style: TextStyle(fontSize: 15,color: Colors.blueGrey.shade900),)),
                        );

                      },
                        label: Text("Add to Cart",style: TextStyle(fontSize: 15),),
                      ),

                    ],
                  ),
                ),
              ),




            ],
          ),
        ),
      ),
    );
  }
}
