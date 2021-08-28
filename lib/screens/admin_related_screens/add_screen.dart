import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class AddScreen extends StatelessWidget {
  const AddScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.only(top: 30, bottom: 30),
                child: Center(
                  child: Container(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Container(
                          width: 150,
                          height: 150,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(20),
                            image: DecorationImage(
                              image: AssetImage('assets/images/add.jpg'),
                            ),
                          ),
                        ),
                        TextFieldForAddScreen(
                          hintText: 'Name',
                          width: 300,
                          height: 100,
                          textEditingController: new TextEditingController(),
                        ),
                        TextFieldForAddScreen(
                          hintText: 'Price',
                          width: 300,
                          height: 100,
                          textEditingController: new TextEditingController(),
                        ),
                        TextFieldForAddScreen(
                          hintText: 'Category',
                          width: 300,
                          height: 100,
                          textEditingController: new TextEditingController(),
                        ),
                        TextFieldForAddScreen(
                          hintText: 'Description',
                          width: 300,
                          height: 100,
                          textEditingController: new TextEditingController(),
                        ),
                        ImagePicker(),
                        DataUploaderToTheDatabase()
                      ],
                    ),
                    width: MediaQuery.of(context).size.width * 0.9,
                    height: MediaQuery.of(context).size.height * 0.9,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(40),
                        color: Colors.grey.shade200),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class TextFieldForAddScreen extends StatelessWidget {
  final TextEditingController textEditingController;
  final double width;
  final double height;
  final String hintText;
  const TextFieldForAddScreen(
      {required this.textEditingController,
      required this.height,
      required this.width,
      required this.hintText,
      Key? key})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 10),
      child: Container(
        decoration: BoxDecoration(
            color: Colors.grey.shade300,
            borderRadius: BorderRadius.circular(35)),
        child: SizedBox(
          width: width,
          // height: height,
          child: TextField(
            controller: textEditingController,
            cursorColor: Colors.black,
            decoration: InputDecoration(
              hintText: hintText,
              enabledBorder: OutlineInputBorder(
                  borderSide: BorderSide(
                    color: Colors.grey.shade100,
                  ),
                  borderRadius: BorderRadius.circular(35)),
              focusedBorder: OutlineInputBorder(
                  borderSide: BorderSide(
                    color: Colors.grey.shade100,
                  ),
                  borderRadius: BorderRadius.circular(35)),
            ),
          ),
        ),
      ),
    );
  }
}

class ImagePicker extends StatelessWidget {
  const ImagePicker({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: SizedBox(
        width: MediaQuery.of(context).size.width * 0.9,
        height: 60,
        child: ElevatedButton(
          style: ElevatedButton.styleFrom(
            primary: Colors.grey.shade400,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(35),
            ),
          ),
          onPressed: () {},
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [Text('Add image'), Icon(Icons.add_photo_alternate)],
          ),
        ),
      ),
    );
  }
}

class DataUploaderToTheDatabase extends StatelessWidget {
  const DataUploaderToTheDatabase({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: SizedBox(
        width: MediaQuery.of(context).size.width * 0.9,
        height: 60,
        child: ElevatedButton(
          style: ElevatedButton.styleFrom(
            primary: Colors.grey.shade400,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(35),
            ),
          ),
          onPressed: () {},
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                'Add',
                style: TextStyle(fontSize: 20),
              ),
              FaIcon(
                FontAwesomeIcons.database,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
