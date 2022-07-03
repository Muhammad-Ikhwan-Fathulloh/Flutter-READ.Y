import 'package:flutter/material.dart';

class MyTutorial extends StatelessWidget {
  const MyTutorial({Key? key}) : super(key: key);
  
  @override
  Widget build(BuildContext context) {
    return Container(
       width: MediaQuery.of(context).size.width,
       child: Image.asset(
                    'assets/ready.gif', 
                    fit: BoxFit.contain,
                  ),
    );
  }
}
