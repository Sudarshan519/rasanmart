
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:rasanmart/controller/authController.dart';
import 'package:rasanmart/controller/dashBoardController.dart';
import 'package:rasanmart/services/authService.dart';
import 'package:rasanmart/services/getStorage.dart';
import 'package:rasanmart/views/account/account.dart';
import 'package:rasanmart/views/home/home.dart';
import 'package:rasanmart/views/login/login.dart';
import '../settings/settings.dart';
class DashboardPage extends GetWidget {
  final authController = Get.find<AuthController>();
  final DashboardController c = Get.put(DashboardController());
  final scaffoldKey = GlobalKey<ScaffoldState>();

  Widget _buildDrawer(context) {
    return Drawer(
      child: ListView(
        children: [
        authController.user!=null?  UserAccountsDrawerHeader(
            decoration: BoxDecoration(color: Theme.of(context).backgroundColor),
            accountName: Obx(() =>
                Text(
                  authController.user.displayName??'',
                  style: TextStyle(color: Theme.of(context).primaryColor),
                ) ??
                Text('')),
            accountEmail: Obx(() => Text(
                  authController.user.email ?? '',
                  style: TextStyle(color: Theme.of(context).primaryColor)??Text(''),
                )),
            currentAccountPicture: CircleAvatar(
              backgroundColor: Colors.redAccent,
              // backgroundImage:
              //     NetworkImage(FirebaseAuth.instance.currentUser.photoURL??"https://www.google.com/imgres?imgurl=https%3A%2F%2Fimages.unsplash.com%2Fphoto-1511367461989-f85a21fda167%3Fixid%3DMXwxMjA3fDB8MHxzZWFyY2h8Mnx8cHJvZmlsZXxlbnwwfHwwfA%253D%253D%26ixlib%3Drb-1.2.1%26w%3D1000%26q%3D80&imgrefurl=https%3A%2F%2Funsplash.com%2Fs%2Fphotos%2Fprofile&tbnid=c4DKZX1IkCpVhM&vet=12ahUKEwipmvzludrvAhUCCisKHWUNCbIQMygAegUIARDRAQ..i&docid=b5C9ViMmmhpq-M&w=1000&h=563&q=profile%20image&safe=active&ved=2ahUKEwipmvzludrvAhUCCisKHWUNCbIQMygAegUIARDRAQ"),
              // backgroundImage: NetworkImage(authController.user.photoURL ??
              //         "https://www.google.com/imgres?imgurl=https%3A%2F%2Fimages.unsplash.com%2Fphoto-1511367461989-f85a21fda167%3Fixid%3DMXwxMjA3fDB8MHxzZWFyY2h8Mnx8cHJvZmlsZXxlbnwwfHwwfA%253D%253D%26ixlib%3Drb-1.2.1%26w%3D1000%26q%3D80&imgrefurl=https%3A%2F%2Funsplash.com%2Fs%2Fphotos%2Fprofile&tbnid=c4DKZX1IkCpVhM&vet=12ahUKEwipmvzludrvAhUCCisKHWUNCbIQMygAegUIARDRAQ..i&docid=b5C9ViMmmhpq-M&w=1000&h=563&q=profile%20image&safe=active&ved=2ahUKEwipmvzludrvAhUCCisKHWUNCbIQMygAegUIARDRAQ") ??
              //     Icon(Icons.person)
            ),
          ):  UserAccountsDrawerHeader(
            
            accountName: Text('exampleuser'), accountEmail: Text('example@gmail.com')),
          ListTile(
            leading: Icon(Icons.home),
            title: Text('Home'),
            onTap: () {},
          ),
          ListTile(
            leading: Icon(Icons.settings),
            title: Text('Settings'),
            onTap: (){
              Get.to(SettingsPage());
            },
          ),
          ListTile(
            leading: Icon(Icons.person),
            title: Text('Profile'),
            onTap: () {
              Get.to(
                AccountContent(),
              );
            },
          ),
          ListTile(
              leading: Icon(Icons.category),
              title: Text('Categories'),
              onTap: () {}),
          ListTile(
              onTap: () {
                cartStorage.clear();
                authService.signOut();
              },
              leading: Icon(Icons.logout),
              title: Text('Log Out'))
        ],
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
          Get.to(Login());
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
                  label: "Home",
                ),

                // BottomNavigationBarItem(
                //   icon: Icon(FontAwesomeIcons.tags),
                //   label: 'Categories',
                // ),
                BottomNavigationBarItem(
                  icon: Icon(FontAwesomeIcons.user),
                  label: 'Account',
                ),
              ]),
        );
      }),
    );
  }
}
