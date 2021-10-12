import 'package:flutter/material.dart';
import 'package:safetravel/screens/tour/confirm/confirm_constants.dart';

class CreditCardsPage extends StatelessWidget {
  const CreditCardsPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return SingleChildScrollView(
      child: Container(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            _buildCreditCard(
              color: const Color(0xFF090943),
              cardExpiration: "08/2022",
              cardHolder: "DAO PHUONG NAM",
              cardNumber: "3546 7532 XXXX 9742",
              size: size,
            ),
            _buildAddCardButton(),
            customLine(
              Text('Số tiền cần thanh toán',
                  style: h3nor.copyWith(color: goodGray)),
              Text('325 000 VNĐ', style: h2),
              10,
            )
          ],
        ),
      ),
    );
  }

  Card _buildCreditCard(
      {required Color color,
      required String cardNumber,
      required String cardHolder,
      required String cardExpiration,
      required Size size}) {
    return Card(
      elevation: 10,
      color: Colors.black,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(14),
      ),
      child: Container(
        height: size.width * 0.6,
        padding: const EdgeInsets.only(left: 16.0, right: 16.0, bottom: 22.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            _buildLogosBlock(),
            Padding(
              padding: const EdgeInsets.only(top: 16.0),
              child: Text(
                cardNumber,
                style: const TextStyle(
                    color: Colors.white,
                    fontSize: 21,
                    fontFamily: 'CourrierPrime'),
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                _buildDetailsBlock(
                  label: 'CARDHOLDER',
                  value: cardHolder,
                ),
                _buildDetailsBlock(label: 'VALID THRU', value: cardExpiration),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Row _buildLogosBlock() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: <Widget>[
        Image.asset(
          "assets/images/contact_less.png",
          height: 20,
          width: 18,
        ),
        Image.asset(
          "assets/images/mastercard.png",
          height: 50,
          width: 50,
        ),
      ],
    );
  }

  Column _buildDetailsBlock({required String label, required String value}) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Text(
          label,
          style: const TextStyle(
              color: Colors.grey, fontSize: 9, fontWeight: FontWeight.bold),
        ),
        Text(
          value,
          style: const TextStyle(
              color: Colors.white, fontSize: 15, fontWeight: FontWeight.bold),
        )
      ],
    );
  }

  Widget _buildAddCardButton() {
    return Container(
      margin: EdgeInsets.only(top: 10),
      alignment: Alignment.centerRight,
      child: SizedBox(
        height: 50,
        width: 125,
        child: RawMaterialButton(
          onPressed: () {},
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                'Thêm thẻ',
                style: h3.copyWith(
                  color: goodGray,
                  fontWeight: FontWeight.w500,
                ),
              ),
              const SizedBox(
                width: 10,
              ),
              Icon(
                Icons.add,
                size: 19,
                color: goodGray,
              ),
            ],
          ),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(50),
          ),
        ),
      ),
    );
  }

  Widget customLine(Widget first, Widget second, double marginTop) {
    return Container(
      margin: EdgeInsets.fromLTRB(15, 10, 15, 10),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          first,
          second,
        ],
      ),
    );
  }
}
