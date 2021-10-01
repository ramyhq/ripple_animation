import 'package:flutter/material.dart';

const Color sliderColor1 = Color(0xffffcc00);
const Color sliderColor2 = Color(0xffff0059);

SliderThemeData sliderTheme = SliderThemeData(
    activeTrackColor: sliderColor2,
    inactiveTrackColor: Colors.black87,
    activeTickMarkColor: Colors.black,
    inactiveTickMarkColor: Colors.white,
    thumbColor: sliderColor2,
    trackHeight: 15,
    thumbShape: const RoundSliderThumbShape(enabledThumbRadius: 15),
    overlayColor: Colors.red.withOpacity(0.8),
    overlayShape: const RoundSliderOverlayShape(overlayRadius: 35.0),
    valueIndicatorTextStyle: const TextStyle(
      color: sliderColor1, letterSpacing: 2.0,)
);
