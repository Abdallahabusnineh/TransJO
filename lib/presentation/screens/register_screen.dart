import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';

class RegisterScreen extends StatelessWidget {
  const RegisterScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: double.infinity,
        decoration: BoxDecoration(
            gradient: LinearGradient(begin: Alignment.topCenter, colors: [
          Colors.orange.shade900,
          Colors.orange.shade800,
          Colors.orange.shade400,
        ])),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            const SizedBox(
              height: 80,
            ),
            Padding(
              padding: EdgeInsets.all(20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  FadeInUp(
                      duration: Duration(milliseconds: 1300),
                      child: Text(
                        "Rigster",
                        style: TextStyle(color: Colors.white, fontSize: 40),
                      )),
                  SizedBox(
                    height: 10,
                  ),
                  FadeInUp(
                    duration: Duration(milliseconds: 1300),
                    child: Text(
                      'Please register to continue',
                      style: TextStyle(color: Colors.white, fontSize: 18),
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            Expanded(
              child: Container(
                decoration: const BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(60),
                        topRight: Radius.circular(60))),
                child: Padding(
                  padding: const EdgeInsets.all(30),
                  child: Column(
                    children: <Widget>[
                      const SizedBox(
                        height: 60,
                      ),
                      Container(
                        decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(20),
                            boxShadow: [
                              const BoxShadow(
                                  color: Color.fromRGBO(225, 95, 27, 0.3),
                                  blurRadius: 20,
                                  offset: Offset(0, 10))
                            ]),
                        child: Column(
                          children: <Widget>[
                            Container(
                              padding: const EdgeInsets.all(10),
                              decoration: BoxDecoration(
                                  border: Border(
                                      bottom: BorderSide(
                                          color: Colors.grey.shade200))),
                              child: FadeInUp(
                                duration: Duration(milliseconds: 1000),
                                child: const TextField(
                                  keyboardType: TextInputType.emailAddress,
                                  decoration: InputDecoration(
                                   prefixIcon: Icon(Icons.email),
                                      hintText: 'Email',
                                      hintStyle: TextStyle(color: Colors.grey),
                                      border: InputBorder.none),
                                ),
                              ),
                            ),
                            Container(
                              padding: const EdgeInsets.all(10),
                              decoration: BoxDecoration(
                                  border: Border(
                                      bottom: BorderSide(
                                          color: Colors.grey.shade200))),
                              child: FadeInUp(
                                duration: Duration(milliseconds: 1000),
                                child: const TextField(
                                  keyboardType: TextInputType.name,
                                  decoration: InputDecoration(
                                      hintText: 'Name',
                                      prefixIcon: Icon(Icons.person),
                                      hintStyle: TextStyle(color: Colors.grey),
                                      border: InputBorder.none),
                                ),
                              ),
                            ),
                            Container(
                              padding: const EdgeInsets.all(10),
                              decoration: BoxDecoration(
                                  border: Border(
                                      bottom: BorderSide(
                                          color: Colors.grey.shade200))),
                              child: FadeInUp(
                                duration: Duration(milliseconds: 1000),
                                child: const TextField(
                                  keyboardType: TextInputType.name,
                                  decoration: InputDecoration(
                                      hintText: 'Username',
                                      prefixIcon: Icon(Icons.man),
                                      hintStyle: TextStyle(color: Colors.grey),
                                      border: InputBorder.none),
                                ),
                              ),
                            ),
                            Container(
                              padding: const EdgeInsets.all(10),
                              decoration: BoxDecoration(
                                  border: Border(
                                      bottom: BorderSide(
                                          color: Colors.grey.shade200))),
                              child: FadeInUp(
                                duration: Duration(milliseconds: 1000),
                                child: const TextField(
                                  keyboardType: TextInputType.visiblePassword,
                                  decoration: InputDecoration(
                                      hintText: 'Password',
                                      prefixIcon: Icon(Icons.security),
                                      suffixIcon: Icon(Icons.visibility_off_rounded),
                                      hintStyle: TextStyle(color: Colors.grey),
                                      border: InputBorder.none),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      const SizedBox(
                        height: 40,
                      ),
                      Container(
                          height: 50,
                          margin: const EdgeInsets.symmetric(horizontal: 50),
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(50),
                              color: Colors.orange.shade900),
                          child: Center(
                              child: FadeInUp(
                            duration: Duration(milliseconds: 1000),
                            child: TextButton(
                              onPressed: () {
                                Center(child: CircularProgressIndicator());
                              },
                              child: Text(
                                'Register',
                                style: TextStyle(
                                    color: Colors.white,
                                    fontWeight: FontWeight.bold),
                              ),
                            ),
                          ))),
                      SizedBox(
                        height: 10,
                      ),
                      /*  FadeInUp( duration: Duration(milliseconds: 1000),child: Text('You don\'t Have an account ?')),
                      FadeInUp( duration: Duration(milliseconds: 1000),child: TextButton(onPressed: (){
                        navigateTo(context,RegisterScreen());
                      }, child: Text('SIGN UP',style: TextStyle(color: Colors.black,fontWeight: FontWeight.bold,fontSize: 20),)))*/
                    ],
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
