import 'package:coffee_optovik/dataBaseTest/dataBaseTest.dart';
import 'package:flutter/material.dart';

import 'mainPage.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  @override
  Widget build(BuildContext context) {
    TextEditingController username = TextEditingController();
    TextEditingController password = TextEditingController();
    return Scaffold(
      resizeToAvoidBottomInset: true,
      body: SingleChildScrollView( 
        child: Column(
          children: [
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.6,
              child: Placeholder(),
            ),
            Padding(
              padding: const EdgeInsets.all(20.0),
              child: Column(children: [
                Text(
                  'Login',
                  style: Theme.of(context).textTheme.titleLarge,
                ),
                TextFormField(
                  controller: username,
                  scrollPadding: EdgeInsets.only(
                      bottom: MediaQuery.of(context).viewInsets.bottom),
                  decoration: InputDecoration(
                    label: Text('Username'),
                  ),
                ),
                SizedBox(
                  height: 10,
                ),
                TextFormField(
                  scrollPadding: EdgeInsets.only(
                      bottom: MediaQuery.of(context).viewInsets.bottom),
                  controller: password,
                  decoration: InputDecoration(
                    label: Text('Password'),
                  ),
                ),
                SizedBox(
                  height: 20,
                ),
                SizedBox(
                    width: double.infinity,
                    height: MediaQuery.of(context).size.height * 0.05,
                    child: ElevatedButton(
                        onPressed: () {
                          user['username'] = username.text;
                          user['password'] = password.text;
                          print('Login button is tapped');
                          username.text.isEmpty || password.text.isEmpty
                              ? print('Dont go')
                              : Navigator.pushReplacement(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => MainPage()));
                        },
                        child: Text('Login'))),
              ]),
            ),
          ],
        ),
      ),
    );
  }
}
