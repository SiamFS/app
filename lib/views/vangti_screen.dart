import 'package:app/controllers/vangti_controller.dart';
import 'package:app/views/widgets/amount_display.dart';
import 'package:app/views/widgets/numeric_keypad.dart';
import 'package:app/utils/constants.dart';
import 'package:app/utils/dimensions.dart';
import 'package:flutter/material.dart';

class VangtiScreen extends StatefulWidget {
  const VangtiScreen({super.key});

  @override
  State<VangtiScreen> createState() => _VangtiScreenState();
}

class _VangtiScreenState extends State<VangtiScreen> {
  final VangtiController _controller = VangtiController();

  void _onDigitPressed(int digit) {
    setState(() {
      _controller.addDigit(digit);
    });
  }

  void _onClearPressed() {
    setState(() {
      _controller.clear();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('VangtiChai'),
      ),
      body: OrientationBuilder(
        builder: (context, orientation) {
          if (orientation == Orientation.portrait) {
            return _buildPortraitLayout();
          } else {
            return _buildLandscapeLayout();
          }
        },
      ),
    );
  }

  Widget _buildPortraitLayout() {
    return Padding(
      padding: const EdgeInsets.symmetric(
        horizontal: AppDimensions.screenHorizontalPadding, 
        vertical: AppDimensions.screenVerticalPadding
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          // Amount display at the top with better spacing
          Padding(
            padding: const EdgeInsets.only(
              top: AppDimensions.amountDisplayTopPadding, 
              bottom: AppDimensions.amountDisplayBottomPadding
            ),
            child: Center(child: AmountDisplay(amount: _controller.model.amount)),
          ),
          
          // Change display and keypad side by side
          Expanded(
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // Left side for change display with more space
                Expanded(
                  flex: AppDimensions.changeDisplayFlex,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: takaNotes.map((denomination) => 
                      Padding(
                        padding: const EdgeInsets.only(bottom: AppDimensions.changeItemBottomPadding),
                        child: Text(
                          '$denomination: ${_controller.model.change[denomination] ?? 0}',
                          style: const TextStyle(
                            fontSize: AppDimensions.changeDisplayFontSize,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      ),
                    ).toList(),
                  ),
                ),
                
                // Right side for keypad
                Expanded(
                  flex: AppDimensions.keypadFlex,
                  child: NumericKeypad(
                    onDigitPressed: _onDigitPressed,
                    onClearPressed: _onClearPressed,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildLandscapeLayout() {
    return Padding(
      padding: const EdgeInsets.all(AppDimensions.landscapeContainerPadding),
      child: Column(
        children: [
          // Amount display at the top with more padding
          Padding(
            padding: const EdgeInsets.only(
              top: AppDimensions.amountDisplayTopPaddingLandscape, 
              bottom: AppDimensions.amountDisplayBottomPaddingLandscape
            ),
            child: AmountDisplay(amount: _controller.model.amount),
          ),
          Expanded(
            child: Row(
              children: [
                Expanded(
                  flex: AppDimensions.landscapeChangeDisplayFlex,
                  child: Row(
                    children: [
                      // First column of change display
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            _buildChangeItem(500),
                            _buildChangeItem(100),
                            _buildChangeItem(50),
                            _buildChangeItem(20),
                          ],
                        ),
                      ),
                      // Second column of change display
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            _buildChangeItem(10),
                            _buildChangeItem(5),
                            _buildChangeItem(2),
                            _buildChangeItem(1),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
                Expanded(
                  flex: AppDimensions.landscapeKeypadFlex,
                  child: NumericKeypad(
                    onDigitPressed: _onDigitPressed,
                    onClearPressed: _onClearPressed,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildChangeItem(int denomination) {
    return Padding(
      padding: const EdgeInsets.only(bottom: AppDimensions.changeItemBottomPaddingLandscape),
      child: Text(
        '$denomination: ${_controller.model.change[denomination] ?? 0}',
        style: TextStyle(
          fontSize: MediaQuery.of(context).orientation == Orientation.landscape 
              ? AppDimensions.changeDisplayFontSizeLandscape 
              : AppDimensions.changeDisplayFontSizePortrait,
          fontWeight: FontWeight.w500,
        ),
      ),
    );
  }
}
