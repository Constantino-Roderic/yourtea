import 'package:flutter/material.dart';
import 'package:yourtea/screen/order.dart';
import 'package:yourtea/splash_screen.dart';
import 'package:yourtea/screen/login_signup.dart';
import 'package:provider/provider.dart';
import 'model/authentcation.dart';
import 'package:yourtea/screen/homepage.dart';
import 'package:yourtea/screen/profile.dart';
import 'package:yourtea/screen/edit_account.dart';

Future main() async {
  WidgetsFlutterBinding.ensureInitialized();

  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  static final String title = 'TODO';
  @override
  Widget build(BuildContext context) {
    
    return MultiProvider(
      providers: [
        ChangeNotifierProvider.value(
            value: Authentication(),
        )
      ],
      
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Your Tea',
        theme: ThemeData(
          primaryColor: Colors.blue,
        ),
        home: SplashScreen(),
        routes: {
          SplashScreen.routeName: (ctx)=> SplashScreen(),
          LoginSignup.routeName: (ctx)=> LoginSignup(),
          HomePage.routeName: (ctx)=> HomePage(),
          Profile.routeName: (ctx)=> Profile(),
          EditAccount.routeName: (ctx)=> EditAccount(),
          OrderPage.routeName: (ctx)=> OrderPage(),
          
        },
      ),
    );
  }
}
