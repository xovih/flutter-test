import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:kopkar_mart/models/product_model.dart';
import 'package:kopkar_mart/pages/product/components/product_card.dart';
import 'package:kopkar_mart/providers/product_provider.dart';
import 'package:lottie/lottie.dart';
import 'package:provider/provider.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';

class Body extends StatefulWidget {
  const Body({Key? key}) : super(key: key);

  @override
  _BodyState createState() => _BodyState();
}

class _BodyState extends State<Body> {
  int pageNumber = 1;
  List<ProductModel> product = [];
  RefreshController _refreshController =
      RefreshController(initialRefresh: true);

  @override
  Widget build(BuildContext context) {
    ProductProvider productProvider =
        Provider.of<ProductProvider>(context, listen: false);

    void _onRefresh() async {
      if (await productProvider.getProduct(1)) {
        setState(() {
          product = productProvider.products;
        });
        _refreshController.refreshCompleted();
      } else {
        _refreshController.refreshFailed();
      }
    }

    void _onLoading() async {
      setState(() {
        pageNumber++;
      });
      bool res = await productProvider.getProduct(pageNumber);
      if (res) {
        // print("mounted" + mounted.toString());
        setState(() {
          product.addAll(productProvider.products);
        });
        _refreshController.loadComplete();
      } else {
        _refreshController.loadFailed();
      }
    }

    return Expanded(
      child: SmartRefresher(
        enablePullUp: true,
        enablePullDown: true,
        header: WaterDropHeader(
          waterDropColor: Colors.deepOrange,
        ),
        footer: CustomFooter(
          builder: (context, mode) {
            Widget body;
            if (mode == LoadStatus.idle) {
              body = Column(
                children: [
                  Lottie.asset("assets/lottie/loading.json", width: 40),
                  Text(
                    "Lagi Dipersiapkan",
                    style: TextStyle(
                      color: Colors.deepOrange,
                      fontSize: 15,
                    ),
                  ),
                ],
              );
            } else if (mode == LoadStatus.loading) {
              body = Lottie.asset("assets/lottie/loading.json", width: 50);
            } else if (mode == LoadStatus.failed) {
              body = Text("Load Failed!Click retry!");
            } else if (mode == LoadStatus.canLoading) {
              body = Text("release to load more");
            } else {
              body = Text("No more Data");
            }
            return Container(
              height: 70.0,
              child: Center(child: body),
            );
          },
        ),
        controller: _refreshController,
        onRefresh: _onRefresh,
        onLoading: _onLoading,
        child: GridView.count(
          crossAxisCount: 3,
          childAspectRatio: 1 / 1.8,
          shrinkWrap: true,
          children: List.generate(
            product.length,
            (index) {
              return ProductCard(product: product[index]);
            },
          ),
        ),
      ),
    );
  }
}
