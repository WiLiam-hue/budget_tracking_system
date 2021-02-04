import 'package:flutter/material.dart';
import 'package:budget_tracking_system/services/currency.dart';

class CurrencyList {
  String name, value;

  CurrencyList({this.name, this.value});
}

class CurrencySelection extends StatefulWidget {
  @override
  _CurrencySelectionState createState() => _CurrencySelectionState();
}

class _CurrencySelectionState extends State<CurrencySelection> {
  String _currentSelectedCurrency = "Main";
  List _currencyTypes = ["Main", "Sub"];

  List currencyList = Currency.fullList;

  // String selectedMainCurrency = 'myr';
  // String selectedSubCurrency = 'usd';
  
  bool _isSelected = false;

  displayCurrency() {
    return Theme(
      data: ThemeData(unselectedWidgetColor: Colors.grey),
      child: ListView.separated(
        itemCount: currencyList.length,
        itemBuilder: (BuildContext context, int index) {
          return CheckboxListTile(          
            //ListTileControlAffinity.trailing will place the checkbox at the trailing
            controlAffinity: ListTileControlAffinity.trailing,
            activeColor: Color.fromRGBO(255, 185, 49, 1),
            title: Text(
              currencyList[index],
              style: TextStyle(color: Colors.white),
            ),
            value: _isSelected,
            onChanged: (bool value) {
              setState(() {
                _isSelected = value;
              });
            },
          );
        },
        separatorBuilder: (context, index) {
          return Divider(
            color: Colors.grey,
            indent: 15.0,
            endIndent: 15.0,
          );
        },
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Color.fromRGBO(57, 57, 57, 1),
        appBar: AppBar(
          backgroundColor: Color.fromRGBO(18, 18, 18, 1),
          title: Row(
            children: [
              Flexible(
                child: Text('Currency Selection'),
              ),
              // Expanded(
              //   child: Container(
              //     height: 40,
              //     padding: EdgeInsets.symmetric(horizontal: 10.0),
              //     decoration: BoxDecoration(
              //       border: Border.all(
              //           color: Colors.white,
              //           style: BorderStyle.solid,
              //           width: 0.20),
              //     ),
              //     child: DropdownButtonHideUnderline(
              //       child: Theme(
              //         data: Theme.of(context).copyWith(
              //           canvasColor: Color.fromRGBO(18, 18, 18, 1),
              //         ),
              //         child: DropdownButton(
              //           style: TextStyle(color: Colors.white),
              //           value: _currentSelectedCurrency,
              //           onChanged: (newValue) {
              //             setState(() {
              //               _currentSelectedCurrency = newValue;
              //             });
              //           },
              //           items: _currencyTypes.map((value) {
              //             return DropdownMenuItem<String>(
              //               value: value,
              //               child: Text(value),
              //             );
              //           }).toList(),
              //         ),
              //       ),
              //     ),
              //   ),
              // ),
            ],
          ),
        ),
        body: displayCurrency());
  }
}
