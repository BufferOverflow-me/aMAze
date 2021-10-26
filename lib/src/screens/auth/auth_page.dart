import 'package:fitness_app/src/screens/auth/login_page.dart';
import 'package:fitness_app/src/screens/auth/sign_up_page.dart';
import 'package:fitness_app/src/widgets/theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class AuthPage extends StatefulWidget {
  const AuthPage({Key? key}) : super(key: key);

  @override
  State<AuthPage> createState() => _AuthPageState();
}

class _AuthPageState extends State<AuthPage>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 2, vsync: this);
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        appBar: AppBar(
            bottom: PreferredSize(
          preferredSize: Size.fromHeight(size.height * 0.15),
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  MyTheme.appName,
                  style: Theme.of(context).textTheme.headline1,
                ),
                TabBar(
                  tabs: [
                    Tab(
                      child: Text(
                        "Login",
                        style: Theme.of(context).textTheme.headline5,
                      ),
                    ),
                    Tab(
                      child: Text(
                        "Register",
                        style: Theme.of(context).textTheme.headline5,
                      ),
                    ),
                  ],
                  controller: _tabController,
                ),
              ],
            ),
          ),
        )),
        body: TabBarView(
          controller: _tabController,
          children: [
            LoginInPage(),
            SignUpPage(),
          ],
        ),
      ),
    );
  }
}
