import 'package:calendar_ver1/core/static/utils.dart';
import 'package:calendar_ver1/presentations/pages/calendarPage.dart';
import 'package:flutter/material.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({ Key? key }) : super(key: key);

  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {

  TextEditingController _loginController = TextEditingController();
  TextEditingController _passwordController = TextEditingController();

  final formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      
      backgroundColor: AppColors.babyPowder,
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Form(
          key: formKey,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    'Вход',
                    style: TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                      color: AppColors.blackCoffee,
                    ),
                  ),
                ],
              ),
              SizedBox(height: 40),
              Container(
                width: double.infinity,
                decoration: BoxDecoration(
                  color: AppColors.eggPlant,
                  borderRadius: BorderRadius.circular(12),
                ),
                child: Padding(
                  padding: const EdgeInsets.all(12.0),
                  child: Column(
                    children: [
                      TextFormField(
                        
                        controller: _loginController,
                        style: TextStyle(color: Colors.white),
                        decoration: InputDecoration(
                          labelText: 'Login',
                          hintStyle: TextStyle(color: Colors.white54),
                          prefixIcon: Icon(Icons.email, color: Colors.white),
                          border: InputBorder.none,
                        
                        ),
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Please enter some text';
                          }
                          
                          return null;
                        },
                      ),
                      SizedBox(height: 20),
                      TextFormField(
                        controller: _passwordController,
                        obscureText: true,
                        style: TextStyle(color: Colors.white),
                        decoration: InputDecoration(
                          labelText: 'Пароль',
                          hintStyle: TextStyle(color: Colors.white54),
                          prefixIcon: Icon(Icons.lock, color: Colors.white),
                          border: InputBorder.none,
                        ),
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Please enter some text';
                          }
                          
                          return null;
                        },
                      ),
                    ],
                  ),
                ),
              ),
              
              SizedBox(height: 20),
              ElevatedButton(
                onPressed: () {
                  Navigator.of(context).push(MaterialPageRoute(builder: (context) => CalendarPage()));
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: AppColors.eggPlant,
                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
                  padding: EdgeInsets.symmetric(vertical: 12, horizontal: 30),
                  minimumSize: Size(double.infinity, 50),
                ),
                child: Text(
                  'Войти',
                  style: TextStyle(fontSize: 16, color: Colors.black),
                ),
              ),
              // SizedBox(height: 20),
              // TextButton(
              //   onPressed: () {},
              //   style: TextButton.styleFrom(
              //     minimumSize: Size(double.infinity, 50),
              //   ),
              //   child: Text(
              //     'Зарегистрироваться',
              //     style: TextStyle(fontSize: 16, color: Colors.white),
              //   ),
              // ),
            ],
          ),
        ),
      ),
    );
  }
}