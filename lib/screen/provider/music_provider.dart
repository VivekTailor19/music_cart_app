import 'package:flutter/cupertino.dart';
import 'package:music_cart_app/screen/modal/music_modal.dart';



class MusicProvider extends ChangeNotifier
{
    List<Music> itemlist = [
        Music(photo: "assets/images/casio.jpg",name: "Casio",detail: "YAMAHA PSR-F52 PORTABLE KEYBOARD WITH 61 KEYS",price: 7200),
        Music(photo: "assets/images/damru.jpg",name: "Damru",detail: "De Kulture Works™ Hand Hammered Brass Damru Mini Hand Drum Musical Instruments 4X3 DH (Inches)",price: 1475,qty: 1),
        Music(photo: "assets/images/gitar.jpg",name: "Gitar",detail: "Kadence Wanderer Series ukulele + (Free online learning Course) Brown Mahogany wood Ukulele With Bag",price: 2199,qty: 1),
        Music(photo: "assets/images/harmonium.jpg",name: "Harmonium",detail: "Laying Style™ 9 Stopper 42 Key 2 Reed 440 Tuned Total Wood Musical Instrument Harmonium (Brown)",price: 7700,qty: 1),
        Music(photo: "assets/images/manjeera.jpg",name: "Manjeera",detail: "Berua Karatals for kirtan, Spiritual Music Musical Instruments Indian Manjeera",price: 350,qty: 1),
        Music(photo: "assets/images/mouthorgan.jpg",name: "Mouth Organ",detail: "East top Chromatic Mouth Organs Harmonica Key of Bb,12 Holes 48 Tones Chromatic Harmonica Mouth Organ Musical Instrument for Adults and Professionals(Bb)",price: 8910,qty: 1),
        Music(photo: "assets/images/tabla.jpg",name: "Tabla",detail: "HRB MUSICALS® Student Table Jodi, Basic Table Set, Steel Bayan, Dayan wooden table, Hammer, Cushions & Cover, with bag- Perfect Tablas for Students and Beginners on Budget Tabla, Indian Hand Drums",price: 6555,qty: 1),
        Music(photo: "assets/images/dholak.jpg",name: "Dholak",detail: "Ganesh Musical Store Presents - Handmade Dholak",price:1500,qty: 1),
        Music(photo: "assets/images/flute.jpg",name: "Flute",detail: "Shiv'z Muzic Flute, G Natural BASE, PREMIUM Bansuri, 25 inches (with Written Manual & Bag)",price: 2500,qty: 1),
        Music(photo: "assets/images/shenai.jpg",name: "Shenai",detail: "SAONA India Indian Classical Wind Musical Instrument Shehnai",price: 1600,qty: 1),
        Music(photo: "assets/images/tumbi.jpg",name: "Tumbi",detail: "SAI Musical Pure Handmade Fine Crafted Indian Musical Instruments Wooden Playing Iktara (Tumbi)",price: 650,qty: 1),

    ];

    List<Music> cartlist = [];

    int noitem = 1;

    void increase()
    {
        noitem++;
        notifyListeners();

    }
    void decrease()
    {
        noitem--;
        notifyListeners();

    }
    void delete(int index)
    {
        cartlist.removeAt(index);
        notifyListeners();
    }



}