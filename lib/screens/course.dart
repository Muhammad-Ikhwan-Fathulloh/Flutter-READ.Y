import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:http/http.dart' as http;
import 'package:url_launcher/url_launcher.dart';

class MyCourse extends StatefulWidget {
  const MyCourse({Key? key}) : super(key: key);

  @override
  State<MyCourse> createState() => _MyCourseState();
}

class _MyCourseState extends State<MyCourse> {
  CardCourse(lang, title, desc, star, icon, link){
    final Uri _url = Uri.parse(link);
    void _launchUrl() async {
      if (!await launchUrl(_url)) throw 'Could not launch $_url';
    }

    return Container(
              decoration: const BoxDecoration(
              gradient: LinearGradient(
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                  colors: [Colors.purple, Colors.orange])),
              height: 300,
              width: MediaQuery.of(context).size.width*0.9,
              child: Card(
                color: Color(0xff262628),
                child: Container(
                  margin: EdgeInsets.only(left: 20, right: 10, top: 40,),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        lang, 
                        style: TextStyle(
                          color: Colors.white, 
                          fontSize: 18
                        ),
                      ),
                      SizedBox(
                        height: 15,
                      ),
                      Text(
                        title, 
                        style: TextStyle(
                          color: Colors.white, 
                          fontSize: 30,
                          fontWeight: FontWeight.bold
                        ),
                      ),
                      SizedBox(
                        height: 3,
                      ),
                      Text(
                        desc, 
                        style: TextStyle(
                          color: Colors.white70, 
                          fontSize: 16,
                        ),
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Row(
                        children: [
                          Icon(
                            Icons.star, 
                            color: Colors.white70, 
                            size: 18,
                          ),
                          SizedBox(
                            width: 4,
                          ),
                          Text(
                            star, 
                            style: TextStyle(
                              color: Colors.white70)
                          ),
                          Expanded(child: Container()),
                           Text(
                            "Mulai Belajar", 
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
                      )
                    ],
                  ),
                ),
              ),
            );
  }
            
  Future<List> _loadData() async {
    List courses = [];
    try {
      const API = 'https://62bcfafbc5ad14c110b50245.mockapi.io/api/v1/courses';

      final http.Response response = await http.get(Uri.parse(API));
      courses = json.decode(response.body);
    } catch (err) {
      print(err);
    }

    return courses;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.orange,
      appBar: AppBar(
          backgroundColor: Color.fromARGB(255, 198, 105, 29),
          title: Text('READ.Y : Materi Belajar'),
        ),
        body: Column(
          children: [
            Expanded(
              child:  FutureBuilder(
              future: _loadData(),
              builder: (BuildContext ctx, AsyncSnapshot<List> snapshot) =>
                  snapshot.hasData
                      ?ListView.builder(
                          itemCount: snapshot.data!.length,
                          itemBuilder: (BuildContext context, index) => Card(
                            color: Colors.orange,
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                CardCourse(
                                    snapshot.data![index]['course_category'], 
                                    snapshot.data![index]['course_title'], 
                                    snapshot.data![index]['course_description'],
                                    '',
                                    FontAwesomeIcons.bookOpen,
                                    snapshot.data![index]['course_url']),
                              ],
                            ),
                          ),
                        )
                      : Center(
                          child: CircularProgressIndicator(),
                        )))
          ],
        )
    );
  }
}