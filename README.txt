VangtiChai - Flutter App
=======================

## Description
This is a Flutter implementation of the VangtiChai Android app that calculates change for Taka notes.

## Features
- Numeric keypad with digits 0-9 and clear button
- Calculates change in Taka denominations (500, 100, 50, 20, 10, 5, 2, 1)
- Responsive design for portrait and landscape orientations
- State preservation during orientation changes

## Device Testing
The app has been tested on the following devices/screen configurations:

### Primary Test Devices (as per requirements):
- Pixel XL phone (411x731dp) - Portrait mode ✓
- Pixel XL phone (411x731dp) - Landscape mode ✓
- Nexus 10 tablet (800x1280dp) - Portrait mode ✓
- Nexus 10 tablet (800x1280dp) - Landscape mode ✓

### Additional Test Devices:
- Android SDK Emulator (Generic Phone) - Portrait/Landscape ✓
- [Add other devices tested here]

## Technical Implementation
- Built with Flutter framework
- Uses MVC architecture pattern
- Implements responsive design with OrientationBuilder
- Centralizes dimension values in AppDimensions class
- Maintains state during orientation changes
- Proper separation of concerns with Controller, Model, and View layers

## Files Structure
- lib/main.dart - App entry point
- lib/views/vangti_screen.dart - Main screen with layout logic
- lib/views/widgets/amount_display.dart - Amount display widget
- lib/views/widgets/numeric_keypad.dart - Custom numeric keypad widget
- lib/controllers/vangti_controller.dart - Business logic controller
- lib/models/vangti_model.dart - Data model
- lib/utils/constants.dart - App constants
- lib/utils/dimensions.dart - Dimension constants (replaces hardcoded values)
