import 'package:flutter/material.dart';
import 'widgets/const.dart';

class AccountContent extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    return Scaffold(
      backgroundColor: Theme.of(context).backgroundColor,
      body: SafeArea(
        child: SingleChildScrollView(
          physics: BouncingScrollPhysics(),
          child: Column(
            children: [
              Container(
                height: 120,
                color: Colors.grey[200],
                child: Container(
                  color: Colors.grey[200],
                  width: double.infinity,
                  height: 120,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Text(''),
                      Row(
                        children: [
                          SizedBox(
                            width: 20,
                          ),
                          CircleAvatar(
                            backgroundColor: Colors.grey.shade400,
                            radius: 40,
                            child:
                                // SvgPicture.asset('assets/icons/account.svg',
                                Icon(Icons.person,
                                    color: Theme.of(context).primaryColor),
                          ),
                          SizedBox(
                            width: 20,
                          ),
                          Column(
                              mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text('Sudarshan Shrestha',
                                    style: kTitleStyle.copyWith(
                                        color: Colors.black)),
                                Text(
                                  '9484848484',
                                  style: subtitleStyle.copyWith(
                                      color: Colors.black),
                                ),
                                TextButton(
                                  style: TextButton.styleFrom(
                                    primary: Colors.red,
                                    shape: RoundedRectangleBorder(
                                        borderRadius:
                                            BorderRadius.circular(20)),
                                  ),
                                  child: Text('N/A >'),
                                  onPressed: () {},
                                ),
                              ]),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
              SpaceBox(),
              Container(
                color: Colors.grey[200],
                height: height * .2,
                padding: EdgeInsets.only(top: 20),
                child: Column(
                  children: [
                    Text(
                      'Account ',
                      style: headingStyle,
                    ),
                    Row(
                      children: [
                        CircleAvatar(
                            radius: 20,
                            backgroundColor: Colors.transparent,
                            child: Icon(Icons.person)),
                        SizedBox(width: 20),
                        Text(
                          'Profile',
                          style: titleStyle,
                        ),
                      ],
                    ),
                    Divider(color: Colors.white30),
                    Row(
                      children: [
                        SizedBox(
                          width: 10,
                        ),
                        Icon(Icons.business, color: Colors.red),
                        SizedBox(width: 20),
                        Text(
                          'Business Profile',
                          style: titleStyle,
                        ),
                      ],
                    ),
                    // ListTile(
                    //     leading: Icon(Icons.business),
                    //     title: Text(
                    //       'Bussiness profile',
                    //       style: subtitleStyle,
                    //     )),
                    // Divider(),
                    // ListTile(
                    //     leading: Icon(Icons.star), title: Text('Saved Address')),
                  ],
                ),
              ),
              SpaceBox(),
              Container(
                color: Colors.grey[200],
                padding: EdgeInsets.only(top: 20),
                height: height * .4,
                child: Column(
                  children: [
                    Text('Account ', style: headingStyle),
                    Row(
                      children: [
                        CircleAvatar(
                            radius: 20,
                            backgroundColor: Colors.transparent,
                            child: Icon(Icons.person)),
                        SizedBox(
                          width: 20,
                        ),
                        Text(
                          'Profile',
                          style: titleStyle,
                        ),
                      ],
                    ),
                    Divider(
                      color: Colors.white54,
                    ),
                    ListTile(
                        leading: Icon(Icons.business, color: Colors.red[400]),
                        title: Text(
                          'Bussiness profile',
                          style: titleStyle,
                        )),
                    Divider(
                      color: Colors.white30,
                    ),
                    ListTile(
                        leading: Icon(Icons.star),
                        title: Text(
                          'Saved Address',
                          style: titleStyle,
                        )),
                  ],
                ),
              ),
              SpaceBox(),
              Container(
                color: Colors.grey[200],
                height: height * .3,
                child: Column(
                  children: [
                    Text('Settings '),
                    SizedBox(height: 10),
                    Row(
                      children: [
                        SizedBox(width: 20),
                        CircleAvatar(
                            radius: 10, child: Icon(Icons.person, size: 10)),
                        SizedBox(width: 20),
                        Text(
                          'Language',
                          style: subtitleStyle,
                        ),
                      ],
                    ),
                    Divider(),
                    ListTile(
                        leading: Icon(Icons.business),
                        title: Text('Bussiness profile', style: subtitleStyle)),
                    Divider(),
                    ListTile(
                        leading: Icon(Icons.star),
                        title: Text('Saved Address',
                            style:
                                subtitleStyle.copyWith(color: Colors.black))),
                  ],
                ),
              ),
              SpaceBox(),
              Container(
                color: Colors.grey[200],
                child: ListTile(
                  leading: Icon(
                    Icons.logout,
                    color: Colors.grey,
                  ),
                  title: Text('Log out',
                      style: subtitleStyle.copyWith(color: Colors.black)),
                ),
              ),
              Center(child: Text('Version 7.4.1', style: subtitleStyle))
            ],
          ),
        ),
      ),
    );
  }
}
