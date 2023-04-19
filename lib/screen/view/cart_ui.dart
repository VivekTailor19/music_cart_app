import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:music_cart_app/screen/provider/music_provider.dart';
import 'package:provider/provider.dart';

class Cart_UI extends StatefulWidget {
  const Cart_UI({Key? key}) : super(key: key);

  @override
  State<Cart_UI> createState() => _Cart_UIState();
}

class _Cart_UIState extends State<Cart_UI> {

  MusicProvider? providerF;
  MusicProvider? providerT;


  @override
  Widget build(BuildContext context) {

    providerF = Provider.of<MusicProvider>(context, listen: false);
    providerT = Provider.of<MusicProvider>(context, listen: true);

    return SafeArea(
      child: Scaffold(
        appBar: AppBar(title: Text("Shopping Area",style: TextStyle(fontSize: 25),),),
        body: Center(
          child: Column(
            children: [
              Expanded(
                child: ListView.builder(
                  itemCount: providerF!.cartlist.length,
                  itemBuilder: (context, index) {
                    return Container(

                      height: 60,
                      child: Padding(
                        padding: const EdgeInsets.symmetric(vertical: 5.0,horizontal: 10),
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Text("${index + 1}",style: TextStyle(fontSize: 18),),
                            SizedBox(width: 10,),
                            Container(
                              height: 60, width: 60, decoration: BoxDecoration(
                                image: DecorationImage(image: AssetImage(
                                    "${providerT!.cartlist[index].photo}"),fit: BoxFit.fill)),),

                            SizedBox(width: 10),

                            Text("${providerT!.cartlist[index].name}",),
                            Spacer(),

                            Row(
                              children: [
                                IconButton(onPressed: () {
                                  providerF!.decrease();
                                  providerF!.cartlist[index].qty = providerF!.noitem;

                                }, icon: Icon(Icons.remove,size: 20,color: Colors.red,)),
                                Container(height: 30,width: 30,alignment: Alignment.center,
                                child: Text("${ providerF!.cartlist[index].qty}",style: TextStyle(fontSize: 25,color: Colors.pinkAccent),)),
                                IconButton(onPressed: () {

                                  providerF!.increase();
                                  providerF!.cartlist[index].qty = providerF!.noitem;

                                }, icon: Icon(Icons.add,size: 20,color: Colors.green,)),
                              ],
                            ),




                            IconButton(onPressed: () {

                              providerF!.delete(index);

                            }, icon: Icon(Icons.delete_forever_rounded,size: 20,color: Colors.red,)),







                          ],
                        ),
                      ),
                    );
                  },

                ),
              ),

            ],),

        )

    ),
    );
  }
}
