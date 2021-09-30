import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:kopkar_mart/common/constants.dart';
import 'package:kopkar_mart/models/product_model.dart';

class ProductCard extends StatelessWidget {
  const ProductCard({Key? key, required this.product, this.onTap})
      : super(key: key);

  final ProductModel product;
  final onTap;

  @override
  Widget build(BuildContext context) {
    final currencyFormatter =
        NumberFormat.currency(locale: 'id', decimalDigits: 0, symbol: 'Rp. ');

    return GestureDetector(
      onTap: onTap,
      child: Container(
        child: Card(
          elevation: 3,
          shadowColor: Colors.black,
          color: Colors.white,
          child: Column(
            children: [
              ClipRRect(
                borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(3.0),
                    topRight: Radius.circular(3.0)),
                child: FadeInImage(
                  height: 125,
                  image: NetworkImage(
                    product.photo!,
                  ),
                  fit: BoxFit.fill,
                  placeholder: AssetImage("assets/images/noimage.jpg"),
                ),
              ),
              Container(
                padding: EdgeInsets.only(left: 10.0, right: 10.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(
                      height: 8,
                    ),
                    Container(
                      padding: EdgeInsets.only(top: 5.0),
                      child: Text(
                        "Sisa ${product.stock}",
                        style: TextStyle(
                            color: kPrimaryColor,
                            fontSize: 8,
                            fontWeight: FontWeight.bold),
                      ),
                    ),
                    Container(
                      child: Text(
                        product.productName!,
                        maxLines: 3,
                        style: TextStyle(
                          color: Colors.black,
                          fontSize: 11,
                        ),
                      ),
                    ),
                    Container(
                      padding: EdgeInsets.only(top: 5.0),
                      child: Text(
                        currencyFormatter.format(
                          product.price,
                        ),
                        style: TextStyle(
                            color: kPrimaryColor,
                            fontSize: 10,
                            fontWeight: FontWeight.bold),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
