import 'package:app/utils/dimensions.dart';
import 'package:flutter/material.dart';

class AmountDisplay extends StatelessWidget {
  final int amount;

  const AmountDisplay({super.key, required this.amount});

  @override
  Widget build(BuildContext context) {
    return Text(
      'Taka: $amount',
      style: const TextStyle(
        fontSize: AppDimensions.amountDisplayFontSize, 
        fontWeight: FontWeight.bold
      ),
    );
  }
}
