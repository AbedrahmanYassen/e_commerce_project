import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class ListOfProducts extends StatelessWidget {
  const ListOfProducts({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          _buildListHeader(),
          Expanded(
            child: ListView.builder(
              itemBuilder: (context, index) {
                return ProductCard();
              },
              itemCount: 10,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildListHeader() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          'Category',
          style: TextStyle(fontWeight: FontWeight.bold, fontSize: 30),
        ),
        Row(
          children: [
            Text(
              'sort by ',
              style: TextStyle(fontWeight: FontWeight.w500),
            ),
            IconButton(
              onPressed: () {},
              icon: Icon(Icons.keyboard_arrow_down),
            ),
          ],
        )
      ],
    );
  }
}

class ProductCard extends StatelessWidget {
  const ProductCard({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 15, bottom: 15),
      child: GestureDetector(
        onTap: () {},
        child: Card(
          elevation: 0.1,
          color: Color.fromRGBO(246, 246, 246, 1),
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(35)),
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const SizedBox(
                    height: 15,
                  ),
                  IconButton(
                    onPressed: () {},
                    icon: FaIcon(FontAwesomeIcons.heart),
                  ),
                ],
              ),
              Container(
                width: 100,
                height: 100,
                decoration: BoxDecoration(
                  image: DecorationImage(
                      image: AssetImage(
                        'assets/images/images.png',
                      ),
                      fit: BoxFit.fill),
                ),
              ),
              const SizedBox(
                height: 15,
              ),
              const Text(
                'name of the shoes ',
                style: TextStyle(fontWeight: FontWeight.w600, fontSize: 20),
              ),
              const SizedBox(
                height: 15,
              ),
              const Text('the price of the shoe '),
              const SizedBox(
                height: 15,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
