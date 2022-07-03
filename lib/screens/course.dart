import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:http/http.dart' as http;
import 'package:read_y/screens/course_detail.dart';
import 'package:url_launcher/url_launcher.dart';

class MyCourse extends StatelessWidget {
  
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
              
              child: Card(
                color: Color.fromARGB(255, 64, 58, 54),
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
                          Favourite(),
                        ],
                      ),
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
                            child: ListTile(
                              title:  CardCourse(
                                    snapshot.data![index]['course_category'], 
                                    snapshot.data![index]['course_title'], 
                                    snapshot.data![index]['course_description'],
                                    '',
                                    FontAwesomeIcons.bookOpen,
                                    snapshot.data![index]['course_url']),
                                    onTap: () {
                                      Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                          builder: (context) => MyCourseDetail(course_id : snapshot.data![index]),
                                        ),
                                      );
                                    },
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

class Favourite extends StatefulWidget {
  @override
  _FavouriteState createState() => _FavouriteState();
}
 
 
class _FavouriteState extends State<Favourite> {
  bool giveRating = false;
 
 
  @override
  Widget build(BuildContext context) {
    return IconButton(
      icon: Icon(
        giveRating ? Icons.bookmark: Icons.bookmark_border,
        color: Colors.red,
        size: 20,
      ),
      onPressed: () {
        setState(() {
          giveRating = !giveRating;
        });
      },
    );
  }
}

