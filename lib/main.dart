import 'package:flutter/material.dart';
import 'package:assets_audio_player/assets_audio_player.dart';
import 'package:audioplayers/globals/glogal.dart';
import 'package:audioplayers/modals/secondpage.dart';

void main() {
  runApp(
    MaterialApp(
      theme: ThemeData(
        useMaterial3: true,
      ),
      debugShowCheckedModeBanner: false,
      routes: {
        '/' : (context) => const Homepage(),
       // 'secondpage' : (context) =>  secondpage(image: '',),
      },
    ),
  );
}

class Homepage extends StatefulWidget {
 // int index;
  const Homepage({Key? key}) : super(key: key);

  @override
  State<Homepage> createState() => _HomepageState();
}

class _HomepageState extends State<Homepage> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("RAINBOW MUSIC",style: TextStyle(fontSize: 25,fontWeight: FontWeight.w500,color: Colors.white),),
        centerTitle: true,
        backgroundColor: Colors.black,
      ),
      body: Container(
        color: Colors.black,
        child: SingleChildScrollView(
          child: Column(
            children: [
              Expanded(
                child: ListView.builder(
                  itemCount: allsong.length,
                  itemBuilder: (context, index) => InkWell(
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => secondpage(
                              Name: allsong[index].Name,
                              Cr_name: allsong[index].Cr_name,
                              song: allsong[index].song,
                              image: allsong[index].image,
                            ),
                          ));
                    },
                    child: Padding(
                      padding: const EdgeInsets.all(15),
                      child: Column(
                        children: [
                          Container(
                            height: 100,
                            width: double.infinity,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10),
                              color: allsong[index].color,
                            ),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceAround,
                              children: [
                                CircleAvatar(
                                  radius: 50,
                                  backgroundImage: AssetImage(allsong[index].song),
                                ),
                                Text.rich(TextSpan(
                                    text: "${allsong[index].Name}\n\n",
                                    style: const TextStyle(
                                        wordSpacing: 2,
                                        fontSize: 20,
                                        fontWeight: FontWeight.bold,
                                        color: Colors.white),
                                    children: [
                                      TextSpan(
                                          text: allsong[index].Cr_name,
                                          style: const TextStyle(
                                              color: Colors.white,
                                              fontSize: 15,
                                              fontWeight: FontWeight.w600))
                                    ])),
                                const Icon(
                                  Icons.play_arrow,
                                  color: Colors.white,
                                )
                              ],
                            ),
                          ),
                          const SizedBox(
                            height: 10,
                          )
                        ],
                      ),
                    ),
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}


