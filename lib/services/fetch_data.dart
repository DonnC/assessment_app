// service class to fetch data from api [Mock-Data]
import 'package:assessment_app/models/index.dart';

class FetchData {
  final String profileImage =
      'http://www.pngmart.com/files/16/Jennifer-Lawrence-Face-PNG-File.png';

  List<String> getCategories() {
    final categories = [
      'Fashion & Clothing',
      'Home Appliances',
      'Pet',
      'Beauty & Cosmetics',
      'Furniture',
      'Kitchen',
      'Gardening',
      'Food',
    ];

    return categories;
  }

  Future<Presenter> getPresenterInfo() async {
    // load dummy videos and products
    await Future.delayed(
      Duration(
        seconds: 5,
      ),
    );

    final vids = await getLiveVideos();
    final products = await getProducts();

    // https://www.pexels.com/photo/fashion-people-woman-summer-5037076/
    return Presenter(
      id: 1,
      fname: 'Fatima',
      lname: 'Soudi',
      image:
          'https://images.pexels.com/photos/5037076/pexels-photo-5037076.jpeg',
      country: 'Saudi Arabia',
      videos: vids,
      products: products,
      followers: List.generate(4000, (index) => index),
      about:
          '''Amet minim mollit non deserunt ullamco est sit aliqua dolor do amet sint. Velit officia consequat duis enim velit mollit. Exercitation veniam consequat sunt nostrud amet.

In 17 video lessons, Fatima Soudi will teach you how to build and market your fashion brand.
      ''',
    );
  }

  Future<List<LiveVideo>> getLiveVideos() async {
    await Future.delayed(
      Duration(
        seconds: 3,
      ),
    );

    // https://pixabay.com/photos/restaurant-cooking-chef-kitchen-1284351/
    return List<LiveVideo>.generate(
      15,
      (index) => LiveVideo(
        id: index,
        thumbnailUrl:
            'https://cdn.pixabay.com/photo/2016/03/27/21/34/restaurant-1284351_960_720.jpg',
        videoUrl:
            'https://cdn.videvo.net/videvo_files/video/free/2016-12/small_watermarked/FoodPack1_18_Videvo_preview.webm',
        title: 'All about Hivebox Freezer',
        description: 'Shonda describes what fuels her passion',
        duration: '1h 32m',
      ),
    );
  }

  Future<List<Product>> getProducts() async {
    await Future.delayed(
      Duration(
        seconds: 2,
      ),
    );

    // http://www.pngmart.com/image/91532
    // vid https://www.videvo.net/video/chocolate-dessert-dusted-with-icing-sugar/3609/
    return List<Product>.generate(
      20,
      (index) => Product(
        id: index,
        image: 'http://www.pngmart.com/files/7/Mixer-Grinder-PNG-Picture.png',
        reviewVideoUrl: index.isOdd
            ? 'https://cdn.videvo.net/videvo_files/video/free/2016-12/small_watermarked/FoodPack1_18_Videvo_preview.webm'
            : '',
        name: 'Geepas 3-in-1 Stand Mixer',
        productClass: 'Mixer',
        price: 543.00,
        description: 'Geepas mixer product',
      ),
    );
  }

  Future<LiveVideo> getVideoToday() async {
    await Future.delayed(
      Duration(
        seconds: 2,
      ),
    );

    return LiveVideo(
      id: 23,
      thumbnailUrl:
          'https://cdn.pixabay.com/photo/2016/03/27/21/34/restaurant-1284351_960_720.jpg',
      videoUrl:
          'https://cdn.videvo.net/videvo_files/video/free/2016-12/small_watermarked/FoodPack1_18_Videvo_preview.webm',
      title: 'All about Hivebox Freezer',
      description: 'Shonda describes what fuels her passion',
      duration: '1h 32m',
    );
  }
}
