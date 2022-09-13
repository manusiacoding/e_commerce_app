import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:saldah_shop/app/app_consts.dart';
import 'package:saldah_shop/screens/cart_screen/cart_screen.dart';
import 'package:saldah_shop/screens/home_screen/components/category_list.dart';
import 'package:saldah_shop/screens/home_screen/components/category_title.dart';
import 'package:saldah_shop/screens/home_screen/components/drawer.dart';
import 'package:saldah_shop/screens/home_screen/components/feed_news.dart';
import 'package:saldah_shop/screens/home_screen/components/popular_list.dart';
import 'package:saldah_shop/screens/home_screen/components/search_bar.dart';
import 'package:saldah_shop/screens/message_screen/message_screen.dart';
import 'package:saldah_shop/screens/product_screen/list_product.dart';
import 'package:saldah_shop/screens/profile_screen/profile_screen.dart';
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
    return SafeArea(
      child: Scaffold(
        key: scaffoldKey,
        drawer: BuildDrawer(),
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
            CategoryTitle(title: 'New Products', trailingTitle: 'View All'),
            HomePopularList(),
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
            IconButton(
              onPressed: () => Navigator.of(context).pushAndRemoveUntil(
                  MaterialPageRoute(builder: (context) => MessageScreen()),
                  (route) => false),
              icon: SvgPicture.asset(
                'assets/svg/message.svg',
                height: 17,
                width: 17,
                color: Colors.black,
              ),
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
        const SizedBox(width: 8),
        Stack(
          clipBehavior: Clip.none,
          alignment: Alignment.center,
          children: [
            IconButton(
              onPressed: () => Navigator.of(context).pushAndRemoveUntil(
                  MaterialPageRoute(builder: (context) => CartScreen()),
                  (route) => false),
              icon: SvgPicture.asset(
                'assets/svg/shop.svg',
                height: 17,
                width: 17,
                color: Colors.black,
              ),
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
