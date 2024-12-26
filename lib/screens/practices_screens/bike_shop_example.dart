import 'package:animation_practices/core/utils/app_assets.dart';
import 'package:animation_practices/screens/another_screens/dots_widgets/custom_dot_list_view.dart';
import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

const _blueColor = Color(0xff37B6E9);
const _blueColor2 = Color(0xff4B4CED);
const _blueGreyColor = Color(0xff242C3B);

class BikeShopExample extends StatefulWidget {
  const BikeShopExample({super.key});

  @override
  State<BikeShopExample> createState() => _BikeShopExampleState();
}

class _BikeShopExampleState extends State<BikeShopExample> {
  bool isExtended = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: double.infinity,
        height: MediaQuery.of(context).size.height * .55,
        padding: const EdgeInsets.fromLTRB(20, 70, 0, 0),
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            stops: [.5, .5],
            colors: [_blueGreyColor, _blueColor2],
            transform: GradientRotation(12.25),
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          ),
        ),
        child: LayoutBuilder(
          builder: (_, c) => Stack(
            alignment: Alignment.center,
            fit: StackFit.expand,
            children: [
              Column(
                children: [
                  const _Title(),
                  _Product(
                    maxH: c.maxHeight,
                    maxW: c.maxWidth,
                  ),
                ],
              ),
              const _BackIcon(),
            ],
          ),
        ),
      ),
      bottomSheet: const _BottomSheet(),
    );
  }
}


class _BackIcon extends StatelessWidget {
  const _BackIcon({super.key});

  @override
  Widget build(BuildContext context) {
    return Positioned(
      left: 0,
      top: 0,
      child: GestureDetector(
        onTap: ()=> Navigator.pop(context),
        child: PhysicalModel(
          color: _blueColor2,
          elevation: 20,
          shadowColor: Colors.black,
          borderRadius: BorderRadius.circular(8),
          child: const Padding(
            padding: EdgeInsets.all(10),
            child: Icon(
              Icons.arrow_back_ios_rounded,
              size: 16,
              color: Colors.white,
            ),
          ),
        ),
      ),
    );
  }
}

class _Title extends StatelessWidget {
  const _Title({super.key});

  @override
  Widget build(BuildContext context) {
    return Text(
      'peugeot - lr01'.toUpperCase(),
      style: TextStyle(
        color: Colors.white,
        fontSize: 18.sp,
        fontWeight: FontWeight.bold,
      ),
    );
  }
}

class _Product extends StatefulWidget {
  const _Product({super.key, required this.maxH, required this.maxW});

  final double maxH;
  final double maxW;
  @override
  State<_Product> createState() => _ProductState();
}
class _ProductState extends State<_Product> {
  int selection = 0;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(
          height: widget.maxH * .61,
          child: PageView.builder(
            scrollDirection: Axis.horizontal,
            itemCount: 3,
            onPageChanged: (i) => setState(() => selection = i),
            itemBuilder: (context, index) {
              return Image.asset(AppAssets.bikeImage);
            },
          ),
        ),
        const SizedBox(height: 10),
        Opacity(
          opacity: 0.4,
          child: CustomDotListView(
            count: 3,
            select: selection,
            dotColor: Colors.white,
          ),
        ),
      ],
    );
  }
}

class _BottomSheet extends StatelessWidget {
  const _BottomSheet({super.key});

  @override
  Widget build(BuildContext context) {
    return BottomSheet(
      onClosing: () {},
      clipBehavior: Clip.hardEdge,
      elevation: 100,
      shadowColor: Colors.grey,
      shape: const OutlineInputBorder(
        borderSide: BorderSide.none,
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(20),
          topRight: Radius.circular(20),
        ),
      ),
      builder: (context) {
        return Container(
          width: MediaQuery.of(context).size.width,
          // width: double.infinity,
          height: MediaQuery.of(context).size.height * .475,
          decoration: BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
              colors: [
                _blueGreyColor.withOpacity(0.9),
                _blueGreyColor,
                _blueGreyColor,
                _blueGreyColor,
              ],
            ),
          ),
          child: LayoutBuilder(
            builder: (_, c) => Column(
              children: [
                SizedBox(height: 16.h),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    _Button(
                      text: 'Description',
                      color: _blueGreyColor.withOpacity(0.7),
                      textColor: _blueColor2,
                      fontWeight: FontWeight.bold,
                      boxShadows: [
                        BoxShadow(
                          color: Colors.grey.withOpacity(0.1),
                          offset: const Offset(-2, -2),
                          spreadRadius: -1,
                          blurRadius: 2,
                        ),
                        BoxShadow(
                          color: Colors.black.withOpacity(0.5),
                          offset: const Offset(2, 2),
                          spreadRadius: -1,
                          blurRadius: 5,
                        ),
                      ],
                    ),
                    _Button(
                      text: 'Specification',
                      color: _blueGreyColor,
                      textColor: Colors.white,
                      fontWeight: FontWeight.w200,
                      boxShadows: [
                        BoxShadow(
                          color: Colors.grey.withOpacity(0.2),
                          offset: const Offset(1, 3),
                          spreadRadius: -.9,
                          blurRadius: 30,
                          blurStyle: BlurStyle.inner,
                        ),
                        BoxShadow(
                          color: Colors.black.withOpacity(0.3),
                          offset: const Offset(-1, -3),
                          spreadRadius: -.9,
                          blurRadius: 30,
                          blurStyle: BlurStyle.inner,
                        ),
                      ],
                    ),
                  ],
                ),
                SizedBox(height: 20.h),
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 14),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'peugeot - lr01\n'.toUpperCase(),
                          style: TextStyle(
                            fontSize: 16.sp,
                            fontWeight: FontWeight.w900,
                            color: Colors.white,
                          ),
                        ),
                        Expanded(
                          child: AutoSizeText(
                            desc,
                            minFontSize: 6,
                            maxFontSize: 18,
                            style: const TextStyle(
                              color: Colors.white60,
                              fontWeight: FontWeight.w300,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                const _PriceBottomSheet(),
              ],
            ),
          ),
        );
      },
    );
  }

  final String desc = 'Experience the thrill of cycling with my [Brand/Model] bike, designed for both performance and comfort. This lightweight frame is perfect for city commuting and weekend adventures alike. Equipped with [mention key features: e.g., high-quality gears, responsive brakes, and durable tires], it offers a smooth ride on any terrain. Whether you are navigating urban streets or exploring scenic trails, this bike delivers reliability and style. Get ready to enjoy the freedom of the open road! Feel free to customize the description with specific details about your bike, such as its brand, model, color, or any unique features.';
}

class _Button extends StatelessWidget {
  const _Button({
    super.key,
    required this.text,
    this.color,
    this.textColor,
    this.fontWeight,
    this.boxShadows,
  });

  final String text;
  final Color? color;
  final Color? textColor;
  final FontWeight? fontWeight;
  final List<BoxShadow>? boxShadows;
  @override
  Widget build(BuildContext context) {
    return PhysicalModel(
      color: Colors.transparent,
      elevation: 0,
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(8),
          boxShadow: boxShadows,
          color: color,
        ),
        child: Text(
          text,
          style: TextStyle(
            color: textColor,
            fontSize: 18,
            fontWeight: fontWeight,
          ),
        ),
      ),
    );
  }
}

class _PriceBottomSheet extends StatelessWidget {
  const _PriceBottomSheet({super.key});

  @override
  Widget build(BuildContext context) {
    return PhysicalModel(
      color: Colors.transparent,
      elevation: 10,
      shadowColor: Colors.grey,
      child: Container(
        width: double.infinity,
        padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 25),
        decoration: BoxDecoration(
          color: const Color(0xff222834),
          borderRadius:  const BorderRadius.only(topRight: Radius.circular(30), topLeft: Radius.circular(30)),
          boxShadow: [
            BoxShadow(
              offset: const Offset(0, -2),
              color: Colors.grey.withOpacity(0.2),
              spreadRadius: -2,
              blurRadius: 10
            ),
          ]
        ),
        child: const Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Text('\$1,999.99', style: TextStyle(
              fontWeight: FontWeight.w400,
              fontSize: 22,
              color: _blueColor2,
            ),),
            Expanded(child: SizedBox()),
            _Button(
              text: 'Add To Cart',
              color: _blueColor2,
              textColor: Colors.white,
              boxShadows: [
                BoxShadow(
                  blurStyle: BlurStyle.normal,
                  offset: Offset(2, 4),
                  color: Colors.black26,
                  spreadRadius: 1,
                  blurRadius: 10,
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
