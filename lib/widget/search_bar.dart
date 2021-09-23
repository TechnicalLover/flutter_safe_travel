import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:safetravel/utilities/constants.dart';

class SearchBar extends StatefulWidget {
  SearchBar({Key? key}) : super(key: key);

  @override
  _SearchBarState createState() => _SearchBarState();
}

class _SearchBarState extends State<SearchBar> {
  var _controller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        const SizedBox(height: 10.0),
        Container(
          alignment: Alignment.centerLeft,
          decoration: kSearchBarDecorationStyle,
          height: 60.0,
          margin: const EdgeInsets.only(left: 10, right: 10),
          child: TextField(
            keyboardType: TextInputType.text,
            controller: _controller,
            style: TextStyle(
              color: Colors.black,
              fontFamily: 'OpenSans',
            ),
            decoration: InputDecoration(
                border: InputBorder.none,
                contentPadding: EdgeInsets.only(top: 14.0),
                prefixIcon: Icon(
                  Icons.search,
                  color: Colors.black,
                ),
                focusColor: Colors.black,
                hintText: 'Location, title',
                suffixIcon: IconButton(
                    onPressed: () {
                      setState(() {
                        _controller.clear();
                      });
                    },
                    icon: Icon(Icons.cancel))),
          ),
        ),
      ],
    );
  }
}
