import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class ProductScreen extends StatelessWidget {
  const ProductScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              Container(
                child: Column(
                  children: [
                    _buildUpperIconsInTheScreen(),
                    _buildProductInformationWidget()
                  ],
                ),
                width: MediaQuery.of(context).size.width,
                height: 300,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.only(
                      bottomLeft: Radius.circular(35),
                      bottomRight: Radius.circular(35)),
                  color: Colors.grey.shade200,
                ),
              ),
              const SizedBox(
                height: 30,
              ),
              _companyLogo(),
              const SizedBox(
                height: 30,
              ),
              Text(
                'Name product ',
                style: TextStyle(
                  fontSize: 30,
                  fontWeight: FontWeight.w600,
                ),
              ),
              Text(
                ' Price  product ',
                style: TextStyle(
                  fontSize: 30,
                  fontWeight: FontWeight.w600,
                ),
              ),
              SizeCollector(),
              DescriptionPart(),
              AddTOCartAndFavouritesButtons()
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildUpperIconsInTheScreen() {
    return Row(
      children: [
        IconButton(onPressed: () {}, icon: Icon(Icons.keyboard)),
        IconButton(onPressed: () {}, icon: Icon(Icons.keyboard_arrow_down))
      ],
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
    );
  }

  Widget _buildProductInformationWidget() {
    return Column(
      children: [
        Image.asset(
          'assets/images/images.png',
        ),
        //TODO : here i have to make the page view indicator
      ],
    );
  }

  Widget _companyLogo() {
    return Image.network(
      'https://static.nike.com/a/images/f_jpg,q_auto:eco/61b4738b-e1e1-4786-8f6c-26aa0008e80b/swoosh-logo-black.png',
      width: 50,
      height: 50,
    );
  }
}

class SizeCollector extends StatefulWidget {
  const SizeCollector({Key? key}) : super(key: key);

  @override
  _SizeCollectorState createState() => _SizeCollectorState();
}

class _SizeCollectorState extends State<SizeCollector> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                'Size',
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
              Text(
                'size Guide',
                style: TextStyle(color: Colors.grey),
              ),
            ],
          ),
          SizedBox(
            width: MediaQuery.of(context).size.width,
            height: 80,
            child: ListView.builder(
              itemCount: 7,
              scrollDirection: Axis.horizontal,
              itemBuilder: (context, index) {
                return Card(
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(15)),
                  child: Container(
                    width: 70,
                    height: 90,
                    child: Center(
                      child: Text('sizes'),
                    ),
                  ),
                );
              },
            ),
          )
        ],
      ),
    );
  }
}

class DescriptionPart extends StatelessWidget {
  const DescriptionPart({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ExpansionTile(
      title: Text('description'),
      children: [
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Text(
            'This is the best product that wont regret about buying it trust me ',
          ),
        ),
      ],
    );
  }
}

class AddTOCartAndFavouritesButtons extends StatelessWidget {
  const AddTOCartAndFavouritesButtons({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          SizedBox(
            width: 60,
            height: 60,
            child: OutlinedButton(
              onPressed: () {},
              child: Center(
                child: FaIcon(
                  FontAwesomeIcons.heart,
                  color: Colors.black,
                ),
              ),
            ),
          ),
          SizedBox(
            width: MediaQuery.of(context).size.width * 0.75,
            height: 60,
            child: ElevatedButton(
              style: ElevatedButton.styleFrom(
                primary: Colors.black,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(35),
                ),
              ),
              onPressed: () {},
              child: Text('Add to Cart'),
            ),
          ),
        ],
      ),
    );
  }
}
