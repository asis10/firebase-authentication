import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:login_app/src/screens/login.dart';

class Home extends StatelessWidget {
  const Home({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Home Screen'),
      ),
      body: Column(
        
        children: [
          SizedBox(height: 100,),
          Center(child: Text("Welcome to HomeScreen")),
          SizedBox(height: 200,),
          RaisedButton(
                color: Theme.of(context).accentColor,
                child: Text('Log Out'),
                onPressed: (){
                  
                  Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (context)=> LoginScreen()));
                },)
        ],
      ),
      
    );
  }
}