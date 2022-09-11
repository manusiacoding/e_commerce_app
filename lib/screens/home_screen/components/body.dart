import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:saldah_shop/screens/home_screen/components/category_list.dart';
import 'package:saldah_shop/screens/home_screen/components/category_title.dart';
import 'package:saldah_shop/screens/home_screen/components/feed_news.dart';
import 'package:saldah_shop/screens/home_screen/components/popular_list.dart';
import 'package:saldah_shop/screens/home_screen/components/search_bar.dart';
import 'package:saldah_shop/screens/signin_screen/signin_screen.dart';
import 'package:saldah_shop/services/user_services.dart';

class Body extends StatefulWidget {
  const Body({super.key});

  @override
  State<Body> createState() => _BodyState();
}

class _BodyState extends State<Body> {
  final GlobalKey<ScaffoldState> scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: scaffoldKey,
      drawer: _buildDrawer(),
      appBar: appBar(),
      body: const CustomScrollView(
        physics: BouncingScrollPhysics(),
        slivers: [
          SliverToBoxAdapter(
            child: SizedBox(height: 15),
          ),
          SearchBar(),
          SliverToBoxAdapter(
            child: SizedBox(height: 20),
          ),
          FeedNews(),
          SliverToBoxAdapter(
            child: SizedBox(height: 15),
          ),
          CategoryTitle(title: 'Category', trailingTitle: 'View All'),
          HomeCategoryList(),
          CategoryTitle(title: 'Popular', trailingTitle: 'View All'),
          HomePopularList(),
        ],
      ),
    );
  }

  Widget _buildDrawer() {
    return SizedBox(
      child: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: [
            UserAccountsDrawerHeader(
              //membuat gambar profil
              currentAccountPicture: CircleAvatar(
                backgroundImage: AssetImage('assets/pictures/1.png'),
              ),
              //membuat nama akun
              accountName: Text("Sahretech"),
              //membuat nama email
              accountEmail: Text("ig: @sahretech"),
              //memberikan background
              decoration: BoxDecoration(
                  image: DecorationImage(
                      image: NetworkImage(
                          "https://cdn.pixabay.com/photo/2016/04/24/20/52/laundry-1350593_960_720.jpg"),
                      fit: BoxFit.cover)),
            ),
            ListTile(
              leading: Icon(Icons.home),
              title: Text("Beranda"),
              onTap: () {},
            ),
            ListTile(
              leading: Icon(Icons.people),
              title: Text("Pegawai"),
              onTap: () {},
            ),
            ListTile(
              leading: Icon(Icons.money),
              title: Text("Transaksi"),
              onTap: () {},
            ),
            Divider(),
            ListTile(
              leading: Icon(Icons.emoji_emotions),
              title: Text("Profil"),
              onTap: () {},
            ),
            ListTile(
              leading: Icon(Icons.info),
              title: Text("Tentang"),
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

  AppBar appBar() {
    return AppBar(
      elevation: 0,
      backgroundColor: Colors.white,
      centerTitle: true,
      leading: IconButton(
        icon: SvgPicture.asset(
          'assets/svg/drawer_menu.svg',
          fit: BoxFit.fill,
        ),
        onPressed: () {
          scaffoldKey.currentState?.openDrawer();
        },
      ),
      // leading: Padding(
      //   padding: const EdgeInsets.all(12.0),
      //   child: SvgPicture.asset('assets/svg/drawer_menu.svg'),
      // ),
      title: const Text(
        'Saldah shop',
        style: TextStyle(
          fontSize: 16,
          color: Colors.black,
          fontWeight: FontWeight.bold,
        ),
      ),
      actions: [
        Stack(
          clipBehavior: Clip.none,
          alignment: Alignment.center,
          children: [
            SvgPicture.asset(
              'assets/svg/message.svg',
              height: 20,
              width: 20,
              color: Colors.black,
            ),
            const Positioned(
              bottom: 32,
              right: -3,
              child: CircleAvatar(
                radius: 4,
                backgroundColor: Colors.red,
              ),
            ),
          ],
        ),
        const SizedBox(width: 15),
        Stack(
          clipBehavior: Clip.none,
          alignment: Alignment.center,
          children: [
            SvgPicture.asset(
              'assets/svg/shop.svg',
              height: 20,
              width: 20,
              color: Colors.black,
            ),
            const Positioned(
              bottom: 32,
              right: -5,
              child: CircleAvatar(
                radius: 4,
                backgroundColor: Colors.red,
              ),
            ),
          ],
        ),
        const SizedBox(width: 15),
      ],
    );
  }
}
