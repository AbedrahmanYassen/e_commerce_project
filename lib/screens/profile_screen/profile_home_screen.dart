import 'package:ecommerce_app_training/models/User.dart';
import 'package:ecommerce_app_training/providers/profile_screen_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    UserDataProvider profileScreenProvider =
        Provider.of(context, listen: false);
    profileScreenProvider.getTheUserData();
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          iconTheme: IconThemeData(color: Colors.black),
          backgroundColor: Colors.grey.shade200,
          elevation: 0.0,
        ),
        body: SingleChildScrollView(
          child: Column(
            children: [
              UpperPartFromProfileScreen(),
              SizedBox(
                height: 100,
              ),
              UserData(
                user: profileScreenProvider.user,
              )
            ],
          ),
        ),
      ),
    );
  }
}

class UpperPartFromProfileScreen extends StatelessWidget {
  const UpperPartFromProfileScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    double screenHeight = MediaQuery.of(context).size.height;
    return Stack(
      children: [
        Container(
          width: double.infinity,
          height: 200,
          color: Colors.grey.shade200,
        ),
        Positioned(
          left: screenWidth / 2 - (screenWidth / 2.5) / 2,
          bottom: 0.0,
          child: FractionalTranslation(
            translation: Offset(0.0, 0.5),
            child: Container(
              width: screenWidth / 2.5,
              height: screenWidth / 2.5,
              decoration:
                  BoxDecoration(shape: BoxShape.circle, color: Colors.white),
            ),
          ),
        ),
        Positioned(
          left: screenWidth / 2 - (screenWidth / 3) / 2,
          bottom: 0.0,
          child: FractionalTranslation(
            translation: Offset(0.0, 0.5),
            child: Container(
              width: screenWidth / 3,
              height: screenWidth / 3,
              decoration: BoxDecoration(
                border: Border.all(color: Colors.grey.shade200),
                shape: BoxShape.circle,
                image: DecorationImage(
                  image: ExactAssetImage(
                    'assets/images/img.png',
                  ),
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }
}

class UserData extends StatelessWidget {
  final User user;
  const UserData({required this.user, Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        _buildDataField(fieldName: 'Name', fieldValue: user.name),
        _buildDataField(fieldName: 'Email', fieldValue: user.email),
        _buildDataField(fieldName: 'Type', fieldValue: user.type),
        Card(
          child: ListTile(
            onTap: () {
              //TODO:handling the tile
            },
            tileColor: Colors.yellow,
            title: Text('Favourites'),
            trailing: Icon(
              Icons.favorite,
              color: Colors.red,
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildDataField(
      {required String fieldName, required String fieldValue}) {
    return Card(
      child: ListTile(
        title: Text('$fieldName :'),
        trailing: Text(fieldValue),
      ),
    );
  }
}
