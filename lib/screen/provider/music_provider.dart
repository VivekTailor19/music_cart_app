import 'package:flutter/cupertino.dart';
import 'package:music_cart_app/screen/modal/music_modal.dart';

class MusicProvider extends ChangeNotifier {
  List<String> storyphoto = [
    "assets/images/story/story1.png",
    "assets/images/story/story2.png",
    "assets/images/story/story3.png",
  ];

  List<Music> itemlist = [
    Music(
        type: "String",
        photo: "assets/images/casio.jpg",
        name: "Casio",
        detail: "YAMAHA PSR-F52 PORTABLE KEYBOARD WITH 61 KEYS",
        price: 7200,
        qty: 1,
        fav: false),
    Music(
        type: "String",
        photo: "assets/images/gitar.jpg",
        name: "Gitar",
        detail:
        "Kadence Wanderer Series ukulele + (Free online learning Course) Brown Mahogany wood Ukulele With Bag",
        price: 2199,
        qty: 1,
        fav: false),
    Music(
        type: "String",
        photo: "assets/images/harmonium.jpg",
        name: "Harmonium",
        detail:
        "Laying Style™ 9 Stopper 42 Key 2 Reed 440 Tuned Total Wood Musical Instrument Harmonium (Brown)",
        price: 7700,
        qty: 1,
        fav: false),
    Music(
        type: "String",
        photo: "assets/images/tumbi.jpg",
        name: "Tumbi",
        detail:
        "SAI Musical Pure Handmade Fine Crafted Indian Musical Instruments Wooden Playing Iktara (Tumbi)",
        price: 650,
        qty: 1,
        fav: false),
    Music(
        type: "Percussion",
        photo: "assets/images/damru.jpg",
        name: "Damru",
        detail:
        "De Kulture Works™ Hand Hammered Brass Damru Mini Hand Drum Musical Instruments 4X3 DH (Inches)",
        price: 1475,
        qty: 1,
        fav: false),
    Music(
        type: "Percussion",
        photo: "assets/images/manjeera.jpg",
        name: "Manjeera",
        detail:
        "Berua Karatals for kirtan, Spiritual Music Musical Instruments Indian Manjeera",
        price: 350,
        qty: 1,
        fav: false),
    Music(
        type: "Percussion",
        photo: "assets/images/tabla.jpg",
        name: "Tabla",
        detail:
        "HRB MUSICALS® Student Table Jodi, Basic Table Set, Steel Bayan, Dayan wooden table, Hammer, Cushions & Cover, with bag- Perfect Tablas for Students and Beginners on Budget Tabla, Indian Hand Drums",
        price: 6555,
        qty: 1,
        fav: false),
    Music(
        type: "Percussion",
        photo: "assets/images/dholak.jpg",
        name: "Dholak",
        detail: "Ganesh Musical Store Presents - Handmade Dholak",
        price: 1500,
        qty: 1,
        fav: false),
    Music(
        type: "Wind",
        photo: "assets/images/mouthorgan.jpg",
        name: "Mouth Organ",
        detail:
        "East top Chromatic Mouth Organs Harmonica Key of Bb,12 Holes 48 Tones Chromatic Harmonica Mouth Organ Musical Instrument for Adults and Professionals(Bb)",
        price: 8910,
        qty: 1,
        fav: false),
    Music(
        type: "Wind",
        photo: "assets/images/flute.png",
        name: "Flute",
        detail:
        "Shiv'z Muzic Flute, G Natural BASE, PREMIUM Bansuri, 25 inches (with Written Manual & Bag)",
        price: 2500,
        qty: 1,
        fav: false),
    Music(
        type: "Wind",
        photo: "assets/images/shenai.jpg",
        name: "Shenai",
        detail: "SAONA India Indian Classical Wind Musical Instrument Shehnai",
        price: 1600,
        qty: 1,
        fav: false),
    Music(
        type: "Wind",
        photo: "assets/images/trumpet.jpg",
        name: "Trumpet",
        detail: "ARB Professional Edition AGT-03 Bb Trumpet  (Yes)",
        price: 9500,
        qty: 1,
        fav: false),
  ];

  List<Music> filterlist = [];

  void addDataToFilter()
  {
    filterlist=itemlist;
  }

  int gridheight = 180;

  String category="All";

  void changeCategory(String cate)
  {
      category =cate;
      notifyListeners();
  }



  List<Music> cartlist = [
    //Music(photo: "assets/images/tumbi.jpg",name: "Tumbi",detail: "SAI Musical Pure Handmade Tumbi",price: 650,qty: 1),
  ];

  int total = 0;
  int finalprice = 0;
  int delivery = 100;

  void increase(int index) {
    Music temp = cartlist[index];
    Music update = Music(
        name: temp.name,
        price: temp.price,
        qty: temp.qty! + 1,
        photo: temp.photo,
        detail: temp.detail);
    cartlist[index] = update;
    finalbill();
    notifyListeners();
  }

  void decrease(int index) {
    Music temp = cartlist[index];
    if (temp.qty == 1) {
      delete(index);
    } else {
      Music update = Music(
          name: temp.name,
          price: temp.price,
          qty: temp.qty! - 1,
          photo: temp.photo,
          detail: temp.detail);
      cartlist[index] = update;
    }
    finalbill();
    notifyListeners();
  }

  void delete(int index) {
    cartlist.removeAt(index);
    finalbill();
    notifyListeners();
  }

  void finalbill() {
    total = 0;
    for (int i = 0; i < cartlist.length; i++) {
      total = total + cartlist[i].price! * cartlist[i].qty!;
      print(total);
    }
    finalprice = total + delivery;
    notifyListeners();
  }








  void likeitem(int index) {

      Music s = itemlist[index];
      Music update = Music(
          photo: s.photo,
          type: s.type,
          price: s.price,
          qty: s.qty,
          fav: !s.fav!,
          name: s.name,
          detail: s.detail,
      );
      filterlist[index] = update;

      notifyListeners();


  }
  


}



// void filter(String seltype) {
//   if (seltype == "All")
//   {
//     filterlist = [];
//     filterlist = itemlist;
//     gridheight *= filterlist.length;
//     notifyListeners();
//   }
//   else
//       {
//           filterlist = [];
//           for (int i = 0; i < itemlist.length; i++)
//            {
//              if (itemlist[i].type == seltype)
//              {
//                filterlist.add(itemlist[i]);
//              }
//            }
//           notifyListeners();
//       }
//
// }




// void likeitems()
// {
//
//   for(int index = 0 ; index<filterlist.length ; index++ )
//     {
//       Music temp = filterlist[index];
//
//       if( filterlist[index].fav == true)
//       {
//         temp = filterlist[index];
//         likedlist.add(temp);
//       }
//     }
//   notifyListeners();
//
// }

// void like(int index) {
//   Music temp = filterlist[index];
//
//   if (filterlist[index].fav != true) {
//     Music update = Music(
//         name: temp.name,
//         price: temp.price,
//         qty: temp.qty,
//         photo: temp.photo,
//         detail: temp.detail,
//         fav: true);
//     filterlist[index] = update;
//     likedlist.add(temp);
//   } else {
//     Music update = Music(
//         name: temp.name,
//         price: temp.price,
//         qty: temp.qty,
//         photo: temp.photo,
//         detail: temp.detail,
//         fav: false);
//     filterlist[index] = update;
//     likedlist.removeAt(index);
//   }
//   notifyListeners();
// }