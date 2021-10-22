//import 'dart:ui';
// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:safetravel/screens/main_screen.dart';
import 'package:safetravel/screens/page/model.dart';
import 'package:safetravel/screens/page/qr_scan.dart';
import 'package:safetravel/screens/tour/confirm/confirm_constants.dart';
import 'package:safetravel/screens/tour/tour_date_start_screem.dart';
import 'package:safetravel/utilities/constants.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:shared_preferences/shared_preferences.dart';

class TourDetail extends StatefulWidget {
  final TourModel model;
  const TourDetail(this.model, {Key? key}) : super(key: key);

  @override
  _TourDetailState createState() => _TourDetailState();
}

class _TourDetailState extends State<TourDetail> {
  late TourModel model;
  late List<String> imgArray;

  @override
  void initState() {
    super.initState();
    model = widget.model;
    imgArray = model.imgUrl;
  }

  Future<void> _confirm() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    bool isSafe = prefs.getBool('isSafe') ?? false;

    if (isSafe) {
      Navigator.of(context).push(
          MaterialPageRoute(builder: (context) => TourDateStartScreen(model)));
    } else {
      showDialog<String>(
        context: context,
        builder: (BuildContext context) => AlertDialog(
          title: Row(
            children: [
              Image.asset(
                'assets/images/shield.png',
                height: 20.h,
              ),
              SizedBox(
                width: 10.w,
              ),
              Text('Xác nhận', style: h3),
            ],
          ),
          content:
              Text('Xác nhận 2 mũi tiêm covid trước khi tiếp tục', style: h4),
          actions: <Widget>[
            TextButton(
              onPressed: () => Navigator.pop(context, 'Cancel'),
              child: Text('Từ chối', style: h4),
            ),
            TextButton(
              onPressed: () {
                Navigator.pop(context, 'OK');
                Navigator.of(context)
                    .push(MaterialPageRoute(builder: (context) => QRScan()));
              },
              child: Text('Đồng ý', style: h4),
            ),
          ],
        ),
      );
    }
  }

  Widget _builWayPart() {
    return ExpansionPanelList(
      dividerColor: kSecondaryColor,
      children: [
        ExpansionPanel(
            canTapOnHeader: true,
            headerBuilder: (context, isExpanded) => Container(
                width: double.infinity,
                margin: EdgeInsets.only(right: 5.w, left: 5.w),
                padding: const EdgeInsets.all(10),
                child: Text(
                  "Chặng",
                  style: h3b.copyWith(color: kSecondaryColor),
                  textAlign: TextAlign.left,
                )),
            body: ExpansionPanelList(
              expansionCallback: (panelIndex, isExpanded) {
                print(panelIndex);
                setState(() => _itemsWayIsExpanded[panelIndex] = !isExpanded);
              },
              children: [
                ExpansionPanel(
                    canTapOnHeader: true,
                    headerBuilder: (context, isExpanded) => Container(
                        width: double.infinity,
                        margin: const EdgeInsets.only(right: 5, left: 5),
                        padding: const EdgeInsets.all(10),
                        child: Text(
                          "Chặng 1: Đà Nẵng - Sơn Trà - Hội An",
                          style: h4.copyWith(color: goodBlack),
                          textAlign: TextAlign.left,
                        )),
                    body: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: ClipRRect(
                              borderRadius: BorderRadius.circular(20),
                              child: Image.asset(
                                imgArray[0],
                                fit: BoxFit.cover,
                              ),
                            ),
                          ),
                          Container(
                              width: double.infinity,
                              margin: const EdgeInsets.only(right: 5, left: 5),
                              padding: const EdgeInsets.all(10),
                              child: Text(
                                "Sáng:\n    – Từ 06h00 đến 11h00 Hdv và lái xe đón khách.\n   – Từ 12h00-17h00 xe đón khách về khách sạn.\n   – Sau 17h00 khách tự túc về khách sạn. \n\nTrưa: Dùng bữa trưa tại nhà hàng. Nhận phòng khách sạn nghỉ ngơi.\n\nChiều: 15h00 Khởi hành đi Bán Đảo Sơn Trà (Monkey Moutain)\n    – cách trung tâm Tp Đà Nẵng 10km về hướng Đông Bắc, là bức bình phong che chắn bão gió cho Thành phố Đà Nẵng. Quý khách Viếng chùa Linh Ứng, chiêm ngưỡng Tượng Phật Quan Thế Âm Bồ Tát cao nhất Việt Nam 67m. Thưởng ngoạn vẻ đẹp và chụp hình biển Mỹ Khê (Được tạp chí Forbes bình chọn là 1 trong 6 bãi biển quyến rũ nhất hành tinh).\n    – Tiếp tục thăm Làng đá Mỹ nghệ Non Nước với các tác phẩm nghệ thuật được tạo nên bởi bàn tay tài hoa của các nghệ nhân làng nghề cổ 300 năm tuổi.\n    – Xe và HDV tiếp tục đưa đoàn tham quan phố cổ Hội An. Đây là phố đèn lồng đẹp nhất vào ban đêm mang phong cách đậm chất người Hoa. Quý khách sẽ có dịp tham quan chùa Cầu Nhật Bản, xây dựng vào đầu thế kỷ 17, một biểu tượng độc đáo và rất thân thương của người Hội An. Sau đó, Quý khách sẽ thăm hai trong các điểm sau: Hội Quán Quảng Đông, Hội Quán Phúc Kiến, nhà cổ Tấn Ký, nhà cổ Phùng Hưng.\n\nTối: Đoàn dùng bữa tại nhà hàng, thưởng thức các đặc sản tại Hội An (Cao lầu, hoành thánh, cơm gà…). Xe và HDV sẽ đưa đoàn về Đà Nẵng theo cung đường ven biển. Quý khách có dịp ngắm nhìn các resort, sân golf cao cấp từ Hội An ra Đà Nẵng. Nghĩ tối tại Đà Nẵng.",
                                style: h4,
                              ))
                        ]),
                    isExpanded: _itemsWayIsExpanded[0]),
                ExpansionPanel(
                    canTapOnHeader: true,
                    headerBuilder: (context, isExpanded) => Container(
                        width: double.infinity,
                        margin: const EdgeInsets.only(right: 5, left: 5),
                        padding: const EdgeInsets.all(10),
                        child: Text(
                          "Chặng 2: Bà Nà Hills – Cầu Vàng Bàn Tay – Đà Nẵng",
                          style: h4.copyWith(
                            color: goodBlack,
                          ),
                          textAlign: TextAlign.left,
                        )),
                    body: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: ClipRRect(
                              borderRadius: BorderRadius.circular(20),
                              child: Image.asset(
                                imgArray[1],
                                fit: BoxFit.cover,
                              ),
                            ),
                          ),
                          Container(
                              width: double.infinity,
                              margin: const EdgeInsets.only(right: 5, left: 5),
                              padding: const EdgeInsets.all(10),
                              child: Text(
                                "Sáng: Điểm tâm sáng. \n    7h30: Khởi hành đến với khu du lịch Bà Nà Hills (chi phí vé cáp tự túc 750.000 vnd/1 khách) nơi Quý khách khám phá những khoảnh khắc giao mùa bất ngờ Xuân – Hạ – Thu – Đông trong 1 ngày.\n    8h30: Đến Ga Suối Mơ, tại đây Quý khách tự do chụp ảnh lưu niệm. Sau đó, Quý khách lên cáp treo Bà Nà – đạt 2 kỷ lục Guinness thế giới, ngồi trên cabin Bà Nà lơ lửng giữa lưng chừng mây, Quý khách có cơ hội nhìn xuống bạt ngàn núi rừng để thưởng ngoạn cảnh vật của khu bảo tồn thiên nhiên Bà Nà. Từ trên cao, Quý khách sẽ chiêm ngưỡng toàn bộ thác Tóc Tiên chín tầng hùng vỹ hiện ra với thác nước chảy ngoạn mục. Ngồi trong cáp treo, quý khách còn có thể thu vào tầm mắt toàn cảnh Đà Nẵng, từ vịnh biển Nguyễn Tất Thành đến bán đảo Sơn Trà, đèo Hải Vân…\n   09h00: Đến Ga Bà Nà, quý khách tham quan Bà Nà Bynight với hầm rượu 100 năm tuổi, tại đây Quý khách có thể thưởng thức 1 ly rượu vang Pháp sẽ làm ấm lòng khi đi dạo ở nơi se lạnh như Bà Nà (chi phí tự túc).Tham quan Cầu Vàng bàn tay, Đồi Vọng Nguyệt, chùa Linh Ứng, Thích Ca Phật Đài, khu chuồng ngựa cũ của Pháp, Vườn Tịnh Tâm và đỉnh nhà rông. Tiếp tục ngồi cáp treo đến đỉnh Nghinh Phong, biệt thự Lệ Nim, Lầu Vọng Nguyệt, Cầu Treo Bà Nà và chinh phục đỉnh núi Chúa ở độ cao 1.487m so với mực nước biển để thưởng thức quang cảnh núi rừng Bà Nà và toàn cảnh Đà Nẵng và Quảng Nam trên cao. Tiếp tục tham quan Khu vui chơi giải trí trong nhà lớn thứ 3 Thế giới với tên gọi là FANTASY PARK (Vòng quay tình yêu, phi công SKIVER, đường đua lửa, cối xay gió, người nhện, tháp rơi xoay tự do, Xem phim 4D, Công viên khủng long, Bảo tàng tượng sáp…chi phí trò chơi tự túc).\n\nTrưa: Ăn trưa tại một trong bốn nhà hàng tại Bà Nà: Nhà hàng Club, Arapang, Beer Plaza, La Lavande + 135.000 vnd/1 khách. Về KS nghỉ ngơi.\n     Rời Bà Nà về lại Đà Nẵng theo tuyến đường du lịch Nguyễn Tất Thành, tuyến đường biển đẹp nhất Miền Trung. Ngắm cầu treo Thuận Phước (cầu treo dài nhất Việt Nam), bãi biển Thanh Bình, bãi biển Red Beach (nơi thực dân Pháp đổ bộ lần đầu tiên lên Đà Nẵng), ghé tham quan mua sắm tại siêu thị đặc sản miền Trung.\n\nTối: HẠNG B (KHÔNG PARTY) DU THUYỀN SÔNG HÀN: Dùng bữa tối tại nhà hàng hoặc Cơm Gà nổi tiếng Đà Nẵng – Cơm gà dẻo ngọt vừa đủ cùng miếng gà được chiên giòn hay luộc chín thơm phức sẽ đem đến một hương vị rất riêng, không ai có thể chối từ. Kết thúc bữa tối, xe và hdv đưa Qúy khách về lại khách sạn. Quý khách được tự do khám phá Phố Biển Đà Nẵng về đêm: Ngồi Du thuyền sông Hàn hoặc Vòng quay Mặt Trời Sun Whell ngắm cảnh TP (chi phí tự túc), Trung Tâm Thương Mại, Khu phố ẩm thực, Café – Bar – Discotheque,…Nghỉ đêm tại Đà Nẵng.\n\nTối: HẠNG A (CÓ PARTY) DU THUYỀN SÔNG HÀN: 1 bữa Party Dinner Du Thuyền Sông Hàn 350.000 vnd/ suất ( mua hạng A mới có)\n    Xe và HDV sẽ đón quý khách đến với DU THUYỀN SÔNG HÀN để tham gia Party Dinner do chính công ty tổ chức. Được mệnh danh một biểu tượng của thành phố Đà Nẵng, Sông Hàn luôn mang trong mình vẻ đẹp thơ mộng, hiền hòa chảy dài giữa lòng thành phố đáng sống. Tàu rồng sông Hàn lung linh huyền ảo trong đêm sẽ đưa Quý khách đến với nhiều cung bậc cảm xúc khác nhau khi ngắm nhìn thành phố về đêm trên du thuyền.\n   Với mong muốn đem đến một đêm tiệc âm nhạc và những trò chơi để kết nối mọi người lại với nhau, du khách cùng ngồi lại với nhau trên một bàn tiệc chia sẻ cho nhau những câu chuyện, cùng nhau tạo nên những kỷ niệm đẹp và khó quên khi đến với Đà Nẵng. Bữa tiệc sẽ có những hoạt động đặc sắc cùng với MC chuyên nghiệp và tấm lòng tri ân sâu sắc của công ty dành cho Quý khách với không gian ấm cúng hoa cung Sông Hàn thơ mộng, chắc chắn Party Dinner này sẽ đem đến cho Quý khách một trải nghiệm lý thú, gắn kết từng cá nhân, từng con người xa lạ vì yêu mến mà tìm đến để trải nghiệm vẻ đẹp của thành phố Đà Nẵng đáng sống. Tất cả mọi người sẽ cùng tạo nên điều đặc biệt cho hành trình tham quan thú vị của chính mình, có thêm những người bạn mới ở bốn phương.\n    21h00 Xe đưa Quý khách về lại khách sạn, tự do khám phá thành phố về đêm. Nghỉ đêm tại Đà Nẵng.",
                                style: h4,
                              ))
                        ]),
                    isExpanded: _itemsWayIsExpanded[1]),
                ExpansionPanel(
                    canTapOnHeader: true,
                    headerBuilder: (context, isExpanded) => Container(
                        width: double.infinity,
                        margin: const EdgeInsets.only(right: 5, left: 5),
                        padding: const EdgeInsets.all(10),
                        child: Text(
                          "Chặng 3: Đà Nẵng – Suối khoáng thần tài – Tiễn khách",
                          style: h4.copyWith(color: goodBlack),
                          textAlign: TextAlign.left,
                        )),
                    body: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: ClipRRect(
                              borderRadius: BorderRadius.circular(20),
                              child: Image.asset(
                                imgArray[2],
                                fit: BoxFit.cover,
                              ),
                            ),
                          ),
                          Container(
                              width: double.infinity,
                              margin: const EdgeInsets.only(right: 5, left: 5),
                              padding: const EdgeInsets.all(10),
                              child: Text(
                                "Sáng: Điểm tâm sáng. Xe và HDV sẽ đón khách khởi hành đến với khu du lịch suối khoáng Núi Thần Tài.\n09h00: Đến công viên Núi Thần Tài , quý khách sẽ nhận vé tham quan và sắp xếp kí gửi tư trang hành lý, bắt đầu cuộc hành trình khám phá, trải nghiệm và vui chơi Suối nước Nóng Thần Tài. Đoàn sẽ di chuyển bằng xe điện để đến với khu vực “Bọng Rồng” với hồ bơi lớn trung tâm cùng nhiều trò chơi nước hấp dẫn dành cho trẻ em và cả người lớn.\nTại đây, quý khách thỏa thích tận hưởng cảm giác bơi lội mát mẻ, trải nghiệm “Dòng sông Lười” quanh co huyền bí, khám phá lòng hang động Long Tiên với phao bơi, thư giãn với hệ thống ghế massage Ficus, tắm Sauna Thổ, Sauna Nga\n12h00: Đoàn dùng bữa trưa tại nhà hàng. Nghỉ ngơi tự do khám phá\n13h30: Quý khách lên xe điện tiếp tục hành trình khám phá thiên nhiên Núi Thần Tài với: Hồ khoáng nóng tự nhiên, khu vườn hoa quả nhiệt đới, để ngâm mình dưới dòng nước khoáng nóng tận hưởng cảm giác thư giãn nơi đây, và thưởng thức món trứng gà luộc trong lòng mỏ khoáng.\nQuý khách cũng có thể lựa chọn cho mình những không gian riêng, thử cảm giác với các dịch vụ: Tắm trà, tắm sữa, tắm bùn, tắm cà phê, tắm rượu, hay tắm onsen,… (chi phí tự túc)\n15h00: Tạm biệt khu du lịch đoàn lên xe về lại Đà Nẵng… Mua sắm quà tại siêu thị đặc sản miền Trung về làm quà\nChiều: Xe tiễn khách ra Sân bay/ Ga Đà Nẵng từ 15h30 – 17h30. ( Chuyến bay sau thời gian trên quý khách tự túc phương tiện ra sân bay). HDV chào tạm biệt du khách, kết thúc chương trình tham quan thú vị tại đây.",
                                style: h4b,
                              ))
                        ]),
                    isExpanded: _itemsWayIsExpanded[2])
              ],
            ),
            isExpanded: wayIsExpanded)
      ],
      expansionCallback: (panelIndex, isExpanded) =>
          setState(() => wayIsExpanded = !wayIsExpanded),
    );
  }

  Widget _builCarouselSliderImage() {
    return CarouselSlider(
        options: CarouselOptions(
          autoPlay: true,
          height: 250,
          enlargeCenterPage: true,
          aspectRatio: 16 / 9,
          autoPlayCurve: Curves.fastOutSlowIn,
          enableInfiniteScroll: true,
          autoPlayAnimationDuration: Duration(milliseconds: 1000),
          viewportFraction: 0.8,
        ),
        items: imgArray
            .map((item) => Container(
                  margin: EdgeInsets.all(5.0),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10.0),
                    image: DecorationImage(
                        image: AssetImage(item), fit: BoxFit.cover),
                  ),
                ))
            .toList());
  }

  Future<void> _toolTip() async {
    showDialog<String>(
      context: context,
      builder: (BuildContext context) => AlertDialog(
        title: Row(
          children: [
            Image.asset(
              'assets/images/shield.png',
              height: 20.h,
            ),
            SizedBox(
              width: 10.w,
            ),
            Text('Gợi ý', style: h3),
          ],
        ),
        content: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: const [
            Text(
                'Tour này đã được xác nhận trên 21 ngày không có ca covid dương tính tại các địa điểm trong tour.'),
          ],
        ),
        actions: <Widget>[
          TextButton(
            onPressed: () {
              Navigator.pop(context, 'OK');
            },
            child: Text('OK', style: h4),
          ),
        ],
      ),
    );
  }

  Widget _builTitleTour() {
    var ratingValue = model.rating;
    List<Widget> ratings = [];

    int i = 0;
    for (; i < ratingValue.floor(); i++) {
      ratings.add(
        const Icon(Icons.star, color: Colors.yellow),
      );
    }

    if (ratingValue - ratingValue.floor() >= 0.5) {
      ratings.add(
        const Icon(Icons.star_half, color: Colors.yellow),
      );
      i++;
    }

    for (; i < 5; i++) {
      ratings.add(
        const Icon(Icons.star_outline, color: Colors.yellow),
      );
    }
    return Container(
      alignment: Alignment.center,
      width: double.infinity,
      margin: const EdgeInsets.only(right: 5, left: 5),
      padding: const EdgeInsets.all(20),
      child: Column(
        children: [
          Row(
            children: [
              Expanded(
                child: Text(
                  model.title,
                  style: h3b,
                ),
              ),
              SizedBox(
                width: 10.w,
              ),
              InkWell(
                onTap: () => _toolTip(),
                child: const Icon(Icons.verified_user, color: kPrimaryColor),
              ),
            ],
          ),
          Divider(),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  RichText(
                    text: TextSpan(
                      text: model.rating.toStringAsFixed(1),
                      style: h3b,
                      children: <TextSpan>[
                        TextSpan(
                          text: '/5',
                          style: h5,
                        ),
                      ],
                    ),
                  ),
                  Text(model.ratingCount.toString() + ' lượt đánh giá'),
                ],
              ),
              Row(
                children: ratings,
              ),
            ],
          ),
          Divider(),
          Row(
            children: [
              Expanded(
                child: Text(
                  model.description,
                  style: h4,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _builInfomationTour() {
    return Container(
      width: double.infinity,
      margin: const EdgeInsets.only(right: 5, left: 5),
      padding: const EdgeInsets.all(20),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Text(
                "Thông Tin",
                style: h3b.copyWith(color: kSecondaryColor),
                textAlign: TextAlign.start,
              )
            ],
          ),
          Divider(
            height: 40,
            thickness: 1,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                "Mã tour",
                style: h4.copyWith(
                  color: goodGray,
                ),
              ),
              Spacer(),
              Text(
                "T-0521-M1J",
                style: h4.copyWith(
                  color: Colors.black,
                ),
              ),
            ],
          ),
          Divider(
            height: 40,
            thickness: 1,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                "Thời gian",
                style: h4.copyWith(
                  color: goodGray,
                ),
              ),
              Spacer(),
              Text(
                model.duration.toString() + " ngày",
                style: h4.copyWith(
                  color: Colors.black,
                ),
              ),
            ],
          ),
          Divider(
            height: 40,
            thickness: 1,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                "Điểm khởi hành",
                style: h4.copyWith(color: goodGray),
              ),
              Spacer(),
              Text(
                model.location2,
                style: h4.copyWith(color: Colors.black),
              ),
            ],
          ),
          Divider(
            height: 40,
            thickness: 1,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                "Điểm đến",
                style: h4.copyWith(color: goodGray),
              ),
              Spacer(),
              Text(
                model.location,
                style: h4.copyWith(color: Colors.black),
              ),
            ],
          ),
          Divider(
            height: 40,
            thickness: 1,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                "Quốc gia",
                style: h4.copyWith(color: goodGray),
              ),
              Spacer(),
              Text(
                "Việt Nam",
                style: h4.copyWith(color: Colors.black),
              ),
            ],
          ),
          Divider(
            height: 40,
            thickness: 1,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                "Loại tour",
                style: h4.copyWith(color: goodGray),
              ),
              Spacer(),
              Text(
                "Tour nội địa",
                style: h4.copyWith(color: Colors.black),
              ),
            ],
          )
        ],
      ),
    );
  }

  Widget _builBottomBar() {
    return Container(
      height: 120,
      padding: const EdgeInsets.only(left: 30, right: 30, top: 10, bottom: 10),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Expanded(
            flex: 50,
            child: FittedBox(
              fit: BoxFit.fitWidth,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "Giá chỉ từ",
                            style: h4,
                          ),
                          Wrap(
                            children: [
                              Text(
                                model.priceVND,
                                style: h3b.copyWith(color: kPrimaryColor),
                              ),
                              Text(
                                "/" + model.duration.toString() + " ngày",
                                style: h3b.copyWith(color: Colors.black),
                              ),
                            ],
                          )
                        ],
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
          SizedBox(
            width: 30.w,
          ),
          Expanded(
            flex: 40,
            child: nextButton(
              "Đặt ngay",
              //() => _confirm(),
              () {
                Navigator.of(context).push(MaterialPageRoute(
                    builder: (context) => TourDateStartScreen(model)));
              },
            ),
          ), // double.infinity is the width and 30 is the height
        ],
      ),
    );
  }

  Widget _builLocationTour() {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(20),
      child: Column(mainAxisAlignment: MainAxisAlignment.start, children: [
        Wrap(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Icon(
                  Icons.location_on,
                  color: Colors.blue,
                  size: 40,
                ),
                Expanded(
                  child: Container(
                    height: 1,
                    color: goodGray,
                  ),
                ),
                Icon(
                  Icons.location_on,
                  color: Colors.red,
                  size: 40,
                )
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Expanded(
                  child: Text(
                    "Điểm khởi hành",
                    style: h3.copyWith(color: Colors.blue),
                  ),
                ),
                Expanded(
                  child: Text(
                    "Điểm đến",
                    style: h3.copyWith(color: Colors.red),
                    textDirection: TextDirection.rtl,
                  ),
                ),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Expanded(
                  child: Text(
                    "Tp. Đà Nẵng",
                    style: h3b.copyWith(color: Colors.black),
                  ),
                ),
                Expanded(
                  child: Text(
                    "Tp. Đà Nẵng",
                    style: h3b.copyWith(color: Colors.black),
                    textDirection: TextDirection.rtl,
                  ),
                ),
              ],
            )
          ],
        ),
      ]),
    );
  }

  var wayIsExpanded = true;
  final List<bool> _itemsWayIsExpanded = [false, false, false];

  String date = "30/10/2021";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Container(
            color: Colors.white,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Expanded(
                  child: SingleChildScrollView(
                    scrollDirection: Axis.vertical,
                    child: Column(
                      children: <Widget>[
                        AppBar(
                          title: Text(
                            "Tour",
                            style: h2b.copyWith(color: Colors.white),
                          ),
                          backgroundColor: kPrimaryColor,
                        ),
                        SizedBox(height: 15.h),
                        _builCarouselSliderImage(),
                        SizedBox(
                          height: 25.h,
                        ),
                        Container(
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(10.r),
                            boxShadow: [cardShadow],
                          ),
                          margin: EdgeInsets.symmetric(horizontal: 30.w),
                          child: Column(
                            children: [
                              _builTitleTour(),
                            ],
                          ),
                        ),
                        SizedBox(
                          height: 15.h,
                        ),
                        Container(
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(10.r),
                            boxShadow: [cardShadow],
                          ),
                          margin: EdgeInsets.symmetric(horizontal: 30.w),
                          child: _builInfomationTour(),
                        ),
                        SizedBox(
                          height: 15.h,
                        ),
                        Container(
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(10.r),
                            boxShadow: [cardShadow],
                          ),
                          margin: EdgeInsets.symmetric(horizontal: 30.w),
                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(10.r),
                            child: _builWayPart(),
                          ),
                        ),
                        SizedBox(
                          height: 15.h,
                        ),
                        reviewButton(
                          'Xem review',
                          () {
                            Navigator.of(context).push(
                              MaterialPageRoute(
                                builder: (context) => MainScreen(pageIndex: 2),
                              ),
                            );
                          },
                        ),
                        SizedBox(
                          height: 20.h,
                        ),
                      ],
                    ),
                  ),
                ),
                Container(
                  decoration: BoxDecoration(
                    color: Colors.white,
                    boxShadow: [
                      BoxShadow(
                        color: goodGray.withOpacity(0.2),
                        offset: const Offset(0, -5),
                        blurRadius: 10.r,
                      )
                    ],
                  ),
                  child: _builBottomBar(),
                )
              ],
            )));
  }

  BoxShadow cardShadow = BoxShadow(
    color: goodGray.withOpacity(0.2),
    offset: const Offset(-1, 8),
    blurRadius: 20,
  );

  Widget reviewButton(String text, VoidCallback onPressed) {
    return SizedBox(
      height: 45.h,
      width: 200.w,
      child: RawMaterialButton(
        onPressed: onPressed,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              text,
              style: h4b.copyWith(
                color: goodGray,
                fontWeight: FontWeight.w500,
              ),
            ),
          ],
        ),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(50),
        ),
      ),
    );
  }

  Widget nextButton(String text, VoidCallback onPressed) {
    return SizedBox(
      height: 45.h,
      child: ElevatedButton(
        onPressed: onPressed,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              text,
              style: h3b.copyWith(
                color: Colors.white,
                fontWeight: FontWeight.w500,
              ),
            ),
            const Icon(Icons.chevron_right, size: 15),
          ],
        ),
        style: ElevatedButton.styleFrom(
          primary: kPrimaryColor,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(50.r),
          ),
        ),
      ),
    );
  }
}
