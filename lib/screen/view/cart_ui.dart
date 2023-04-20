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
                    return Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 10.0,vertical: 5),
                      child: Container(height: 110,
                        decoration: BoxDecoration(color: Colors.teal,
                            borderRadius: BorderRadius.circular(20)),
                        child: Row(
                          children: [
                            Container(height: 110,width: 110,
                                decoration: BoxDecoration(color: Colors.tealAccent,
                                    borderRadius: BorderRadius.circular(20),
                                    image: DecorationImage(image: AssetImage(
                                        "${providerF!.cartlist[index].photo}"),fit: BoxFit.fill))
                            ),
                            Padding(
                              padding: const EdgeInsets.symmetric(horizontal: 10),
                              child: Container(

                                child: Column(mainAxisAlignment: MainAxisAlignment.spaceAround,
                                  children: [
                                    Text("${providerF!.cartlist[index].name}",),
                                    Text("${providerT!.cartlist[index].price! * providerT!.cartlist[index].qty!}",),

                                  ],
                                ),

                              ),
                            ),
                            Spacer(),
                            Container(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.end,
                                children: [
                                  IconButton(onPressed: (){

                                    providerF!.delete(index);

                                  }, icon: Icon(Icons.close_rounded,size: 12)),
                                  Row(
                                    children: [
                                      IconButton(onPressed: (){
                                        providerF!.decrease(index);
                                      }, icon: Icon(Icons.remove_circle_outline_rounded)),

                                      Container(height: 30,width: 30,alignment: Alignment.center,
                                          child: Text("${providerT!.cartlist[index].qty}",style: TextStyle(fontSize: 25,color: Colors.pinkAccent),)),

                                      IconButton(onPressed: (){
                                        providerF!.increase(index);
                                      }, icon: Icon(Icons.add_circle_outline_rounded)),
                                    ],

                                  )

                                ],
                              ),
                            ),

                          ],
                        ),
                      ),
                    );
                  },

                ),
              ),

              SizedBox(height: 50,),
              ElevatedButton(onPressed: (){
                providerF!.finalbill();
              }, child: Text("Create Bill")),

              Text("Total ${providerT!.total}",style: TextStyle(fontSize: 30,color: Colors.pink),),
              Text("Delivery ${providerT!.delivery}",style: TextStyle(fontSize: 30,color: Colors.pink),),
              Text("Final Price ${providerT!.finalprice}",style: TextStyle(fontSize: 30,color: Colors.pink),)


            ],),

        )

    ),
    );
  }
}
