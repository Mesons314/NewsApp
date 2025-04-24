
import 'package:flutter/material.dart';
import 'package:newsapp/Screens/home.dart';

class Landing_Page extends StatefulWidget{
  @override
  State<StatefulWidget> createState() {
    return _landingPage();
  }

}

class _landingPage extends State<Landing_Page>{
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Container(
          margin: EdgeInsets.symmetric(horizontal: 10,vertical: 10),
          child: Column(
            children: [
              ClipRRect(
                borderRadius: BorderRadius.circular(12),
                child: Image.asset("assets/images/entertainment.jpg",
                width: MediaQuery.of(context).size.width,
                height: MediaQuery.of(context).size.height/1.7,
                fit: BoxFit.cover,),
              ),
              SizedBox(
                height: 10,
              ),
              Text('The detailed new is present here',style: TextStyle(fontSize: 14,fontWeight: FontWeight.bold,),),
              SizedBox(height: 5,), 
              Text('SSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSsss'),
              ElevatedButton(onPressed: (){
                Navigator.push(context, MaterialPageRoute(builder: (context)=>Home()));
              },
                  child: Text('Get Started'),
                style: ElevatedButton.styleFrom(backgroundColor: Colors.blue,foregroundColor: Colors.white,
                fixedSize: Size(200, 50)),)
            ],
          ),
        ),
      ),
    );
  }

}