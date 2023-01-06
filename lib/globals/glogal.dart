import 'package:flutter/material.dart';

class songdetail {
  String Name = "";
  String Cr_name = "";
  String image = "";
  String song = "";
  Color color ;
  songdetail(
      {
    required this.Name,
        required this.Cr_name,
        required this.image,
        required this.song,
        required this.color,
       });
}

List<songdetail> allsong = [
  songdetail(
      Name: "Jo Bheji thi duaa",
      Cr_name: "Arijit Singh,Nandini Srikar &  \nShekhar Ravjiani ",
      image: "assets/images/duaa.jpg",
      song: "assets/audio/song.mp3",
      color: Colors.purple.shade400),
  songdetail(
      Name: "Pal Pal Dil Ke Pass",
      Cr_name: "Arijit Singh & \nParampara Thakur ",
      image: "assets/images/pal pal dil ke pass.jfif",
      song: "assets/audio/song.mp3",
      color: Colors.blue.shade600),
  songdetail(
      Name: "Afreen Afreen",
      Cr_name: "Rahat Fateh Ali Khan &\nMomina Mustehsan",
      image: "assets/images/affren.jfif",
      song: "assets/audio/Afreen-Afreen.mp3",
      color: Colors.cyan.shade400),
  songdetail(
      Name: "Tum Jo Aaye Zindagi",
      Cr_name: "Rahat Fateh Ali Khan &\nTishaa Kumar",
      image: "assets/images/tum jo aaye zindagi mein.jpg",
      song: "assets/audio/Tum-Jo-Aaye-Zindagi-Mein.mp3",
      color: Colors.green.shade400),
  songdetail(
      Name: "Rait Zara Si",
      Cr_name: "A. R. Rahman,Shashaa \nTirupati,\nArijit Singh & Irshad Kamil",
      image: "assets/images/rait zara si.jpg",
      song: "assets/audio/RAIT-ZARA-SI-LYRICS.mp3",
      color:Colors.yellow.shade400 ),
  songdetail(
      Name: "Tera Fitoor ",
      Cr_name: "Arijit Singh",
      image: "assets/images/tera fitoor.jfif",
      song: "assets/audio/Tera-Fitoor.mp3",
      color: Colors.orange.shade400),
  songdetail(
      Name: "Saiyaara",
      Cr_name: "Mohit Chauhan &\nTarannum Mallik",
      image: "assets/images/saiyaara.jfif",
      song: "assets/audio/SAIYAARA.mp3",
      color: Colors.red.shade400),
];