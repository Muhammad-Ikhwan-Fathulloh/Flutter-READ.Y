import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:url_launcher/url_launcher.dart';

class MyAbout extends StatefulWidget {
  const MyAbout({ Key? key }) : super(key: key);

  @override
  State<MyAbout> createState() => _MyAboutState();
}

class _MyAboutState extends State<MyAbout> {
  myMedsos(icon, link){
    final Uri _url = Uri.parse(link);
    void _launchUrl() async {
      if (!await launchUrl(_url)) throw 'Could not launch $_url';
    }

    return IconButton(
                          onPressed: _launchUrl, 
                          icon: Icon(icon,
                          color: Colors.white,
                          )
                        );
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // backgroundColor: Colors.black,
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.transparent,
      ),
      body: Container(
         decoration: const BoxDecoration(
          gradient: LinearGradient(
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
              colors: [Colors.purple, Colors.orange])),
          child: Stack(
            children: [
              Container(
                alignment: Alignment.topCenter,
                margin: EdgeInsets.only(top: 60),
                child: ShaderMask(
                  shaderCallback: (rect) {
                    return LinearGradient(
                      begin: Alignment.center,
                      end: Alignment.bottomCenter,
                      colors: [Colors.black, Colors.transparent])
                    .createShader(
                      Rect.fromLTRB(0, 0, rect.width, rect.height)
                    );
                  },
                  blendMode: BlendMode.dstIn,
                  child: Image.asset(
                    'assets/about/ikhwan.png', 
                    height: 400, 
                    fit: BoxFit.contain,
                  ),
                ),
              ),
              Container(
                alignment: Alignment.center,
                margin: EdgeInsets.only(
                  top: MediaQuery.of(context).size.height * 0.55),
                child: Column(
                  children: [
                    Text(
                      'Developer', 
                      style: TextStyle(
                        color: Colors.white,
                        fontSize:  30,
                    )),
                    SizedBox(
                      height: 10
                    ),
                    Text(
                      'M Ikhwan Fathulloh', 
                      style: TextStyle(
                        color: Colors.white,
                        fontSize:  35,
                        fontWeight: FontWeight.bold
                    )),
                    SizedBox(
                      height: 2
                    ),
                    Text(
                      'IoT and Backend Developer', 
                      style: TextStyle(
                        color: Colors.white,
                        fontSize:  20,
                    )),
                    SizedBox(
                      height: 10,
                    ),
                   
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        myMedsos(FontAwesomeIcons.instagram, 'https://www.instagram.com/ikhwan_fathulloh/'),
                        myMedsos(FontAwesomeIcons.linkedin, 'https://www.linkedin.com/in/muhammad-ikhwan-fathulloh-4a9835165/'),
                        myMedsos(FontAwesomeIcons.github, 'https://github.com/Muhammad-Ikhwan-Fathulloh'),
                        myMedsos(FontAwesomeIcons.medium, 'https://medium.com/@muhammadikhwanfathulloh17'),
                        myMedsos(FontAwesomeIcons.youtube, 'https://www.youtube.com/channel/UCBXuAApKa8JrN89t8Z2fekw'),
                      ],
                    )
                    
                  ],
                ),
              ),
            ],
          ),
        ),
    );
  }
}