import 'package:flutter/material.dart';
import 'package:sliding_sheet/sliding_sheet.dart';

class MyHome extends StatelessWidget {
  const MyHome({ Key? key }) : super(key: key);

  myDecorCard(icon, tech){
    return DecoratedBox(
      decoration: BoxDecoration(
        color: Colors.white,
      ),
      child: Align(
        alignment: Alignment.center,
        child: Card(
          elevation: 10,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(20),
          ),
          child: Padding(
            padding: EdgeInsets.all(20),
            child: DecoratedBox(
              decoration: BoxDecoration(
                color: Color(0xffE8F2F7),
                shape: BoxShape.circle,
              ),
              child: Padding(
                padding: EdgeInsets.all(7),
                child: DecoratedBox(
                  decoration: BoxDecoration(
                    color: Color(0xff7AC1E7),
                    shape: BoxShape.circle,
                  ),
                  child: Padding(
                    padding: EdgeInsets.all(10),
                    child: Icon(
                      icon,
                      color: Colors.white,
                    ),
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
          backgroundColor: Color.fromARGB(255, 198, 105, 29),
          title: Text('READ.Y'),
        ),
      body: SlidingSheet(
        elevation: 8,
        cornerRadius: 50,
        snapSpec: const SnapSpec(
          snap: true,
          snappings: [0.4, 0.7, 1.0],
          positioning: SnapPositioning.relativeToAvailableSpace,
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
                margin: EdgeInsets.only(top: 35),
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
                    'assets/about/learn.png', 
                    height: 400, 
                    fit: BoxFit.contain,
                  ),
                ),
              ),
              Container(
                alignment: Alignment.center,
                margin: EdgeInsets.only(
                  top: MediaQuery.of(context).size.height * 0.49),
                child: Column(
                  children: [
                    Text(
                      '', 
                      style: TextStyle(
                        color: Colors.white,
                        fontSize:  30,
                        fontWeight: FontWeight.bold
                    )),
                    
                  ],
                ),
              ),
            ],
          ),
        ),
        builder: (context, state) {
      
          return Container(
            margin: EdgeInsets.only(left: 20, right: 20, top: 30),
            height: 500,
            width: MediaQuery.of(context).size.width*0.9,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                      myDecorCard(Icons.book, ''),
                      myDecorCard(Icons.read_more, ''),
                      myDecorCard(Icons.play_arrow, ''),
                  ],
                ),
             SizedBox(
                      height: 10
                    ),
                  Column(
                  
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                      'Referensi :', 
                      style: TextStyle(
                        color: Colors.black,
                        fontSize:  25,
                        fontWeight: FontWeight.bold
                    )),
                    
                        ],
                      ), 
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [   
                          Text(
                      'phet.colorado.edu', 
                      style: TextStyle(
                        color: Colors.black,
                        fontSize:  15,
                        fontWeight: FontWeight.bold
                    )),
                        ],
                      ),            
                    ]
                  )
              ],
            )
          );
        },
      ),
    );
  }
  
}


