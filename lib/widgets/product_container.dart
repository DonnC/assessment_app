import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:relative_scale/relative_scale.dart';
import 'package:assessment_app/utils/index.dart';

Widget productContainer(var product, int index) {
  return RelativeBuilder(
            builder: (context, height, width, sy, sx) {
      return GestureDetector(
        onTap: () {},
        child: Container(
          width: sy(210),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(
              10,
            ),
          ),
          child: Column(
            children: [
              Container(
                height: sy(80),
                child: Stack(
                  children: [
                    Center(
                      child: CachedNetworkImage(
                        fit: BoxFit.cover,
                        imageUrl: product.image,
                        progressIndicatorBuilder:
                            (context, url, downloadProgress) => Center(
                          child: Padding(
                            padding: const EdgeInsets.only(top: 30),
                            child: CircularProgressIndicator(
                                value: downloadProgress.progress),
                          ),
                        ),
                        errorWidget: (context, url, error) => Center(
                          child: Padding(
                            padding: const EdgeInsets.all(30),
                            child: Column(
                              children: <Widget>[
                                Icon(Icons.error),
                                SizedBox(height: 30),
                                Text('Error loading product image')
                              ],
                            ),
                          ),
                        ),
                      ),
                    ),
                    Align(
                      alignment: Alignment.topRight,
                      child: IconButton(
                        icon: Icon(
                          Icons.favorite,
                          color: index.isOdd ? Colors.red : Colors.transparent,
                        ),
                        onPressed: () {},
                      ),
                    ),
                  ],
                ),
              ),
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        product.productClass,
                        style: TextStyle(
                          fontSize: sy(12),
                          color: Colors.grey,
                        ),
                      ),
                      Text(
                        product.name,
                        style: TextStyle(
                          fontSize: sy(13),
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                      Text(
                        'AED ${product.price.toStringAsFixed(2)}',
                        style: TextStyle(
                          fontSize: sy(15),
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      product.reviewVideoUrl.isEmpty
                          ? SizedBox.shrink()
                          : GestureDetector(
                              onTap: () {},
                              child: Row(
                                children: [
                                  Icon(
                                    Icons.remove_red_eye,
                                    color: reddishColor,
                                  ),
                                  SizedBox(width: 5),
                                  Text(
                                    'Watch Review',
                                    style: TextStyle(
                                      fontSize: sy(11),
                                      fontWeight: FontWeight.w600,
                                      color: reddishColor,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      );
    }
  );
}
