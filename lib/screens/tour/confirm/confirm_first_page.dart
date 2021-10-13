import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'confirm_constants.dart';

class FirstPage extends StatefulWidget {
  const FirstPage({Key? key}) : super(key: key);

  @override
  _FirstPageState createState() => _FirstPageState();
}

class _FirstPageState extends State<FirstPage> {
  int _genderValue = 0;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 30),
      child: Form(
        child: Column(
          children: [
            textFiled(const Icon(Icons.account_circle), 'Họ và tên',
                'Đào Phương Nam'),
            const SizedBox(
              height: 15,
            ),
            genderRadio(),
            textFiled(
                const Icon(Icons.mail_outline), 'Email', 'ealflm@gmail.com'),
            textFiled(const Icon(Icons.phone), 'Số điện thoại', '0369085855'),
            textFiled(const Icon(Icons.home), 'Địa chỉ',
                'Quận 9, Thành Phố Hồ Chí Minh'),
          ],
        ),
      ),
    );
  }

  TextFormField textFiled(Icon icon, String text, String init) {
    return TextFormField(
      initialValue: init,
      decoration: InputDecoration(
        prefixIcon: icon,
        labelText: text,
        //labelStyle: formStyle,
      ),
    );
  }

  Row genderRadio() {
    return Row(
      children: [
        Container(
          width: 25,
          height: 25,
          margin: const EdgeInsets.symmetric(horizontal: 12),
          child: SvgPicture.asset('assets/icons/gender.svg', color: goodGray),
        ),
        Text(
          'Giới tính',
          style: formStyle.copyWith(fontSize: 16),
        ),
        Row(
          children: [
            Radio(
              value: 0,
              groupValue: _genderValue,
              onChanged: (value) {
                setState(() {
                  _genderValue = value as int;
                });
              },
            ),
            Text(
              "Nam",
              style: formStyle.copyWith(fontSize: 16),
            ),
          ],
        ),
        Row(
          children: [
            Radio(
              value: 1,
              groupValue: _genderValue,
              onChanged: (value) {
                setState(() {
                  _genderValue = value as int;
                });
              },
            ),
            Text(
              "Nữ",
              style: formStyle.copyWith(fontSize: 16),
            ),
          ],
        ),
      ],
    );
  }
}
