import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:relative_scale/relative_scale.dart';

import 'package:assessment_app/models/index.dart';
import 'package:assessment_app/services/index.dart';
import 'package:assessment_app/utils/index.dart';
import 'package:assessment_app/widgets/index.dart';

class MainHomePage extends StatefulWidget {
  @override
  _MainHomePageState createState() => _MainHomePageState();
}

class _MainHomePageState extends State<MainHomePage> {
  final api = FetchData();

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return SafeArea(
      child: Scaffold(
        body: SingleChildScrollView(
          child: RelativeBuilder(
            builder: (context, height, width, sy, sx) {
              return FutureBuilder(
                future: api.getPresenterInfo(),
                builder: (context, snapshot) {
                  if (snapshot.hasData) {
                    final Presenter presenter = snapshot.data;
                    final List<LiveVideo> vid = presenter.videos;
                    final List<Product> products = presenter.products;
                    final List followers = presenter.followers;

                    return Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Container(
                          height: size.height * 0.6,
                          width: double.infinity,
                          decoration: BoxDecoration(
                            gradient: LinearGradient(
                              begin: Alignment.bottomCenter,
                              end: Alignment.center,
                              colors: [
                                Colors.white,
                                Colors.white,
                                Colors.white38,
                              ],
                            ),
                          ),
                          child: Stack(
                            children: [
                              Align(
                                alignment: Alignment.bottomCenter,
                                child: Container(
                                  height: size.height * 0.6 * 0.3,
                                  color: Colors.white,
                                ),
                              ),
                              Container(
                                height: size.height * 0.6,
                                width: size.width,
                                child: CachedNetworkImage(
                                  fit: BoxFit.cover,
                                  imageUrl: presenter.image,
                                  progressIndicatorBuilder:
                                      (context, url, downloadProgress) =>
                                          Center(
                                    child: Padding(
                                      padding: const EdgeInsets.only(top: 15),
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
                                          Text(
                                              'Error loading presenter profile image')
                                        ],
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                              Align(
                                alignment: Alignment.topCenter,
                                child: Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Row(
                                    children: [
                                      customIcon(Icons.arrow_back, () {}),
                                      SizedBox(width: 10),
                                      Text(
                                        'tienda',
                                        style: TextStyle(
                                          fontSize: 21,
                                          color: Colors.white,
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),
                                      Spacer(),
                                      customIcon(Icons.upload_outlined, () {}),
                                    ],
                                  ),
                                ),
                              ),
                              Positioned(
                                bottom: sy(55),
                                child: Padding(
                                  padding: EdgeInsets.symmetric(
                                    horizontal: sx(size.width * 0.45),
                                  ),
                                  child: Container(
                                    child: Column(
                                      children: [
                                        Text(
                                          '${presenter.fname} ${presenter.lname}',
                                          style: TextStyle(
                                            color: Colors.black,
                                            fontSize: sy(20),
                                            fontWeight: FontWeight.bold,
                                          ),
                                        ),
                                        Text(
                                          '${presenter.country}',
                                          style: TextStyle(
                                            color: Colors.grey[500],
                                            fontSize: sy(13),
                                            fontWeight: FontWeight.w600,
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                              ),
                              Align(
                                alignment: Alignment.bottomCenter,
                                child: Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Row(
                                    children: [
                                      Container(
                                        width: sx(size.width * 0.9),
                                        height: sy(40),
                                        decoration: BoxDecoration(
                                          color: greenColor,
                                        ),
                                        child: Center(
                                          child: Text(
                                            'Follow',
                                            style: TextStyle(
                                              color: Colors.white,
                                              fontWeight: FontWeight.bold,
                                            ),
                                          ),
                                        ),
                                      ),
                                      Spacer(),
                                      GestureDetector(
                                        onTap: () {},
                                        child: Container(
                                          height: sy(40),
                                          width: sx(size.width * 0.4),
                                          decoration: BoxDecoration(
                                            color: Colors.white,
                                            borderRadius:
                                                BorderRadius.circular(5),
                                            border: Border.all(
                                              color: Colors.grey,
                                            ),
                                          ),
                                          padding: const EdgeInsets.all(15),
                                          child: Center(
                                            child: Row(
                                              mainAxisAlignment:
                                                  MainAxisAlignment
                                                      .spaceBetween,
                                              children: [
                                                Icon(
                                                  Icons.chat_outlined,
                                                ),
                                                Text(
                                                  'Chat',
                                                  style: TextStyle(
                                                    color: Colors.black,
                                                    fontWeight: FontWeight.bold,
                                                  ),
                                                ),
                                              ],
                                            ),
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                        SizedBox(height: 25),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            statsContainer(vid.length, 'Live Videos'),
                            statsContainer(followers.length, 'Followers'),
                            statsContainer(
                                products.length, 'Featured Products'),
                          ],
                        ),
                        SizedBox(height: 25),
                        Row(
                          children: [
                            GestureDetector(
                              onTap: () {},
                              child: Column(
                                children: [
                                  Text(
                                    'About',
                                    style: TextStyle(
                                      color: greenColor,
                                      fontWeight: FontWeight.w600,
                                      fontSize: sy(13),
                                    ),
                                  ),
                                  SizedBox(height: 8),
                                  Container(
                                    height: 5,
                                    width: size.width * 0.5,
                                    color: greenColor,
                                  ),
                                ],
                              ),
                            ),
                            GestureDetector(
                              onTap: () {},
                              child: Column(
                                children: [
                                  Text(
                                    'Videos',
                                    style: TextStyle(
                                      color: Colors.grey,
                                      fontWeight: FontWeight.w600,
                                      fontSize: sy(13),
                                    ),
                                  ),
                                  SizedBox(height: 8),
                                  Container(
                                    height: 5,
                                    width: size.width * 0.5,
                                    color: Colors.grey,
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                        SizedBox(height: 15),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Text(
                            'Be confidently you',
                            style: TextStyle(
                              fontSize: sy(13),
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Text(
                            presenter.about,
                            style: TextStyle(
                              fontSize: sy(12.5),
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Text(
                            'Categories',
                            style: TextStyle(
                              fontSize: sy(13),
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Container(
                            height: sy(35),
                            child: ListView.separated(
                              scrollDirection: Axis.horizontal,
                              itemCount: api.getCategories().length,
                              separatorBuilder: (_, index) =>
                                  SizedBox(width: 10),
                              itemBuilder: (context, index) {
                                final category = api.getCategories()[index];

                                return GestureDetector(
                                  onTap: () {},
                                  child: Container(
                                    decoration: BoxDecoration(
                                      color: greyishColor,
                                      borderRadius:
                                          BorderRadius.circular(sy(20)),
                                    ),
                                    child: Padding(
                                      padding: const EdgeInsets.all(12),
                                      child: Center(
                                        child: Row(
                                          children: [
                                            Icon(
                                              Icons.message_outlined,
                                              color: Colors.black54,
                                              size: sy(15),
                                            ),
                                            SizedBox(width: 5),
                                            Text(
                                              category,
                                              style: TextStyle(
                                                fontSize: sy(12),
                                                color: Colors.black54,
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                    ),
                                  ),
                                );
                              },
                            ),
                          ),
                        ),
                        SizedBox(height: 20),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Row(
                            children: [
                              Text(
                                '${presenter.fname}\'s Live Videos',
                                style: TextStyle(
                                  fontSize: sy(13),
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              Spacer(),
                              GestureDetector(
                                onTap: () {},
                                child: Text(
                                  'SEE ALL',
                                  style: TextStyle(
                                    fontSize: sy(13),
                                    fontWeight: FontWeight.bold,
                                    color: reddishColor,
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Container(
                            height: sy(170),
                            child: ListView.separated(
                              scrollDirection: Axis.horizontal,
                              itemCount: vid.length,
                              separatorBuilder: (_, index) =>
                                  SizedBox(width: 10),
                              itemBuilder: (context, index) {
                                final v = vid[index];

                                return liveVidContainer(v);
                              },
                            ),
                          ),
                        ),
                        SizedBox(height: 20),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Row(
                            children: [
                              Text(
                                '${presenter.fname}\'s Products',
                                style: TextStyle(
                                  fontSize: sy(13),
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              Spacer(),
                              GestureDetector(
                                onTap: () {},
                                child: Text(
                                  'SEE ALL',
                                  style: TextStyle(
                                    fontSize: sy(13),
                                    fontWeight: FontWeight.bold,
                                    color: reddishColor,
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Container(
                            height: sy(170),
                            child: ListView.separated(
                              scrollDirection: Axis.horizontal,
                              itemCount: products.length,
                              separatorBuilder: (_, index) =>
                                  SizedBox(width: 10),
                              itemBuilder: (context, index) {
                                final product = products[index];

                                return productContainer(product, index);
                              },
                            ),
                          ),
                        ),
                        SizedBox(height: 20),
                        Padding(
                          padding: const EdgeInsets.only(left: 8.0, right: 8),
                          child: Row(
                            children: [
                              Text(
                                'Video of the Day',
                                style: TextStyle(
                                  fontSize: sy(13),
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              Spacer(),
                              GestureDetector(
                                onTap: () {},
                                child: Icon(
                                  Icons.notifications_outlined,
                                  color: Colors.black54,
                                ),
                              ),
                            ],
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(left: 8.0, right: 8),
                          child: Text(
                            'Selected by our curators',
                            style: TextStyle(
                              fontSize: sy(13),
                              color: Colors.grey,
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Container(
                            height: sy(180),
                            width: size.width,
                            decoration: BoxDecoration(
                              border: Border.all(
                                color: Colors.yellow,
                                width: 10,
                              ),
                            ),
                            child: FutureBuilder(
                              future: api.getVideoToday(),
                              builder: (context, snapshot) {
                                if (snapshot.hasData) {
                                  final LiveVideo today = snapshot.data;

                                  return CachedNetworkImage(
                                    fit: BoxFit.cover,
                                    imageUrl: today.thumbnailUrl,
                                    progressIndicatorBuilder:
                                        (context, url, downloadProgress) =>
                                            Center(
                                      child: Padding(
                                        padding: const EdgeInsets.only(top: 30),
                                        child: CircularProgressIndicator(
                                            value: downloadProgress.progress),
                                      ),
                                    ),
                                    errorWidget: (context, url, error) =>
                                        Center(
                                      child: Padding(
                                        padding: const EdgeInsets.all(30),
                                        child: Column(
                                          children: <Widget>[
                                            Icon(Icons.error),
                                            SizedBox(height: 30),
                                            Text(
                                                'Error loading video of today thumbnail')
                                          ],
                                        ),
                                      ),
                                    ),
                                  );
                                } else {
                                  return Center(
                                    child: CircularProgressIndicator(),
                                  );
                                }
                              },
                            ),
                          ),
                        ),
                        SizedBox(height: 20),
                        Padding(
                          padding: const EdgeInsets.only(left: 8.0, right: 8),
                          child: Row(
                            children: [
                              Text(
                                'Fashion & Clothing',
                                style: TextStyle(
                                  fontSize: sy(12),
                                  fontWeight: FontWeight.bold,
                                  color: bluishColor,
                                ),
                              ),
                              Spacer(),
                              GestureDetector(
                                onTap: () {},
                                child: Icon(
                                  Icons.bookmark_outline,
                                  color: Colors.black54,
                                ),
                              ),
                            ],
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(left: 8.0, right: 8),
                          child: Text(
                            'All About Hivebox Freezer',
                            style: TextStyle(
                              fontSize: sy(13),
                              fontWeight: FontWeight.bold,
                              color: Colors.black54,
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(left: 8.0, right: 8),
                          child: Text(
                            'Shonda describes what fuels her passion',
                            style: TextStyle(
                              fontSize: sy(12.5),
                              color: Colors.grey,
                            ),
                          ),
                        ),
                      ],
                    );
                  }

                  // wait for data
                  else {
                    return Center(
                      child: Padding(
                        padding: EdgeInsets.only(top: size.height * 0.3),
                        child: CircularProgressIndicator(),
                      ),
                    );
                  }
                },
              );
            },
          ),
        ),
      ),
    );
  }
}
