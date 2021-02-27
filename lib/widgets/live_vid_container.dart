import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:relative_scale/relative_scale.dart';
import 'package:assessment_app/utils/index.dart';

Widget liveVidContainer(var v) {
  return RelativeBuilder(builder: (context, height, width, sy, sx) {
    return GestureDetector(
      onTap: () {},
      child: Container(
        width: sy(210),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(
            10,
          ),
          border: Border.all(
            color: greyishColor,
          ),
        ),
        child: Column(
          children: [
            Container(
              height: sy(100),
              child: CachedNetworkImage(
                fit: BoxFit.fill,
                imageUrl: v.thumbnailUrl,
                progressIndicatorBuilder: (context, url, downloadProgress) =>
                    Center(
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
                        Text('Error loading live video thumbnail')
                      ],
                    ),
                  ),
                ),
              ),
            ),
            Expanded(
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          v.title,
                          style: TextStyle(
                            fontSize: sy(13),
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                        Text(
                          v.description,
                          style: TextStyle(
                            fontSize: sy(10),
                            color: Colors.grey,
                          ),
                        ),
                        Spacer(),
                        Text(
                          v.duration,
                          style: TextStyle(
                            fontSize: sy(12),
                            color: Colors.grey,
                          ),
                        ),
                      ],
                    ),
                    Spacer(),
                    InkWell(
                      onTap: () {},
                      child: Icon(
                        Icons.bookmark_outline,
                        color: Colors.grey,
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
  });
}
