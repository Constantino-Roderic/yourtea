import 'package:flutter/material.dart';
import 'package:yourtea/screen/palette.dart';
import 'package:provider/provider.dart';
import 'package:yourtea/model/authentcation.dart';
import 'package:yourtea/screen/homepage.dart';
import 'package:yourtea/services/auth.dart';

class LoginSignup extends StatefulWidget {
  static const routeName = '/login_signup';

  @override
  _LoginSignupState createState() => _LoginSignupState();
}

class _LoginSignupState extends State<LoginSignup> {
  final AuthService _auth = AuthService();
  bool isSignupScreen = true;
  String email;
  String password;
  
    final GlobalKey<FormState> _formKey = GlobalKey();
    
  TextEditingController _passwordController = new TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Palette.backgroundColor,
      body: Stack(
        children: [
          Positioned(
            top: 0,
            right: 0,
            left: 0,
            child: Container(
              height: 300,
              decoration: BoxDecoration(
                  image: DecorationImage(
                      image: AssetImage("assets/images/top.png"),
                      fit: BoxFit.fill)),
              child: Container(
                padding: EdgeInsets.only(top: 90, left: 20),
                color: Palette.lightColor.withOpacity(.5),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    RichText(
                      text: TextSpan(
                          text: "Welcome to",
                          style: TextStyle(
                            fontSize: 25,
                            letterSpacing: 2,
                            color: Palette.darkColor,
                          ),
                          ),
                    ),
                    SizedBox(
                      height: 5,
                    ),
                    Text(
                      isSignupScreen
                          ? "Your Cup of Tea"
                          : "Your Cup of Tea",
                      style: TextStyle(
                        letterSpacing: 1,
                        color: Palette.darkColor,
                      ),
                    )
                  ],
                ),
              ),
            ),
          ),
          //Main Contianer for Login and Signup
          AnimatedPositioned(
            duration: Duration(milliseconds: 700),
            curve: Curves.bounceInOut,
            top: isSignupScreen ? 200 : 230,
            child: AnimatedContainer(
              duration: Duration(milliseconds: 700),
              curve: Curves.bounceInOut,
              height: isSignupScreen ? 380 : 250,
              padding: EdgeInsets.all(20),
              width: MediaQuery.of(context).size.width - 40,
              margin: EdgeInsets.symmetric(horizontal: 20),
              decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(15),
                  boxShadow: [
                    BoxShadow(
                        color: Colors.black.withOpacity(0.3),
                        blurRadius: 15,
                        spreadRadius: 5),
                  ]),
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        GestureDetector(
                          onTap: () {
                            
                            setState(() {
                              isSignupScreen = false;
                            });
                          },
                          child: Column(
                            children: [
                              Text(
                                "LOGIN",
                                style: TextStyle(
                                    fontSize: 16,
                                    fontWeight: FontWeight.bold,
                                    color: !isSignupScreen
                                        ? Palette.darkColor
                                        : Palette.lightColor),
                              ),
                              if (!isSignupScreen)
                                Container(
                                  margin: EdgeInsets.only(top: 3),
                                  height: 2,
                                  width: 55,
                                  color: Palette.darkColor,
                                )
                            ],
                          ),
                        ),
                        GestureDetector(
                          onTap: () {
                            setState(() {
                              isSignupScreen = true;
                            });
                          },
                          child: Column(
                            children: [
                              Text(
                                "SIGNUP",
                                style: TextStyle(
                                    fontSize: 16,
                                    fontWeight: FontWeight.bold,
                                    color: isSignupScreen
                                        ? Palette.darkColor
                                        : Palette.lightColor),
                              ),
                              if (isSignupScreen)
                                Container(
                                  margin: EdgeInsets.only(top: 3),
                                  height: 2,
                                  width: 55,
                                  color: Palette.darkColor,
                                )
                            ],
                          ),
                        )
                      ],
                    ),
                    if (isSignupScreen) buildSignupSection(),
                    if (!isSignupScreen) buildSigninSection()
                  ],
                ),
              ),
            ),
          ),
          // Trick to add the submit button
        ],
      ),
    );
  }
  
  Container buildSigninSection() {
    Map<String, String> _authData = {
    'email' : '',
    'password' : ''
  };

  void _showErrorDialog(String msg)
  {
    showDialog(
        context: context,
        builder: (ctx) => AlertDialog(
          title: Text('An Error Occured'),
          content: Text(msg),
          actions: <Widget>[
            FlatButton(
              child: Text('Okay'),
              onPressed: (){
                Navigator.of(ctx).pop();
              },
            )
          ],
        )
    );
  }

  Future<void> _submit() async
  {
    if(!_formKey.currentState.validate())
      {
        return;
      }
    _formKey.currentState.save();

    try{
      await Provider.of<Authentication>(context, listen: false).logIn(
          _authData['email'],
          _authData['password']
      );
      Navigator.of(context).pushReplacementNamed(HomePage.routeName);

    } catch(error)
    {
      var errorMessage = 'Authentication Failed. Please try again later.';
      _showErrorDialog(errorMessage);
    }
  }
    return Container(
      margin: EdgeInsets.only(top: 20),
      padding: EdgeInsets.only(bottom: 20),
      child: Form(
        key: _formKey,
      child: Column(
        children: <Widget> [
          Container(
            child: Column(children: [
              Container(
            margin: EdgeInsets.only(bottom: 10),
          child:(
              TextFormField(
                keyboardType: TextInputType.emailAddress,
                validator: (value)
              {
                if(value.isEmpty || !value.contains('@'))
                {
                  return 'invalid email';
                }
                return null;
              },
              onSaved: (value)
              {
                _authData['email'] = value;
              },
                decoration: InputDecoration(
                prefixIcon: Icon(Icons.email, color: Palette.darkColor,),
                enabledBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: Palette.brownColor),
                  borderRadius: BorderRadius.all(Radius.circular(35.0)),
                  ),
                  focusedErrorBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Palette.brownColor),
                    borderRadius: BorderRadius.all(Radius.circular(35.0)),
                    ),
                    contentPadding: EdgeInsets.all(10),
                    hintText: "Email",
                    hintStyle: TextStyle(
                      fontSize: 14, color: Palette.lightColor),
                    )
              ))),
              TextFormField(
              obscureText: true,
              validator: (value)
              {
                if(value.isEmpty || value.length<=5)
                {
                  return 'invalid password';
                }
                return null;
              },
              onSaved: (value)
              {
                _authData['password'] = value;
              },
                decoration: InputDecoration(
                prefixIcon: Icon(Icons.lock, color: Palette.darkColor,),
                enabledBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: Palette.brownColor),
                  borderRadius: BorderRadius.all(Radius.circular(35.0)),
                  ),
                  focusedErrorBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Palette.brownColor),
                    borderRadius: BorderRadius.all(Radius.circular(35.0)),
                    ),
                    contentPadding: EdgeInsets.all(10),
                    hintText: "Password",
                    hintStyle: TextStyle(
                      fontSize: 14, color: Palette.lightColor),
                    )
              ),
              Padding(padding: EdgeInsets.only(top: 10)),
              RaisedButton(
                child: Text(
                    'Submit'
                ), 
                onPressed: () async{ 
                await _auth.signInAnon();
                  _submit();
                },
                
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(30),
                ),
                color: Palette.brownColor,
                textColor: Colors.white,
              )
            ],
            ),
            )
        ],
      ),
      ),
    );
  }

  Container buildSignupSection() {

  Map<String, String> _authData = {
    'email' : '',
    'password' : ''
  };

  void _showErrorDialog(String msg)
  {
    showDialog(
        context: context,
        builder: (ctx) => AlertDialog(
          title: Text('An Error Occured'),
          content: Text(msg),
          actions: <Widget>[
            FlatButton(
              child: Text('Okay'),
              onPressed: (){
                Navigator.of(ctx).pop();
              },
            )
          ],
        )
    );
  }

  Future<void> _submit() async
  {
    if(!_formKey.currentState.validate())
      {
        return;
      }
    _formKey.currentState.save();

    try{
      await Provider.of<Authentication>(context, listen: false).signUp(
          _authData['email'],
          _authData['password']
      );
      Navigator.of(context).pushReplacementNamed(LoginSignup.routeName);

    } catch(error)
    {
      var errorMessage = 'Authentication Failed. Please try again later.';
      _showErrorDialog(errorMessage);
    }
  }

    return Container(
      margin: EdgeInsets.only(top: 20),
      child: Form(
        key: _formKey,
      child: Column (
        children: [
          Container(
            margin: EdgeInsets.only(bottom: 10),
          child:(
              TextFormField(
                keyboardType: TextInputType.emailAddress,
                validator: (value)
              {
                if(value.isEmpty || !value.contains('@'))
                {
                  return 'invalid email';
                }
                return null;
              },
              onSaved: (value)
              {
                _authData['email'] = value;
              },
                decoration: InputDecoration(
                prefixIcon: Icon(Icons.email, color: Palette.darkColor,),
                enabledBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: Palette.brownColor),
                  borderRadius: BorderRadius.all(Radius.circular(35.0)),
                  ),
                  focusedErrorBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Palette.brownColor),
                    borderRadius: BorderRadius.all(Radius.circular(35.0)),
                    ),
                    contentPadding: EdgeInsets.all(10),
                    hintText: "Email",
                    hintStyle: TextStyle(
                      fontSize: 14, color: Palette.lightColor),
                    )
              ))),
              Container(
            margin: EdgeInsets.only(bottom: 10),
          child:(
              TextFormField(
                obscureText: true,
                controller: _passwordController,
                validator: (value)
              {
                if(value.isEmpty || value.length<=5)
                {
                  return 'invalid password';
                }
                return null;
              },
              onSaved: (value)
              {
                _authData['password'] = value;
              },
                decoration: InputDecoration(
                prefixIcon: Icon(Icons.lock, color: Palette.darkColor,),
                enabledBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: Palette.brownColor),
                  borderRadius: BorderRadius.all(Radius.circular(35.0)),
                  ),
                  focusedErrorBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Palette.brownColor),
                    borderRadius: BorderRadius.all(Radius.circular(35.0)),
                    ),
                    contentPadding: EdgeInsets.all(10),
                    hintText: "Paasword",
                    hintStyle: TextStyle(
                      fontSize: 14, color: Palette.lightColor),
                    )
              ))),
              TextFormField(
                obscureText: true,
                validator: (value)
                          {
                            if(value.isEmpty || value != _passwordController.text)
                            {
                              return 'invalid password';
                            }
                            return null;
                          },
                          onSaved: (value)
                          {
                            _authData['password'] = value;
                          },
                decoration: InputDecoration(
                prefixIcon: Icon(Icons.lock, color: Palette.darkColor,),
                enabledBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: Palette.brownColor),
                  borderRadius: BorderRadius.all(Radius.circular(35.0)),
                  ),
                  focusedErrorBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Palette.brownColor),
                    borderRadius: BorderRadius.all(Radius.circular(35.0)),
                    ),
                    contentPadding: EdgeInsets.all(10),
                    hintText: "Password",
                    hintStyle: TextStyle(
                      fontSize: 14, color: Palette.lightColor),
                    )
              ),
              
          Padding(
            padding: const EdgeInsets.only(top: 10, left: 10),
            
          ),
          RaisedButton(
                          child: Text(
                              'Submit'
                          ),
                          onPressed: () async
                          {
                            _submit();
                          },
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(30),
                          ),
                          color: Palette.brownColor,
                          textColor: Colors.white,
                        ),
          Container(
            width: 200,
            margin: EdgeInsets.only(top: 20),
            child: RichText(
              textAlign: TextAlign.center,
              text: TextSpan(
                  text: "By pressing 'Submit' you agree to our ",
                  style: TextStyle(color: Palette.textColor2),
                  children: [
                    TextSpan(
                      //recognizer: ,
                      text: "term & conditions",
                      style: TextStyle(color: Colors.orange),
                    ),
                  ]),
            ),
          ),
        ],
      ),
      ),
    );
  }
}