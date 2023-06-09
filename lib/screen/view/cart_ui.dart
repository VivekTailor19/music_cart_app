import 'package:flutter/material.dart';
import 'package:music_cart_app/screen/provider/music_provider.dart';
import 'package:provider/provider.dart';
import 'package:url_launcher/url_launcher.dart';

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

    //Uri url = Uri.parse("www.cylog.org");

   // int total = ModalRoute.of(context)!.settings.arguments as int;

    providerF = Provider.of<MusicProvider>(context, listen: false);
    providerT = Provider.of<MusicProvider>(context, listen: true);

    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          leading: InkWell(
              onTap: (){
                Navigator.pop(context);
              },
              child: Icon(Icons.arrow_back_rounded,size: 30,color: Colors.black38,)),
          backgroundColor: Colors.white,
          centerTitle: true,
          title: Text("Shopping Area", style: TextStyle(fontSize: 25,color: Color(0xff131313)),),
          elevation:0,
        ),
        body: Center(
          child: Column(
            children: [
              SizedBox(height: 14,),
              Expanded(
                child: ListView.builder(
                  itemCount: providerF!.cartlist.length,
                  itemBuilder: (context, index) {
                    return Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 10.0,vertical: 7),
                      child: Container(height: 110,
                        decoration: BoxDecoration(
                          color: Color(0x08666666),
                            borderRadius: BorderRadius.circular(20)),
                        child: Row(
                          children: [
                            Container(height: 110,width: 110,
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(20),
                                    image: DecorationImage(image: AssetImage(
                                        "${providerF!.cartlist[index].photo}"),fit: BoxFit.fill))
                            ),
                            Padding(
                              padding: const EdgeInsets.only(top: 15,left: 5,bottom: 15),
                              child: Column(

                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text("${providerF!.cartlist[index].name}",style: TextStyle(fontSize: 16),),
                                  Text("₹${providerT!.cartlist[index].price}",style: TextStyle(fontSize: 12.5),),
                                  Spacer(),
                                  Text("Total: ₹${providerT!.cartlist[index].price! * providerT!.cartlist[index].qty!}",style: TextStyle(fontSize: 15),),

                                ],
                              ),
                            ),
                            Spacer(),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.end,
                              children: [
                                IconButton(onPressed: (){

                                  providerF!.delete(index);

                                }, icon: Icon(Icons.close_rounded,size: 20)),
                                Spacer(),
                                Row(mainAxisSize: MainAxisSize.min,
                                  children: [
                                    IconButton(onPressed: (){
                                      providerF!.decrease(index);
                                    }, icon: Icon(Icons.remove_circle_outline_outlined)),

                                    Container(height: 18,width: 18,alignment: Alignment.center,
                                        child: Text("${providerT!.cartlist[index].qty}",style: TextStyle(fontSize: 15,color: Colors.pinkAccent),)),

                                    IconButton(onPressed: (){
                                      providerF!.increase(index);
                                    }, icon: Icon(Icons.add_circle_outlined)),
                                  ],

                                )

                              ],
                            ),

                          ],
                        ),
                      ),
                    );
                  },

                ),
              ),

              Container(height: 200,color: Colors.white,
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 15),
                  child: Column(mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Row(mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text("SubTotal Items(${providerF!.cartlist.length})",style: TextStyle(fontSize: 13,color: Colors.black38),),
                          Text("₹ ${providerT!.total}.00",style: TextStyle(fontSize: 18),)
                        ],
                      ),
                      Row(mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text("Delievery Fee",style: TextStyle(fontSize: 13,color: Colors.black38),),
                          Text("₹ ${providerT!.delivery}.00")
                        ],
                      ),

                      Divider(thickness: 1.5,color: Colors.black26),

                      Row(mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text("Total",style: TextStyle(fontSize: 15,color: Colors.black38),),
                          Text("₹ ${providerT!.finalprice}.00",style: TextStyle(fontSize: 20))
                        ],
                      ),
                      InkWell(
                        onTap: () async {

                             String url = 'https://paytm.com/';
                             final uri = Uri.parse(url);
                              await launchUrl(uri);

                        },
                        child: Container(height: 50,
                          alignment: Alignment.center,
                          decoration: BoxDecoration(
                              color: Color(0xff131313),
                              borderRadius: BorderRadius.circular(10)),
                          child: Text("Go to Payment",style: TextStyle(fontSize: 18,color: Colors.white),),
                        ),
                      ),


                    ],
                  ),
                ),

              ),

            ],),

        )

    ),
    );
  }
}
