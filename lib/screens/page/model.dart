import 'package:safetravel/screens/page/constants.dart';

class TourModel {
  List<String> imgUrl;
  String title;
  String location;
  String location2;
  int duration;
  String date;
  String description;
  double price;
  int commentCount;
  int shareCount;
  double rating;
  int ratingCount;

  String get priceVND => numberFormat.format(price);

  TourModel({
    this.imgUrl = const [
      'assets/images/0.1.jpg',
      'assets/images/0.2.png',
      'assets/images/0.3.jpeg',
    ],
    this.title = 'Công viên văn hóa Suối Tiên',
    this.location = 'Tp. Hồ Chí Minh',
    this.location2 = 'Tp. Hồ Chí Minh',
    this.duration = 3,
    this.date = '22/12/2021',
    this.description =
        'Địa điểm tuyệt vời để thư giãn ngày cuối tuần mà còn nằm ngay trong lòng Sài Gòn chứ không phải đi đâu xa.',
    this.price = 1230000,
    this.commentCount = 212,
    this.shareCount = 142,
    this.rating = 4.3,
    this.ratingCount = 241,
  });
}
