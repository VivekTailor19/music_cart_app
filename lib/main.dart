import 'package:flutter/material.dart';
import 'package:music_cart_app/screen/provider/music_provider.dart';
import 'package:music_cart_app/screen/view/cart_ui.dart';
import 'package:music_cart_app/screen/view/homescreen.dart';
import 'package:music_cart_app/screen/view/item_view.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context) => MusicProvider(),)
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        routes: {
          "/":(context) => HomeScreen(),
          "itemview":(context) => Item_View(),
          "cart":(context) => Cart_UI(),


        },
      ),
    ),
  );
}
