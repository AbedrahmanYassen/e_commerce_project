import 'package:ecommerce_app_training/providers/admin_related_providers/add_screen_manager.dart';
import 'package:ecommerce_app_training/providers/admin_related_providers/edit_screen_manager.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:provider/provider.dart';

class EditScreen extends StatefulWidget {
  final String documentId;
  final String currentName;
  final double currentPrice;
  final String currentCategory;
  final String description;
  final String currentImage;

  const EditScreen(
      {required this.currentName,
      required this.currentImage,
      required this.currentCategory,
      required this.description,
      required this.currentPrice,
      required this.documentId,
      Key? key})
      : super(key: key);

  @override
  _EditScreenState createState() => _EditScreenState();
}

class _EditScreenState extends State<EditScreen> {
  late TextEditingController nameController;
  late TextEditingController priceController;
  late TextEditingController categoryController;
  late TextEditingController descriptionController;
  @override
  void initState() {
    super.initState();
    nameController = new TextEditingController(text: widget.currentName);
    priceController =
        new TextEditingController(text: widget.currentPrice.toString());
    categoryController =
        new TextEditingController(text: widget.currentCategory);
    descriptionController = new TextEditingController(text: widget.description);
  }

  @override
  void dispose() {
    super.dispose();
    nameController.dispose();
    priceController.dispose();
    categoryController.dispose();
    descriptionController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    EditScreenManager editScreenManager =
        Provider.of<EditScreenManager>(context, listen: false);
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
                          textEditingController: nameController,
                        ),
                        TextFieldForAddScreen(
                          hintText: 'Price',
                          width: 300,
                          height: 100,
                          textEditingController: priceController,
                        ),
                        TextFieldForAddScreen(
                          hintText: 'Category',
                          width: 300,
                          height: 100,
                          textEditingController: categoryController,
                        ),
                        TextFieldForAddScreen(
                          hintText: 'Description',
                          width: 300,
                          height: 100,
                          textEditingController: descriptionController,
                        ),
                        ImagePicker(),
                        DataUploaderToTheDatabase(
                          function: () {
                            editScreenManager.updateUser(
                              documentId: widget.currentName,
                              name: nameController.text,
                              price: priceController.text,
                              category: categoryController.text,
                              description: descriptionController.text,
                              imageUrl: 'imageUrl',
                            );
                          },
                        )
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
            children: [Text('Change Image '), Icon(Icons.add_photo_alternate)],
          ),
        ),
      ),
    );
  }
}

class DataUploaderToTheDatabase extends StatelessWidget {
  const DataUploaderToTheDatabase({required this.function, Key? key})
      : super(key: key);
  final Function function;
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
          onPressed: () {
            function();
          },
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                'Save Changes',
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
