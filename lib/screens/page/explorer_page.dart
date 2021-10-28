import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:safetravel/screens/home/search_screen.dart';
import 'package:safetravel/screens/page/constants.dart';
import 'package:safetravel/screens/page/data.dart';
import 'package:safetravel/screens/page/model.dart';
import 'package:safetravel/screens/tour/confirm/confirm_constants.dart';
import 'package:safetravel/screens/tour/tour_detail_screen.dart';
import 'package:safetravel/utilities/constants.dart';

class ExplorerPage extends StatefulWidget {
  const ExplorerPage(this.setVisibleAppbar, {Key? key}) : super(key: key);

  final Function setVisibleAppbar;

  @override
  State<ExplorerPage> createState() => _ExplorerPageState();
}

class _ExplorerPageState extends State<ExplorerPage> {
  final ScrollController _scrollController = ScrollController();
  final TextEditingController textController = TextEditingController();

  Future<void> _refresh() {
    return Future.delayed(
      const Duration(milliseconds: 1500),
      () => setState(() {}),
    );
  }

  bool hasFocus = false;

  void _focusChange(focus) {
    setState(() {
      if (focus) {
        hasFocus = true;
      } else {
        if (textController.text.isEmpty) {
          hasFocus = false;
        } else {
          hasFocus = true;
        }
      }
    });
  }

  void _moreAction(TourModel model) {
    Navigator.of(context)
        .push(MaterialPageRoute(builder: (context) => TourDetail(model)));
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

  List<Widget> buildTourCards() {
    List<Widget> result = [];
    tourData.shuffle();

    for (var item in tourData) {
      result.add(buildTourCard(item));
    }
    return result;
  }

  @override
  Widget build(BuildContext context) {
    return NotificationListener(
      onNotification: (t) {
        if (t is ScrollEndNotification) {
          if (_scrollController.position.userScrollDirection ==
              ScrollDirection.forward) {
            widget.setVisibleAppbar(true);
          }
          if (_scrollController.position.userScrollDirection ==
              ScrollDirection.reverse) {
            widget.setVisibleAppbar(false);
          }
        }
        return true;
      },
      child: RefreshIndicator(
        onRefresh: _refresh,
        child: SingleChildScrollView(
          controller: _scrollController,
          child: Container(
            margin: EdgeInsets.only(top: 20.h),
            child: Column(
              children: [
                Container(
                  margin: EdgeInsets.symmetric(horizontal: 30.w),
                  padding: EdgeInsets.symmetric(horizontal: 30.w),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.all(
                      hasFocus ? Radius.circular(20.r) : Radius.circular(50.r),
                    ),
                    boxShadow: [boxShadowDetail],
                  ),
                  child: Column(
                    children: [
                      FocusScope(
                        child: Focus(
                          onFocusChange: _focusChange,
                          child: Padding(
                            padding: EdgeInsets.symmetric(horizontal: 20.w),
                            child: TextField(
                              controller: textController,
                              decoration: InputDecoration(
                                labelText: 'Bạn muốn đi đâu?',
                                labelStyle: h4,
                                border: hasFocus
                                    ? const UnderlineInputBorder()
                                    : InputBorder.none,
                              ),
                            ),
                          ),
                        ),
                      ),
                      Visibility(
                        visible: hasFocus,
                        child: Column(
                          children: [
                            SizedBox(
                              height: 15.h,
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                searchAdvancedButton('Tìm kiếm nâng cao', () {
                                  Navigator.of(context).push(MaterialPageRoute(
                                      builder: (context) => SearchScreen()));
                                }),
                                searchButton('Tìm kiếm', () {
                                  setState(() {});
                                }),
                              ],
                            ),
                            SizedBox(
                              height: 15.h,
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  height: 20.h,
                ),
                Column(
                  children: buildTourCards(),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Column buildTourCard(TourModel model) {
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

    Color discountColor = Colors.yellow;
    if (model.discount > 0.1) discountColor = Colors.orange;

    Widget discount = model.discount != 0
        ? Container(
            padding: EdgeInsets.symmetric(
              horizontal: 10.w,
              vertical: 10.h,
            ),
            decoration: BoxDecoration(
              color: discountColor,
              borderRadius: BorderRadius.circular(8),
            ),
            child: Text(
              'Giảm giá ' + (model.discount * 100).toStringAsFixed(0) + '%',
              style: h4b,
            ),
          )
        : const SizedBox();

    return Column(
      children: [
        Stack(
          children: [
            Container(
              margin: EdgeInsets.fromLTRB(40.w, 0.3.sh - 5.h, 40.w, 0.h),
              padding: EdgeInsets.symmetric(vertical: 20.h, horizontal: 20.w),
              decoration: BoxDecoration(
                color: Colors.white,
                boxShadow: [boxShadowDetail],
              ),
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
                        child: const Icon(Icons.verified_user,
                            color: kPrimaryColor),
                      ),
                    ],
                  ),
                  const Divider(),
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
                  const Divider(),
                  Column(
                    children: [
                      Row(
                        children: [
                          const Icon(Icons.location_pin),
                          SizedBox(
                            width: 10.w,
                          ),
                          Text(
                            model.location,
                            style: h4,
                          )
                        ],
                      ),
                      SizedBox(
                        height: 5.h,
                      ),
                      /*
                      SizedBox(
                        height: 5.h,
                      ),
                      Row(
                        children: [
                          const Icon(Icons.date_range),
                          SizedBox(
                            width: 10.w,
                          ),
                          Text(
                            model.date,
                            style: h4,
                          )
                        ],
                      )
                      */
                    ],
                  ),
                  const Divider(),
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
                  SizedBox(
                    height: 10.h,
                  ),
                  Row(
                    children: [
                      discount,
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text('Giá chỉ từ', style: h4b),
                          model.discount != 0.0
                              ? Text(model.discountPriceVND,
                                  style: h4b.copyWith(
                                    color: goodGray,
                                    decoration: TextDecoration.lineThrough,
                                  ))
                              : const SizedBox(),
                          Row(
                            children: [
                              Text(model.priceVND,
                                  style: h3b.copyWith(color: kPrimaryColor)),
                              Text(
                                '/' + model.duration.toString() + ' ngày',
                                style: h4b,
                              ),
                            ],
                          ),
                        ],
                      ),
                      moreButton('Xem thêm', () => _moreAction(model)),
                    ],
                  ),
                  SizedBox(
                    height: 20.h,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      Text(
                          model.commentCount.toString() +
                              ' bình luận và ' +
                              model.shareCount.toString() +
                              ' lượt chia sẻ',
                          style: h4),
                    ],
                  ),
                  const Divider(),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          const Icon(Icons.favorite_border),
                          SizedBox(
                            width: 10.w,
                          ),
                          const Text('Thích')
                        ],
                      ),
                      Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          const Icon(Icons.notes),
                          SizedBox(
                            width: 10.w,
                          ),
                          const Text('Bình luận')
                        ],
                      ),
                      Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          const Icon(Icons.share),
                          SizedBox(
                            width: 10.w,
                          ),
                          const Text('Chia sẻ')
                        ],
                      )
                    ],
                  )
                ],
              ),
            ),
            Stack(
              children: [
                Container(
                  margin: EdgeInsets.fromLTRB(30.w, 0, 30.w, 0.h),
                  height: 0.3.sh,
                  decoration: BoxDecoration(
                    boxShadow: [boxShadowImage],
                    borderRadius: BorderRadius.all(
                      Radius.circular(10.r),
                    ),
                    image: DecorationImage(
                      image: AssetImage(model.imgUrl[0]),
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
                Positioned(
                  bottom: 0,
                  left: 0,
                  right: 0,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Container(
                        alignment: Alignment.center,
                        height: 20.h,
                        width: 60.w,
                        decoration: BoxDecoration(
                          color: Colors.black.withOpacity(0.4),
                          borderRadius: BorderRadius.all(
                            Radius.circular(20.r),
                          ),
                        ),
                        margin: EdgeInsets.only(bottom: 8.h),
                        child: Text(
                          '1/' + model.imgUrl.length.toString(),
                          style: h4.copyWith(
                            color: Colors.white,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ],
        ),
        SizedBox(
          height: 20.h,
        ),
      ],
    );
  }

  Widget moreButton(String text, VoidCallback onPressed) {
    return SizedBox(
      height: 40.h,
      child: ElevatedButton(
        onPressed: onPressed,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              text,
              style: h4b.copyWith(
                color: Colors.white,
                fontWeight: FontWeight.w600,
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

  Widget searchAdvancedButton(String text, VoidCallback onPressed) {
    return SizedBox(
      height: 44.h,
      width: 250.w,
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

  Widget searchButton(String text, VoidCallback onPressed) {
    return SizedBox(
      height: 40.h,
      child: ElevatedButton(
        onPressed: onPressed,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              text,
              style: h4b.copyWith(
                color: Colors.white,
                fontWeight: FontWeight.w600,
              ),
            ),
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
