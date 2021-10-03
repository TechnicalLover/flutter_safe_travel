import 'package:flutter/material.dart';
import 'package:safetravel/screens/tour/qr-code.dart';
import 'package:safetravel/utilities/constants.dart';

class Confirm extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Confirm book'),
        backgroundColor: kPrimaryColor,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Form(
          child: ListView(
            children: <Widget>[
              TextFormField(
                decoration: InputDecoration(labelText: 'Your name: '),
                textInputAction: TextInputAction.next,
                onFieldSubmitted: (_) {},
                validator: (value) {},
                onSaved: (value) {},
              ),
              TextFormField(
                decoration: InputDecoration(labelText: 'Phone: '),
                textInputAction: TextInputAction.next,
                keyboardType: TextInputType.number,
                onFieldSubmitted: (_) {},
                validator: (value) {},
                onSaved: (value) {},
              ),
              TextFormField(
                decoration: InputDecoration(labelText: 'Address: '),
                validator: (value) {},
                onSaved: (value) {},
              ),
              ButtonTheme(
                            minWidth: 1000.0,
                            height: 100.0,
                            child: OutlinedButton(
                              onPressed: () {
                                Navigator.of(context).push(MaterialPageRoute(
                                    builder: (context) => QRCode()));
                              },
                              child: Text(
                                "Book",
                                style: TextStyle(color: Colors.white),
                              ),
                              style: ButtonStyle(
                                backgroundColor:
                                    MaterialStateProperty.all<Color>(
                                        Colors.blue.shade800,),
                              ),
                            ),
                          )
                          
            ],

          ),
        ),
      ),
    );
  }
}
