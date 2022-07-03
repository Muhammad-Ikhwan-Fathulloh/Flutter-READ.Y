import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:webview_flutter/webview_flutter.dart';

class MyCourseDetail extends StatelessWidget {
  
  const MyCourseDetail({super.key, required this.course_id});

  final course_id;

    CardCourse(video){
    

    return Container(
              decoration: const BoxDecoration(
              gradient: LinearGradient(
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                  colors: [Colors.purple, Colors.orange])),
              height: 300,
              child: WebView(initialUrl: video,javascriptMode: JavascriptMode.unrestricted,),
            );
  }

  
  ItemCourse(num){
    
    final course_descriptions = course_id['course_description'].split(',');
       return Column(
                          children: [
                              Text(
                        "- "+course_descriptions[num], 
                        style: TextStyle(
                          color: Colors.white, 
                          fontSize: 18,
                        ),
                      ),
                      SizedBox(
                        height: 15,
                      ),
                            ],
                          );
    }

    referensi(title, icon, link){
      final Uri _url = Uri.parse(link);
      void _launchUrl() async {
        if (!await launchUrl(_url)) throw 'Could not launch $_url';
      }

       return Row(
                        children: [
                          Expanded(child: Container()),
                           Text(
                            title, 
                            style: TextStyle(
                              color: Colors.white70)
                          ),
                          IconButton(
                          onPressed: _launchUrl,
                          icon: Icon(
                            icon,
                            color: Colors.white,
                            ),
                          ),
                        ],
                      );
    }
  

  @override
  Widget build(BuildContext context) {

   return Scaffold(
      backgroundColor: Colors.orange,
      appBar: AppBar(
          backgroundColor: Color.fromARGB(255, 198, 105, 29),
          title: Text('READ.Y : ' + course_id['course_category']),
        ),
      body: ListView(
      padding: EdgeInsets.all(5),
      children: <Widget>[
        CardCourse(course_id['course_url']),
        
        SizedBox(
                            height: 10,
                          ),
                           Container(
                        padding: EdgeInsets.all(5),
                        
                        child: Card(
                        color: Colors.orange,
                         child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [ Text(
                        course_id['course_title'], 
                        style: TextStyle(
                          color: Colors.white, 
                          fontSize: 30,
                          fontWeight: FontWeight.bold
                        ),
                      ),],)
                        ),
                      ),
                         
                          Row(
                        children: [
                          RatingStar(),
                          RatingStar(),
                          RatingStar(),
                          RatingStar(),
                          RatingStar(),
                        ],
                      ),
                          SizedBox(
                        height: 20,
                      ),
                          Row(
                            children: [Text(
                        "Materi : ", 
                        style: TextStyle(
                          color: Colors.white, 
                          fontSize: 20,
                          fontWeight: FontWeight.bold
                        ),
                      ),],
                          ),
                          SizedBox(
                        height: 10,
                      ),
                      Container(
                        padding: EdgeInsets.all(5),
                        
                        child: Card(
                        color: Colors.orange,
                         child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [Text(course_id['course_description'], style: TextStyle(
                          color: Colors.white, 
                          fontSize: 18,
                          fontWeight: FontWeight.bold))],)
                        ),
                      ),
                      referensi("Selengkapnya", FontAwesomeIcons.bookOpen, course_id['course_url']),
                      referensi("Referensi", FontAwesomeIcons.link, course_id['course_referensi']),
                      
          
      ])

    );
  }
}

class RatingStar extends StatefulWidget {
  @override
  _RatingStarState createState() => _RatingStarState();
}
 
 
class _RatingStarState extends State<RatingStar> {
  bool giveRating = false;
 
 
  @override
  Widget build(BuildContext context) {
    return IconButton(
      icon: Icon(
        giveRating ? Icons.star: Icons.star_border,
        color: Colors.white,
      ),
      onPressed: () {
        setState(() {
          giveRating = !giveRating;
        });
      },
    );
  }
}



