import 'package:flutter/material.dart';
import 'package:i_tracker/businesslogic/DBUpdate.dart';
import 'package:i_tracker/components/custom_appbar.dart';
import 'package:i_tracker/constants/Theme/appcolors.dart';

class Investment extends StatefulWidget {
  @override
  _InvestmentState createState() => _InvestmentState();
}

class _InvestmentState extends State<Investment> {
  final _invname = TextEditingController();
  final _description = TextEditingController();
  final _initialAmount = TextEditingController();
  final _fromDate = TextEditingController();
  DatabaseUpdate D = new DatabaseUpdate();
  final formKey = new GlobalKey<FormState>();

  _Isaveform() {
    var form = formKey.currentState;
    if (form.validate()) {
      form.save();
      setState(() {
        print(_invname);
        print(_description.text);
        print(_initialAmount.text);
        print(_fromDate);
        D.CollectionDBUpdate(_invname.text, _description.text,
            _initialAmount.text, _fromDate.text);
      });
      Navigator.pushNamed(context, '/dashboard');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: MyAppBar(
        title: Text(
          'Investment Details',
          style: TextStyle(),
        ),
      ),
      backgroundColor: ThemeColor.background,
      body: SingleChildScrollView(
        child: Form(
          key: formKey,
          child: Padding(
            padding: EdgeInsets.all(30),
            child: Column(
              //Name
              children: <Widget>[
                TextFormField(
                  validator: (input) {
                    if (input.isEmpty) {
                      return 'This cannot be empty';
                    }
                  },
                  controller: _invname,
                  decoration: InputDecoration(
                      border: OutlineInputBorder(),
                      labelText: 'Name',
                      hintText: 'Enter the Name of the investment'),
                ),
                SizedBox(
                  height: 25,
                ),
                //Description
                TextFormField(
                  validator: (input) {
                    if (input.isEmpty) {
                      return 'This cannot be empty';
                    }
                  },
                  controller: _description,
                  decoration: InputDecoration(
                      border: OutlineInputBorder(),
                      labelText: 'Description ',
                      hintText: '(optional) Notes regarding investment '),
                ),
                SizedBox(
                  height: 25,
                ),
                TextFormField(
                  validator: (input) {
                    if (input.isEmpty) {
                      return 'This cannot be empty';
                    }
                  },
                  controller: _initialAmount,
                  decoration: InputDecoration(
                      border: OutlineInputBorder(),
                      labelText: 'Initial amount',
                      hintText: 'Enter the total invested amount'),
                ),
                SizedBox(
                  height: 25,
                ),
                TextFormField(
                  validator: (input) {
                    if (input.isEmpty) {
                      return 'This cannot be empty';
                    }
                  },
                  controller: _fromDate,
                  decoration: InputDecoration(
                      border: OutlineInputBorder(),
                      labelText: 'Date',
                      hintText: 'Enter the date of investment'),
                ),
                SizedBox(
                  height: 50,
                ),
                Container(
                  height: 50,
                  width: 250,
                  decoration: BoxDecoration(
                      color: ThemeColor.button,
                      borderRadius: BorderRadius.circular(20)),
                  child: FlatButton(
                    onPressed: _Isaveform,
                    child: Text(
                      'SAVE',
                      style: TextStyle(color: ThemeColor.background),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
