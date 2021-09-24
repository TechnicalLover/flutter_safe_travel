import 'package:flutter/material.dart';
import 'package:safetravel/utilities/constants.dart';
import 'package:safetravel/widget/nearby_card.dart';

class ExperianceDetailsScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: kPrimaryColor,
      ),
      //  backgroundColor: MaterialColors.bgColorScreen,
      body: SingleChildScrollView(
        child: Column(
          children: [
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 16.0),
              child: Container(
                decoration: BoxDecoration(
                  boxShadow: [
                    BoxShadow(
                        color: Colors.black.withOpacity(0.2),
                        spreadRadius: 8,
                        blurRadius: 10,
                        offset: Offset(0, 0))
                  ],
                  color: Colors.white,
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(13.0),
                    topRight: Radius.circular(13.0),
                  ),
                ),
                margin: EdgeInsets.only(
                  top: MediaQuery.of(context).size.height * 0.04,
                  bottom: MediaQuery.of(context).size.height * 0.0001,
                ),
                alignment: Alignment.bottomCenter,
                child: Stack(
                  children: [
                    Padding(
                      padding:
                          EdgeInsets.symmetric(horizontal: 18, vertical: 12),
                      child: SafeArea(
                        bottom: true,
                        top: false,
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Row(
                                  children: [
                                    CircleAvatar(
                                      backgroundImage: NetworkImage(
                                          "https://scr.vn/wp-content/uploads/2020/07/Hình-đại-diện-đẹp-1.jpg?fit=crop&w=840&q=80"),
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.only(left: 8.0),
                                      child: Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Text("Dat Nguyen",
                                              style: TextStyle(
                                                  color: Colors.black,
                                                  fontWeight: FontWeight.w500)),
                                          Text(
                                            "ngay dang: 2021/09/11",
                                          ),
                                        ],
                                      ),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                            Padding(
                              padding: const EdgeInsets.only(top: 15.0),
                              child: Align(
                                  alignment: Alignment.centerLeft,
                                  child: Text("Vui chơi Phú Quốc an toàn",
                                      style: TextStyle(
                                          fontSize: 20,
                                          fontWeight: FontWeight.w500))),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(top: 4.0),
                              child: Align(
                                alignment: Alignment.centerLeft,
                                child: Column(
                                  children: [
                                    Padding(
                                      padding:
                                          const EdgeInsets.only(bottom: 8.0),
                                      child: Text(
                                        "Thời tiết ở Phú Quốc có 2 mùa khá rõ rệt là mùa mưa và mùa khô. Mùa mưa Phú Quốc bắt đầu từ tháng 5 đến tháng 10, trong đó mưa nhiều nhất vào tháng 9, 10 và có thể kéo dài cả ngày. Từ tháng 11 đến tháng 4 là mùa khô, Phú Quốc nắng đẹp, ít mưa nên các hoạt động vui chơi, check-in sẽ tha hồ được diễn ra. Ngoài ra, bước vào tháng 11, Phú Quốc vào thời điểm giao mùa nên nắng mưa tương đối thất thường, nhiệt độ mát mẻ khoảng 25 đến 28 độ C. ",
                                        style: TextStyle(
                                            fontSize: 12,
                                            fontWeight: FontWeight.w400),
                                      ),
                                    ),
                                    Image.network(
                                        "https://upload.wikimedia.org/wikipedia/commons/thumb/6/6e/Bai-sao-phu-quoc-tuonglamphotos.jpg/1200px-Bai-sao-phu-quoc-tuonglamphotos.jpg"),
                                    Padding(
                                      padding: const EdgeInsets.only(top: 8.0),
                                      child: Text(
                                        "Thời tiết ở Phú Quốc có 2 mùa khá rõ rệt là mùa mưa và mùa khô. Mùa mưa Phú Quốc bắt đầu từ tháng 5 đến tháng 10, trong đó mưa nhiều nhất vào tháng 9, 10 và có thể kéo dài cả ngày. Từ tháng 11 đến tháng 4 là mùa khô, Phú Quốc nắng đẹp, ít mưa nên các hoạt động vui chơi, check-in sẽ tha hồ được diễn ra. Ngoài ra, bước vào tháng 11, Phú Quốc vào thời điểm giao mùa nên nắng mưa tương đối thất thường, nhiệt độ mát mẻ khoảng 25 đến 28 độ C. ",
                                        style: TextStyle(
                                            fontSize: 12,
                                            fontWeight: FontWeight.w400),
                                      ),
                                    ),
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.start,
                                      children: [
                                        Icon(Icons.favorite_border_rounded,
                                            color: Colors.black),
                                        Text(
                                          '13',
                                          style: TextStyle(
                                              color: Colors.grey,
                                              fontWeight: FontWeight.w400),
                                        ),
                                      ],
                                    ),
                                  ],
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
            ),
            Column(
              children: [
                Container(
                  child: Padding(
                    padding: EdgeInsets.symmetric(horizontal: 10, vertical: 12),
                    child: Card(
                      elevation: 2,
                      child: Row(
                        children: [
                          CircleAvatar(
                            backgroundImage: NetworkImage(
                                "https://allimages.sgp1.digitaloceanspaces.com/wikilaptopcom/2021/01/1610802039_Tuyen-tap-avatar-anh-dai-dien-dep-doc-dao-da.jpg?fit=crop&w=840&q=80"),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(left: 8.0),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Row(
                                  children: [
                                    Text(
                                      "Dat: ",
                                      style: TextStyle(
                                          color: Colors.black,
                                          fontWeight: FontWeight.w500),
                                    ),
                                    Text("bai viet hay qua",
                                        style: TextStyle(
                                            color: Colors.black,
                                            fontWeight: FontWeight.w200)),
                                  ],
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ],
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: TextField(
                style: TextStyle(
                  height: 0.85,
                  fontSize: 14.0,
                ),
                textAlignVertical: TextAlignVertical(y: 0.5),
                decoration: InputDecoration(
                    contentPadding: EdgeInsets.only(left: 16, bottom: 20),
                    suffixIcon: Icon(Icons.send),
                    hintText: "Write a comment..."),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
