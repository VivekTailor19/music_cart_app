import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:music_cart_app/screen/provider/music_provider.dart';
import 'package:provider/provider.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {

  MusicProvider? provider ;

  @override
  void initState()
  {
    super.initState();
    provider = Provider.of<MusicProvider>(context,listen: false);
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: Text("Music Instrument Shopping",style: TextStyle(fontSize: 20),),
          actions: [
            IconButton(icon: Icon(Icons.shopping_cart),iconSize: 25,color: Colors.indigo,
              onPressed: () {

                Navigator.pushNamed(context, "cart");

              },
            )
          ],
        ),
        body: Padding(
          padding: const EdgeInsets.all(10.0),
          child: GridView.builder(gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              crossAxisSpacing: 10,mainAxisSpacing: 10

          ),
            itemCount: provider!.itemlist.length,
            itemBuilder: (context, index) => InkWell(
              onTap: () => Navigator.pushNamed(context, "itemview",arguments: index),
              child: Container(
                height: 160,width: 160,
                alignment: Alignment.center,
                decoration: BoxDecoration(borderRadius: BorderRadius.circular(15),color: Colors.blueGrey),
                child: Column(mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Container(height: 110,width: 130,
                    decoration: BoxDecoration(image: DecorationImage(image: AssetImage("${provider!.itemlist[index].photo}"),fit: BoxFit.fill)),
                    ),
                    SizedBox(height: 8),
                    Text("${provider!.itemlist[index].name}",style: TextStyle(fontSize: 14),),

                    Text("₹ ${provider!.itemlist[index].price}",style: TextStyle(fontSize: 15),),



                  ],
                ),
              ),
            )

          ),
        ),
      ),
    );
  }
}
