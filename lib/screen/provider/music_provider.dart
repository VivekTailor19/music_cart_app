import 'package:flutter/cupertino.dart';
import 'package:music_cart_app/screen/modal/music_modal.dart';



class MusicProvider extends ChangeNotifier
{
    List<Music> itemlist = [
        Music(photo: "assets/images/casio.jpg",name: "YAMAHA PSR-F52 PORTABLE KEYBOARD WITH 61 KEYS",price: 7200)

    ];

    List<Music> cartlist = [];

}