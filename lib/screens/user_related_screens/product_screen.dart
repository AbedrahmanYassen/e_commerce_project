import 'package:carousel_slider/carousel_slider.dart';
import 'package:ecommerce_app_training/models/product.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class ProductScreen extends StatelessWidget {
  final Product product;
  const ProductScreen({required this.product, Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.grey.shade200,
        elevation: 0.0,
        iconTheme: IconThemeData(color: Colors.black),
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              Container(
                child: Column(
                  children: [_buildProductInformationWidget()],
                ),
                width: double.infinity,
                // height: 150,
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
              SizedBox(
                width: MediaQuery.of(context).size.width / 2,
                height: 80,
                child: Image.network(
                  (product.brand == 'hp')
                      ? 'https://www.studentenwegwijzer.nl/wp-content/uploads/2016/07/HP-studentenkorting.jpeg'
                      : 'https://thumbs.dreamstime.com/b/golden-falcon-bird-vector-logo-design-white-background-182823944.jpg',
                  width: 150,
                  height: 150,
                ),
              ),
              const SizedBox(
                height: 30,
              ),
              Text(
                product.productName,
                style: TextStyle(
                  fontSize: 30,
                  fontWeight: FontWeight.w600,
                ),
              ),
              SizedBox(
                height: 15,
              ),
              Text(
                product.productPrice,
                style: TextStyle(
                  fontSize: 30,
                  fontWeight: FontWeight.w600,
                ),
              ),
              DescriptionPart(),
              AddTOCartAndFavouritesButtons()
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildProductInformationWidget() {
    return Column(
      children: [
        Padding(
            padding: const EdgeInsets.only(bottom: 15),
            child: CarouselSlider(
              options: CarouselOptions(
                autoPlay: true,
              ),
              items: [1, 2, 3].map((i) {
                return Builder(
                  builder: (BuildContext context) {
                    return Image.network(product.imageUrl);
                  },
                );
              }).toList(),
            )),
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

class DescriptionPart extends StatelessWidget {
  const DescriptionPart({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ExpansionTile(
      title: Text('Description', style: TextStyle(color: Colors.grey)),
      iconColor: Colors.grey,
      collapsedIconColor: Colors.grey,
      children: [
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Text(
            'This is the best product that wont regret about buying it trust me',
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
