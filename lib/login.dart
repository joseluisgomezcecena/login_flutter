import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:quatro_app/api.dart';
import 'package:quatro_app/custom_widgets.dart';
import 'package:quatro_app/home.dart';

class Login extends StatefulWidget {
  @override
  _LoginState createState() => _LoginState();
}

class _LoginState extends State<Login> {
  final _formKey = GlobalKey<FormState>();
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  String message = '';

  @override
  void dispose()
  {
    emailController.dispose();
    passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(

      backgroundColor: Colors.lightBlue,

      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0.0,
      ),

      body: Column(
        children: <Widget>[

          HeroImage(
          imgHeight: MediaQuery.of(context).size.height * 0.35,
          ),

          Expanded(
            child: ListView(
              children: <Widget>[
                Padding(
                  padding: EdgeInsets.fromLTRB(20, 10, 20, 10),
                  child: Form(
                    key: _formKey,
                    child: Column(
                      children: <Widget>[

                        SizedBox(height: 10.0,),


                        TextFormField(
                          decoration: InputDecoration(
                            labelText: 'E-mail',
                            labelStyle: TextStyle(
                                //fontSize: 20.0
                            ),
                          ),
                          controller:emailController,
                          validator: (value){
                            if(value.isEmpty){
                              return 'E-mail cannot be empty';
                            }
                            return null;
                          },
                        ),


                        SizedBox(height: 10.0,),


                        TextFormField(
                          obscureText: true,
                          decoration: InputDecoration(
                            labelText: 'Password',
                            labelStyle: TextStyle(
                              //fontSize: 20.0
                            ),
                          ),
                          controller:passwordController,
                          validator: (value){
                            if(value.isEmpty){
                              return 'Password field cannot be empty';
                            }
                            return null;
                          },
                        ),

                        SizedBox(height: 10.0,),

                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: <Widget>[
                            Text('Forgot Password?'),
                            FlatButton(
                              child: Text(
                                  'Recover',
                                   style: TextStyle(
                                     fontSize: 18.0,
                                     color: Theme.of(context).primaryColor
                                   ),
                              ),

                            )
                          ],
                        ),


                        CustomButton(
                          onBtnPressed: () async
                          {
                            if(_formKey.currentState.validate())
                            {
                              var email = emailController.text;
                              var password = passwordController.text;
                              setState(() {
                                message = 'Authenticating Please wait...';
                              });
                              var rsp = await loginUser(email, password);
                              print(rsp);
                              if(rsp.containsKey('status'))
                              {
                                setState(() {
                                  message = rsp['status_text'];
                                });
                                if(rsp['status'] == 1)
                                {
                                  Navigator.push(
                                      context,
                                      MaterialPageRoute(builder: (context){
                                        return HomePage(username: rsp['user_arr']['full_name'],);
                                      }));
                                }
                                else
                                {
                                  message = 'Login Failed';
                                }
                              }
                            }
                          },
                          btn_text: 'Login',
                        ),

                        SizedBox(height: 10.0,),
                        Text(message),
                        /*
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: <Widget>[
                          Icon(Icons.wb_cloudy_outlined),
                          Text(' Web Site'),
                          ],
                        ),
                        */



                      ],
                    ),
                  ),
                ),
              ],
            ),
          )

        ],
      ),



    );
  }
}
