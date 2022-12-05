import 'package:flutter/material.dart';
import 'package:shoes_app/src/widgets/widgets.dart';


class AddCarButton extends StatelessWidget {
  final double amount;
  const AddCarButton ({Key? key,
   required this.amount
  }) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 100,
      decoration: BoxDecoration(
        color: Colors.grey.withOpacity(0.1),
        borderRadius: BorderRadius.circular(100)
      ),
      child: Row(
        children: [
          const SizedBox(width: 20,),
          Text( '\$$amount',
            style: const TextStyle(
              fontSize: 28,
              fontWeight: FontWeight.bold
            ),
          ),
          const Spacer(),
          const OrangeButton(text: 'Add to car'),
          const SizedBox(width: 20,),
        ],
      )
    );
  }
}