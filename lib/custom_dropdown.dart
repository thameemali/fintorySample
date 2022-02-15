import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class CustomDropDown extends StatefulWidget {
  late final List<String> list;
  late final int passKey;

  CustomDropDown({required this.list, required this.passKey});

  @override
  State<CustomDropDown> createState() => _CustomDropDownState();
}

class _CustomDropDownState extends State<CustomDropDown> {
  String selectedCountry = "India";
  String selectedState = "Kerala";
  String selectedCity = "Cochi";

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(30),
        border: Border.all(style: BorderStyle.solid,color: Colors.black26),
        color: Colors.white70,
      ),
      child: DropdownButtonHideUnderline(
        child: DropdownButton<String>(
          borderRadius: BorderRadius.circular(30),
          value: widget.passKey == 1
              ? selectedCountry
              : widget.passKey == 2
                  ? selectedState
                  : widget.passKey == 3
                      ? selectedCity
                      : null,
          items: widget.list.map((String value) {
            return DropdownMenuItem<String>(
              value: value,
              child: Padding(
                padding: const EdgeInsets.only(left: 15.0),
                child: Text(
                  value,
                  style: const TextStyle(
                    color: Colors.black54,
                    fontWeight: FontWeight.bold,
                    fontSize: 16,
                  ),
                ),
              ),
            );
          }).toList(),
          onChanged: (String? va) {
            setState(() {
              widget.passKey == 1
                  ? selectedCountry = va!
                  : widget.passKey == 2
                      ? selectedState = va!
                      : widget.passKey == 3
                          ? selectedCity = va!
                          : null;
            });
          },
        ),
      ),
    );
  }
}
