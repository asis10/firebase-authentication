import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:login_app/src/screens/home.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({ Key? key }) : super(key: key);

  @override
  State<LoginScreen> createState() => _LoginState();
}

class _LoginState extends State<LoginScreen> {
   late String email,password;
  final auth = FirebaseAuth.instance;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar:AppBar(
        centerTitle: true,
        title: Text('Login'),
      ),
      body: 
      Column(
        children: [
          SizedBox(height: 30,),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: TextField(
                keyboardType: TextInputType.emailAddress,
                decoration: InputDecoration(
                  hintText: 'Email'
                ),
                onChanged: (value)
                {
                  setState(() {
                    email = value.trim();
                  });
                },
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: TextField(
                obscureText: true ,
                decoration: InputDecoration(
                  hintText: 'Password'
                ),
                onChanged: (value)
                {
                  setState(() {
                    password = value.trim();
                  });
                },
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
              RaisedButton(
                color: Theme.of(context).accentColor,
                child: Text('Log In'),
                onPressed: (){
                  auth.signInWithEmailAndPassword(email: email, password: password);
                  Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (context)=> Home()));
                },),
                SizedBox(width: 50,),
              RaisedButton(
                color: Color.fromARGB(255, 236, 168, 22),
                child: Text('Sign Up'),
                onPressed: (){
                  auth.createUserWithEmailAndPassword(email: email, password: password);
                  Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (context)=>Home()));
                })
            ],)

        ]
      ),
      
    );
  }
}