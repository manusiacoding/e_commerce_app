import 'package:flutter/material.dart';
import 'package:saldah_shop/app/app_consts.dart';
import 'package:saldah_shop/models/api_response.dart';
import 'package:saldah_shop/screens/home_screen/home_screen.dart';
import 'package:saldah_shop/screens/signin_screen/signin_screen.dart';
import 'package:saldah_shop/services/user_services.dart';

class LoadingScreen extends StatefulWidget {
  const LoadingScreen({super.key});

  @override
  State<LoadingScreen> createState() => _LoadingScreenState();
}

class _LoadingScreenState extends State<LoadingScreen> {
  void _loadUserInfo() async {
    String token = await getToken();
    if (token == '') {
      Navigator.of(context).pushAndRemoveUntil(
          MaterialPageRoute(builder: (context) => SignInScreen()),
          (route) => false);
    } else {
      ApiResponse response = await getUserDetails();
      if (response.error == null) {
        Navigator.of(context).pushAndRemoveUntil(
            MaterialPageRoute(builder: (context) => HomeScreen()),
            (route) => false);
      } else if (response.error == unauthorized) {
        Navigator.of(context).pushAndRemoveUntil(
            MaterialPageRoute(builder: (context) => SignInScreen()),
            (route) => false);
      } else {
        ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text('${response.error}')));
      }
    }
  }

  @override
  void initState() {
    _loadUserInfo();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height,
      color: Colors.white,
      child: Center(
        // child: Image.network('https://media.giphy.com/media/LP01OPcV97bomkxOAk/giphy.gif'),
        child: CircularProgressIndicator(color: AppColors.darkGrey),
      ),
    );
  }
}
