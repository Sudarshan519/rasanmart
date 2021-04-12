import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:rasanmart/controller/authController.dart';
import 'package:rasanmart/controller/dashBoardController.dart';
import 'package:rasanmart/controller/userController.dart';
import 'package:rasanmart/services/authService.dart';
import 'package:rasanmart/services/getStorage.dart';
import 'package:rasanmart/views/account/account.dart';
import 'package:rasanmart/views/home/home.dart';
import 'package:rasanmart/views/login/login.dart';
import 'package:rasanmart/views/orderpage/orderpage.dart';
import '../settings/settings.dart';

class DashboardPage extends GetWidget {
  final authController = Get.find<AuthController>();
  final userControlelr = Get.find<UserController>();
  final DashboardController c = Get.put(DashboardController());
  final scaffoldKey = GlobalKey<ScaffoldState>();
  Widget _createHeader() {
    return DrawerHeader(
        margin: EdgeInsets.zero,
        padding: EdgeInsets.zero,
        decoration: BoxDecoration(
            color: Colors.black,
            image: DecorationImage(
                fit: BoxFit.fill,
                image: NetworkImage(
                    'https://images.unsplash.com/photo-1532074205216-d0e1f4b87368?ixid=MXwxMjA3fDB8MHxzZWFyY2h8MjJ8fHByb2ZpbGV8ZW58MHx8MHw%3D&ixlib=rb-1.2.1&w=1000&q=80'))),
        child: Stack(children: <Widget>[
          Positioned(
              bottom: 12.0,
              left: 16.0,
              child: Text("${'flutter'.tr} Step-by-Step",
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 20.0,
                      fontWeight: FontWeight.w500))),
        ]));
  }

  Widget _buildDrawer(context) {
    return Drawer(
      child: Container(
        //  color: Theme.of(context).primaryColor,
        width: MediaQuery.of(context).size.width * .7,
        child: ListView(
          padding: EdgeInsets.zero,
          children: [
            Obx(() => authController.user != null
                ? UserAccountsDrawerHeader(
                    decoration: BoxDecoration(
                      color: Theme.of(context).backgroundColor,
                      image: DecorationImage(
                        image: NetworkImage(
                            'https://images.unsplash.com/photo-1466112928291-0903b80a9466?ixid=MXwxMjA3fDB8MHxzZWFyY2h8Nnx8cHJvZmlsZXxlbnwwfHwwfA%3D%3D&ixlib=rb-1.2.1&auto=format&fit=crop&w=500&q=60'),
                        // 'https://images.unsplash.com/photo-1532074205216-d0e1f4b87368?ixid=MXwxMjA3fDB8MHxzZWFyY2h8MjJ8fHByb2ZpbGV8ZW58MHx8MHw%3D&ixlib=rb-1.2.1&w=1000&q=80'),
                        fit: BoxFit.cover,
                        colorFilter: new ColorFilter.mode(
                            Colors.black.withOpacity(0.8), BlendMode.colorBurn),
                      ),
                    ),
                    accountName: Obx(() =>
                        Text(
                          authController.user.displayName ?? '',
                          style:
                              TextStyle(color: Theme.of(context).accentColor),
                        ) ??
                        Text('')),
                    accountEmail: Obx(() => Text(
                          authController.user.email ?? '',
                          style:
                              TextStyle(color: Theme.of(context).accentColor) ??
                                  Text(''),
                        )),
                    currentAccountPicture: CircleAvatar(
                      radius: 30,
                      backgroundColor: Colors.teal,
                      child: CircleAvatar(
                          radius: 34,
                          backgroundImage:
                              NetworkImage(authController.user.photoURL) ??
                                  NetworkImage(
                                    "https://images.unsplash.com/photo-1511367461989-f85a21fda167?ixid=MXwxMjA3fDB8MHxzZWFyY2h8Mnx8cHJvZmlsZXxlbnwwfHwwfA%3D%3D&ixlib=rb-1.2.1&auto=format&fit=crop&w=600&q=60",
                                  )),
                    ),
                  )
                : _createHeader()),
            ListTile(
              leading: Icon(Icons.home),
              title: Text('home'.tr),
              onTap: () {},
            ),
            Obx(() {
              if (authController.user != null)
                return ListTile(
                  leading: Icon(Icons.language),
                  title: Text('MyOrders'),
                  onTap: () {
                    Get.to(
                      () => OrderPage(),
                    );
                  },
                );
              else {
                return Container();
              }
            }),
            ListTile(
              leading: Icon(Icons.settings),
              title: Text('settings'.tr),
              onTap: () {
                Get.to(SettingsPage());
              },
            ),
            ListTile(
              leading: Icon(Icons.person),
              title: Text('profile'.tr),
              onTap: () {
                Get.to(
                  Profile(),
                );
              },
            ),
            ListTile(
                leading: Icon(Icons.category),
                title: Text('Categories'),
                onTap: () {}),
            Obx(() => authController.user != null
                ? ListTile(
                    onTap: () {
                      allStorage.clear();
                      authService.signOut();
                    },
                    leading: Icon(Icons.logout),
                    title: Text('Log Out'))
                : Text('')),
          ],
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: scaffoldKey,
      body: Obx(() {
        switch (c.selectedIndex.value) {
          case 0:
            return Home(
              scaffoldKey: scaffoldKey,
            );

            break;

          case 1:
            return AccountContent();
          default:
            return Home();
        }
      }),
      drawer: _buildDrawer(context),
      floatingActionButton: FloatingActionButton(
        backgroundColor: Theme.of(context).backgroundColor,
        onPressed: () {
          if (authController.user != null) {
            Get.to(Scaffold(
              body: Center(
                child: Column(
                  children: [Text('Pay with ')],
                ),
              ),
            ));
          } else
            Get.to(LoginView());
        },
        child: Icon(
          Icons.qr_code,
          color: Colors.white,
          size: 33,
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      bottomNavigationBar: Obx(() {
        return BottomAppBar(
          shape: CircularNotchedRectangle(),
          notchMargin: 6,
          color: Colors.blueGrey,
          clipBehavior: Clip.antiAlias,
          child: BottomNavigationBar(
              selectedItemColor: Theme.of(context).backgroundColor,
              unselectedItemColor: Colors.blueGrey,
              currentIndex: c.selectedIndex.value ?? 0,
              onTap: (index) {
                c.changevalue(index);
              },
              items: [
                BottomNavigationBarItem(
                  icon: InkWell(
                      child: Icon(
                    FontAwesomeIcons.home,
                  )),
                  label: "home".tr,
                ),

                // BottomNavigationBarItem(
                //   icon: Icon(FontAwesomeIcons.tags),
                //   label: 'Categories',
                // ),
                BottomNavigationBarItem(
                  icon: Icon(FontAwesomeIcons.user),
                  label: 'account'.tr,
                ),
              ]),
        );
      }),
    );
  }
}
