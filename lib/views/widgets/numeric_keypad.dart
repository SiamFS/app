import 'package:app/utils/dimensions.dart';
import 'package:flutter/material.dart';

class NumericKeypad extends StatelessWidget {
  final void Function(int) onDigitPressed;
  final VoidCallback onClearPressed;

  const NumericKeypad(
      {super.key, required this.onDigitPressed, required this.onClearPressed});

  @override
  Widget build(BuildContext context) {
    return OrientationBuilder(builder: (context, orientation) {
      if (orientation == Orientation.portrait) {
        return _buildPortraitKeypad();
      } else {
        return _buildLandscapeKeypad();
      }
    });
  }

  Widget _buildPortraitKeypad() {
    return SizedBox(
      width: double.infinity,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Row(
            children: [_buildButton('1'), _buildButton('2'), _buildButton('3')],
          ),
          const SizedBox(height: AppDimensions.keypadButtonSpacing),
          Row(
            children: [_buildButton('4'), _buildButton('5'), _buildButton('6')],
          ),
          const SizedBox(height: AppDimensions.keypadButtonSpacing),
          Row(
            children: [_buildButton('7'), _buildButton('8'), _buildButton('9')],
          ),
          const SizedBox(height: AppDimensions.keypadButtonSpacing),
          Row(
            children: [
              _buildButton('0'),
              Expanded(
                flex: AppDimensions.clearButtonFlex,
                child: Padding(
                  padding: const EdgeInsets.all(AppDimensions.keypadButtonPadding),
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.grey[300],
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(AppDimensions.buttonBorderRadius),
                      ),
                    ),
                    onPressed: onClearPressed,
                    child: const Text(
                      'CLEAR',
                      style: TextStyle(
                        fontSize: AppDimensions.clearButtonFontSize,
                        fontWeight: FontWeight.bold,
                        color: Colors.black,
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildLandscapeKeypad() {
    return Container(
      padding: const EdgeInsets.all(AppDimensions.landscapeContainerPadding),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              _buildButton('1'),
              _buildButton('2'),
              _buildButton('3'),
              _buildButton('4')
            ],
          ),
          const SizedBox(height: AppDimensions.keypadButtonSpacing),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              _buildButton('5'),
              _buildButton('6'),
              _buildButton('7'),
              _buildButton('8')
            ],
          ),
          const SizedBox(height: AppDimensions.keypadButtonSpacing),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              _buildButton('9'),
              _buildButton('0'),
              Expanded(
                flex: AppDimensions.clearButtonFlex,
                child: Padding(
                  padding: const EdgeInsets.all(AppDimensions.keypadButtonPadding),
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.grey[300],
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(AppDimensions.buttonBorderRadius),
                      ),
                    ),
                    onPressed: onClearPressed,
                    child: const Text(
                      'CLEAR',
                      style: TextStyle(
                        fontSize: AppDimensions.clearButtonFontSizeLandscape,
                        fontWeight: FontWeight.bold,
                        color: Colors.black,
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildButton(String text, {int flex = 1}) {
    return Expanded(
      flex: flex,
      child: Padding(
        padding: const EdgeInsets.all(AppDimensions.keypadButtonPadding),
        child: ElevatedButton(
          style: ElevatedButton.styleFrom(
            backgroundColor: Colors.grey[300],
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(AppDimensions.buttonBorderRadius),
            ),
          ),
          onPressed: () {
            if (text == 'CLEAR') {
              onClearPressed();
            } else {
              onDigitPressed(int.parse(text));
            }
          },
          child: Text(
            text,
            style: const TextStyle(
              fontSize: AppDimensions.keypadButtonFontSize,
              fontWeight: FontWeight.bold,
              color: Colors.black,
            ),
          ),
        ),
      ),
    );
  }
}
