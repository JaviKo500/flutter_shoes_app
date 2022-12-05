import 'package:flutter/material.dart';


class CustomAppBar extends StatelessWidget {
  final String text;
  const CustomAppBar ({Key? key, required this.text}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 30),
        child: Container(
          margin: const EdgeInsets.only( top: 30 ),
          width: double.infinity,
          child: Row(
            children: [
              Text(
                text,
                style: const TextStyle(
                  fontSize: 30,
                  fontWeight: FontWeight.w700
                )
              ),
              const Spacer(),
              const Icon(Icons.search, size: 30,),
            ],
          ),
        ),
      ),
    );
  }
}