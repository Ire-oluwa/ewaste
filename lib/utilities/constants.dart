import 'package:flutter/material.dart';

const Text kMainTitle = Text(
  'Trashing Made Easy',
  style: TextStyle(
    color: Colors.white,
    fontSize: 30,
    fontWeight: FontWeight.bold,
  ),
);

const Text kSubHeading = Text(
  'Get an overview of how you\'re performing\n and motivate yourself to achieve even more',
  textAlign: TextAlign.center,
  style: kSubHeadingStyle,
);

Widget kTextColumn = Center(
  child: Column(
    children: const [
      kMainTitle,
      kSubHeading,
    ],
  ),
);

const Text kSkipText = Text(
  'Skip',
  style: TextStyle(
    color: Colors.white,
  ),
);

Decoration kGradientDecoration = const BoxDecoration(
  gradient: LinearGradient(
    begin: Alignment.topCenter,
    end: Alignment.bottomLeft,
    colors: [
      //Colors.lightGreenAccent,
      Color(0xffF9C117),
      Color(0xff009933),
    ],
    stops: [
      0.001,
      0.5,
    ],
  ),
);

Widget kFingerPrint = Container(
  padding: const EdgeInsets.only(top: 10.0),
  height: 70.0,
  child: TextButton(
    onPressed: null,
    child: Image.asset('images/fingerprint.png'),
    style: ButtonStyle(
      side: MaterialStateProperty.all(
        const BorderSide(
          color: Color(0xff2CA02E),
        ),
      ),
      shape: MaterialStateProperty.all(
        RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(
            10.0,
          ),
        ),
      ),
    ),
  ),
);

const Decoration kModalSheetRoundedContainer = BoxDecoration(
  color: Colors.white,
  borderRadius: BorderRadius.only(
    topLeft: Radius.circular(20.0),
    topRight: Radius.circular(20.0),
  ),
);

const EdgeInsets kModalSheetContainerPadding = EdgeInsets.only(top: 40.0);
const EdgeInsetsGeometry kImagePadding = EdgeInsets.only(top: 10.0);
const EdgeInsetsGeometry kSkipPadding = EdgeInsets.only(top: 60.0, left: 300.0);
const Widget kImageTextDivider = SizedBox(height: 25.0);
const TextStyle kSubHeadingStyle = TextStyle(color: Colors.white54);
