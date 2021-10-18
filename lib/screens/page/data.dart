import 'package:safetravel/screens/page/model.dart';

const basePath = 'assets/images/';

List<TourModel> tourData = [
  TourModel(
    imgUrl: [
      basePath + '1.1.png',
      basePath + '1.2.jpeg',
      basePath + '1.3.jpeg',
      basePath + '1.4.jpeg',
      basePath + '1.5.jpeg',
    ],
    title: 'Khám Phá "Đảo Ngọc" Cù Lao Xanh',
    location: 'Tỉnh Bình Định',
    location2: 'Tp. Hồ Chí Minh',
    duration: 2,
    date: 'Thứ 2, 12/10/2021',
    description: 'Khám phá vẻ đẹp hùng vĩ, thơ mộng của hòn ngọc xanh Quy Nhơn',
    price: 798000,
    commentCount: 214,
    shareCount: 124,
    rating: 4.3,
    ratingCount: 342,
  ),
  TourModel(
    imgUrl: [
      basePath + '2.1.jpeg',
      basePath + '2.2.jpeg',
      basePath + '2.3.jpeg',
      basePath + '2.4.jpeg',
      basePath + '2.5.jpeg',
    ],
    title: 'Phú Yên - Xứ Sở Hoa Vàng Trên Cỏ Xanh',
    location: 'Tỉnh Bình Định',
    location2: 'Tp. Hồ Chí Minh',
    duration: 4,
    date: 'Thứ 4, 14/10/2021',
    description:
        'Dưới nắng trời trong xanh, thảo nguyên xanh dường như cũng rộng lớn hơn, bầu trời cao vời vợi và những rặng xương rồng nằm im lìm.',
    price: 699000,
    commentCount: 115,
    shareCount: 72,
    rating: 4.2,
    ratingCount: 234,
  ),
  TourModel(
    imgUrl: [
      basePath + '3.1.jpeg',
      basePath + '3.2.jpeg',
      basePath + '3.3.jpeg',
      basePath + '3.4.jpeg',
    ],
    title: 'Sơn Trà Ngũ Hành Sơn Hội An',
    location: 'Tp. Đà Nẵng',
    location2: 'Tp. Hồ Chí Minh',
    duration: 4,
    date: 'Thứ 6, 16/10/2021',
    description:
        'Tour Sơn Trà Ngũ Hành Sơn Hội An trong vòng một ngày bằng ô tô với dịch vụ chất lượng chi phí hợp lí và HDV chuyên nghiệp sẽ giúp quý khách có một chuyến đi thật sự vui vẻ',
    price: 825000,
    commentCount: 242,
    shareCount: 96,
    rating: 4.6,
    ratingCount: 642,
  ),
  TourModel(
    imgUrl: [
      basePath + '4.1.jpeg',
      basePath + '4.2.jpeg',
      basePath + '4.3.jpeg',
      basePath + '4.4.jpeg',
      basePath + '4.5.jpeg',
      basePath + '4.6.jpeg',
      basePath + '4.7.jpeg',
    ],
    title: 'Cù Lao Chàm',
    location: 'Tp. Đà Nẵng',
    location2: 'Tp. Hồ Chí Minh',
    duration: 5,
    date: 'Thứ 5, 15/10/2021',
    description:
        'Tour Cù Lao Chàm trong ngày là một trong những tour du lịch biển được nhiều du khách lựa chọn. Không chỉ gần trung tâm Hội An, cách biển Cửa Đại 15km,… Cù Lao Chàm còn thu hút khách du lịch bởi cảnh quan đẹp, bãi biển hoang sơ. Nếu bạn đang có kế hoạch du lịch Hội An-Đà Nẵng thì hãy bỏ thêm thời gian để tham gia tour Cù Lao Chàm 1 ngày và khám phá vẻ đẹp mộc mạc, hoang sơ của Cù Lao Chàm nhé!',
    price: 665000,
    commentCount: 114,
    shareCount: 80,
    rating: 4.7,
    ratingCount: 382,
  ),
  TourModel(
    imgUrl: [
      basePath + '5.1.jpeg',
      basePath + '5.2.jpeg',
      basePath + '5.3.jpeg',
      basePath + '5.4.jpeg',
      basePath + '5.5.jpeg',
    ],
    title: 'Tour Cano 4 đảo Phú Quốc',
    location: 'Tỉnh Bình Định',
    location2: 'Tp. Hồ Chí Minh',
    duration: 4,
    date: 'Thứ 7, 17/10/2021',
    description:
        'Sau chuỗi ngày chôn vùi thanh xuân trong đét-lai, mình quyết định tự thưởng cho bản thân một chuyến đi chơi ngắn ngày thật gì và này nọ. Điểm đến lần này của mình là Phú Quốc, Kiên Giang - còn có tên gọi “đảo ngọc” với hải sản ngon, nắng vàng, cát trắng, biển xanh, vân vân và mây mây. ',
    price: 800000,
    commentCount: 432,
    shareCount: 256,
    rating: 4.8,
    ratingCount: 1243,
  ),
  TourModel(
    imgUrl: [
      basePath + '6.1.png',
      basePath + '6.2.jpeg',
      basePath + '6.3.jpeg',
      basePath + '6.4.jpeg',
      basePath + '6.5.jpeg',
      basePath + '6.6.jpeg',
      basePath + '6.7.jpeg',
      basePath + '6.8.jpeg',
    ],
    title: 'Thác Bản Giốc - Hồ Ba Bể',
    location: 'Tỉnh Bắc Kạn',
    location2: 'Tp. Hồ Chí Minh',
    duration: 2,
    date: 'Thứ 2, 18/10/2021',
    description:
        'Một chuyến du lịch kết hợp hai địa điểm đẹp của vùng núi phía Bắc Tổ quốc. Thác Bản Giốc - một trong những thác nước đẹp và lớn nhất thế giới và Hồ Ba bể - một thắng cảnh tuyệt đẹp ở Bắc Kạn.',
    price: 780000,
    commentCount: 543,
    shareCount: 332,
    rating: 4.9,
    ratingCount: 903,
  ),
  TourModel(
    imgUrl: [
      basePath + '7.1.jpeg',
      basePath + '7.2.jpeg',
      basePath + '7.3.jpeg',
      basePath + '7.4.jpeg',
      basePath + '7.5.jpeg',
      basePath + '7.6.jpeg',
      basePath + '7.7.jpeg',
    ],
    title: 'Mộc Châu khám phá mảnh đất bốn mùa nở hoa',
    location: 'Tỉnh Mộc Châu',
    location2: 'Tp. Hồ Chí Minh',
    duration: 6,
    date: 'Thứ 7, 17/10/2021',
    description:
        'Mộc Châu, một cao nguyên yên bình và xinh đẹp cách Hà Nội khoảng 200km hấp dẫn du khách bởi sự nguyên sơ và những nét văn hóa bản địa đặc sắc',
    price: 1480000,
    commentCount: 374,
    shareCount: 214,
    rating: 4.8,
    ratingCount: 673,
  ),
  TourModel(
    imgUrl: [
      basePath + '8.1.jpeg',
      basePath + '8.2.jpeg',
      basePath + '8.3.jpeg',
      basePath + '8.4.jpeg',
      basePath + '8.5.jpeg',
      basePath + '8.6.jpeg',
      basePath + '8.7.jpeg',
    ],
    title: 'Hà Giang mùa hoa Tam giác mạch',
    location: 'Tình Hà Giang',
    location2: 'Tp. Hồ Chí Minh',
    duration: 3,
    date: 'Thứ 2, 12/10/2021',
    description:
        'Hà Giang vốn nổi tiếng với khung cảnh thiên nhiên hùng vĩ, những nét văn hoá người dân tộc độc đáo, là bối cảnh của rất nhiều bộ phim nổi tiếng. Mỗi dịp tháng 10 về, Hà Giang còn trở nên lung linh hơn với sắc hồng hoa tam giác mạch trên cao nguyên đá. Màu tam giác mạch có sức quyến rũ kỳ lạ đối với du khách mỗi dịp thu về với hàng triệu lượt khách mỗi mùa hoa.',
    price: 1560000,
    commentCount: 514,
    shareCount: 324,
    rating: 4.5,
    ratingCount: 165,
  ),
  TourModel(
    imgUrl: [
      basePath + '9.1.jpeg',
      basePath + '9.2.jpeg',
      basePath + '9.3.jpeg',
      basePath + '9.4.jpeg',
      basePath + '9.5.jpeg',
    ],
    title: 'Săn mây Tà Xùa - Bắc Yên',
    location: 'Tỉnh Sơn La',
    location2: 'Tp. Hồ Chí Minh',
    duration: 3,
    date: 'Thứ 5, 15/10/2021',
    description:
        'Tà Xùa được ca ngợi là một trong những thiên đường mây đẹp nhất ở miền Bắc. Những ngày chớm thu, dân tình lại nô nức rủ nhau tới Tà Xùa thưởng mây, ngắm núi đồi hùng vĩ.',
    price: 1680000,
    commentCount: 615,
    shareCount: 411,
    rating: 4.7,
    ratingCount: 564,
  ),
  TourModel(
    imgUrl: [
      basePath + '10.1.jpeg',
      basePath + '10.2.jpeg',
      basePath + '10.3.jpeg',
      basePath + '10.4.jpeg',
      basePath + '10.5.jpeg',
      basePath + '10.6.jpeg',
    ],
    title: 'Tứ tỉnh miền Tây',
    location: 'Miền Tây',
    location2: 'Tp. Hồ Chí Minh',
    duration: 7,
    date: 'Thứ 4, 14/10/2021',
    description:
        'Miền Tây luôn mang một nét văn hóa rất đặc trưng mà không lẫn với bất kỳ vùng miền nào. Có ai đến miền Tây rồi mà lại không thương nhớ nên chắc chắn bạn không thể bỏ lỡ điểm đến đáng giá này đâu nhé!',
    price: 2880000,
    commentCount: 725,
    shareCount: 512,
    rating: 4.6,
    ratingCount: 841,
  ),
  TourModel(
    imgUrl: [
      basePath + '11.1.jpeg',
      basePath + '11.2.jpeg',
      basePath + '11.3.jpeg',
      basePath + '11.4.jpeg',
      basePath + '11.5.jpeg',
      basePath + '11.6.jpeg',
    ],
    title: 'Vườn Quốc Gia Nam Cát Tiên',
    location: 'Tỉnh Lâm Đồng',
    location2: 'Tp. Hồ Chí Minh',
    duration: 3,
    date: 'Thứ 2, 12/10/2021',
    description:
        'Nếu bạn là người yêu thích thiên nhiên hoang dã, gần gũi với đất mẹ, thích một chút mạo hiểm khi lội núi băng rừng, khám phá vẻ đẹp hữu tình, hay đạp xe trên những cung đường thơ mộng để tận hưởng không khí trong lành, xanh mát thì tour du lịch Nam Cát Tiên nhất định sẽ không làm bạn thất vọng',
    price: 1950000,
    commentCount: 643,
    shareCount: 411,
    rating: 4.9,
    ratingCount: 615,
  ),
  TourModel(
    imgUrl: [
      basePath + '12.1.jpeg',
      basePath + '12.2.jpeg',
      basePath + '12.3.jpeg',
      basePath + '12.4.jpeg',
      basePath + '12.5.jpeg',
      basePath + '12.6.jpeg',
    ],
    title: 'Nha Trang - Mũi Né',
    location: 'Nha Trang - Khánh Hoà',
    location2: 'Tp. Hồ Chí Minh',
    duration: 4,
    date: 'Thứ 2, 12/10/2021',
    description:
        'Tour du lịch Nha Trang Mũi Né sẽ đưa du khách dừng chân tại hai thành phố biển nổi tiếng nhưng mang hai vẻ đẹp riêng biệt. Du khách sẽ tận mắt chiêm ngưỡng vẻ đẹp nên thơ của khu du lịch biển Nha Trang và ngắm đồi cát vàng chạy dài xa tít ở Mũi Né.',
    price: 7650000,
    commentCount: 411,
    shareCount: 312,
    rating: 3.9,
    ratingCount: 157,
  ),
];
