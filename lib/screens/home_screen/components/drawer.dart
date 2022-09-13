import 'package:flutter/material.dart';
import 'package:saldah_shop/app/app_consts.dart';
import 'package:saldah_shop/screens/product_screen/list_product.dart';
import 'package:saldah_shop/screens/profile_screen/profile_screen.dart';
import 'package:saldah_shop/screens/signin_screen/signin_screen.dart';
import 'package:saldah_shop/services/user_services.dart';

class BuildDrawer extends StatefulWidget {
  const BuildDrawer({super.key});

  @override
  State<BuildDrawer> createState() => _BuildDrawerState();
}

class _BuildDrawerState extends State<BuildDrawer> {
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      child: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: [
            UserAccountsDrawerHeader(
              //membuat gambar profil
              currentAccountPicture: CircleAvatar(
                backgroundImage: AssetImage('assets/pictures/unnamed.jpg'),
              ),
              //membuat nama akun
              accountName: Text("Fawwaz Hudzalfah Saputra"),
              //membuat nama email
              accountEmail: Text("manusiacoding29@gmail.com"),
              //memberikan background
              decoration: BoxDecoration(color: AppColors.grey),
            ),
            ListTile(
              leading: Icon(Icons.person),
              title: Text("Profile"),
              onTap: () => Navigator.of(context).pushAndRemoveUntil(
                  MaterialPageRoute(builder: (context) => ProfileScreen()),
                  (route) => false),
            ),
            ListTile(
              leading: Icon(Icons.inventory),
              title: Text("My Products"),
              onTap: () => Navigator.of(context).pushAndRemoveUntil(
                  MaterialPageRoute(builder: (context) => ListProductScreen()),
                  (route) => false),
            ),
            ListTile(
              leading: Icon(Icons.list_alt),
              title: Text("My Orders"),
              onTap: () {},
            ),
            ListTile(
              leading: Icon(Icons.checklist),
              title: Text("My Wishlist"),
              onTap: () {},
            ),
            Divider(),
            ListTile(
              leading: Icon(Icons.info),
              title: Text("About"),
              onTap: () {},
            ),
            ListTile(
              leading: Icon(Icons.logout_outlined),
              title: Text("Logout"),
              onTap: () {
                logout().then((value) => {
                      Navigator.of(context).pushAndRemoveUntil(
                          MaterialPageRoute(
                              builder: (context) => SignInScreen()),
                          (route) => false)
                    });
              },
            ),
          ],
        ),
      ),
    );
  }
}
