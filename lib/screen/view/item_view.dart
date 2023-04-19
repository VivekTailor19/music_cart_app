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
      child: Scaffold(
        appBar: AppBar(title: Text("Music Item"),
        centerTitle: true,
        ),
        floatingActionButton: FloatingActionButton.extended(onPressed: () {

          providerF!.cartlist.add(providerF!.itemlist[index]);
          Navigator.pop(context);
          ScaffoldMessenger.of(context).showSnackBar(SnackBar(
              backgroundColor: Colors.green.shade50,
              behavior: SnackBarBehavior.floating,
              content: Text("${providerT!.itemlist[index].name} is added to Cart",style: TextStyle(fontSize: 15,color: Colors.blueGrey.shade900),)),
          );

        },
            label: Text("Add to Cart"),
        ),
        floatingActionButtonLocation: FloatingActionButtonLocation.miniCenterFloat,
        body: Center(
          child: Column(
            children: [
              SizedBox(height: 25,),
              Container(height: 200,width: 300,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  boxShadow: [BoxShadow(color: Colors.amber,blurRadius: 3)],
                  image: DecorationImage(image: AssetImage("${providerF!.itemlist[index].photo}")),
              ),
              ),
              SizedBox(height: 20,),
              Row(mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Text("${providerT!.itemlist[index].name}",style: TextStyle(fontSize: 30),),
                  Text("${providerT!.itemlist[index].price}",style: TextStyle(fontSize: 30),),
                ],
              ),
              SizedBox(height: 10,),
              Text("${providerT!.itemlist[index].detail}"),

              SizedBox(height: 20),


            ],
          ),
        ),
      ),
    );
  }
}
