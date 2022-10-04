import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class TextfileCom extends StatelessWidget {
  TextfileCom(
      {Key? key,
      this.title,
      this.icon,
      this.controller,
      this.maxLength,
      this.border,
      this.keyboardType})
      : super(key: key);
  String? title;
  IconData? icon;
  int? maxLength;

  TextInputType? keyboardType;
  BoxBorder? border;

  TextEditingController? controller;
  @override
  Widget build(BuildContext context) {
    return Container(
      // padding: EdgeInsets.all(20),
      // height: 160,
      width: MediaQuery.of(context).size.width - 60,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(5),
        color: Colors.grey.withOpacity(.1),
        border: border,
        boxShadow: [
          BoxShadow(
            color: Color.fromARGB(255, 233, 230, 230).withOpacity(0.1),
            spreadRadius: 1,
            blurRadius: 1,
            offset: Offset(1, 3), // changes position of shadow
          ),
        ],
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10),
        child: TextField(
          controller: controller,
          maxLength: maxLength,
          keyboardType: keyboardType,
          decoration: InputDecoration(
              counterText: "",
              hintText: title,
              hintStyle: TextStyle(
                  fontSize: 15,
                  fontWeight: FontWeight.bold,
                  color: Colors.grey),
              border: InputBorder.none),
        ),
      ),
    );
  }
}
