import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';

class BottomBarSheetMap extends StatelessWidget {
  BottomBarSheetMap({super.key});

  final TextEditingController _controller = TextEditingController();
  final TextEditingController _controller1 = TextEditingController();
  final ValueNotifier<bool> _isFocused = ValueNotifier(false);
  final ValueNotifier<bool> _isFocused1 = ValueNotifier(false);


  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        _isFocused.value = false;
        _isFocused1.value = false;
        FocusScope.of(context).unfocus();
      },
      child: Container(
        height: 400.h,
        decoration: BoxDecoration(
          color: Color.fromRGBO(255, 253, 251, 1),
          borderRadius: BorderRadius.only(
            topRight: Radius.circular(32.0),
            topLeft: Radius.circular(32.0),
          ),
        ),
        child: Column(
          children: [
            SizedBox(height: 24.h),
            Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                SizedBox(width: 16.w),
                Text(
                  "Москва",
                  style: TextStyle(
                    color: Color.fromRGBO(23, 23, 23, 1),
                    fontSize: 20.sp,
                    fontWeight: FontWeight.w400,
                  ),
                ),
                SvgPicture.asset('assets/my_icons/spinner_ic.svg'),
              ],
            ),
            Padding(
              padding: const EdgeInsets.only(left: 16, right: 16, top: 16),
              child: ValueListenableBuilder<bool>(
                valueListenable: _isFocused,
                builder: (context, isFocused, child) {
                  return TextFormField(
                      style: TextStyle(
                          fontSize: 16.sp,
                          color: Color.fromRGBO(63, 61, 60, 1)
                      ),
                      onTap: () {
                        _isFocused.value = true;
                      },
                      onEditingComplete: () {
                        _isFocused.value = false;
                      },
                      controller: _controller,
                      decoration: InputDecoration(
                          focusedBorder: UnderlineInputBorder(
                            borderSide: BorderSide(
                              color: Color.fromRGBO(23, 23, 23, 0.3),
                              width: 0.5,
                            ),
                          ),
                          border: UnderlineInputBorder(
                            borderSide: BorderSide(
                              color: Color.fromRGBO(23, 23, 23, 0.3),
                              width: 0.5,
                            ),
                          ),

                          labelText: 'Город, улица и дом',
                          labelStyle: TextStyle(
                          color: isFocused || _controller.text.isNotEmpty
                          ? Color.fromRGBO(63, 61, 60, 0.5)
                          : Color.fromRGBO(63, 61, 60, 1),
                  fontSize: 12.sp,
                  ),
                  floatingLabelBehavior: FloatingLabelBehavior
                  .
                  auto
                  ,
                  ),
                      cursorColor: Color.fromRGBO(216, 152, 65, 1),
                  );
                },
              ),
            ),
            // Padding(padding: padding)
            // Padding(
            //   padding: const EdgeInsets.only(left: 16, right: 16, top: 16),
            //   child: ValueListenableBuilder<bool>(
            //     valueListenable: _isFocused1,
            //     builder: (context, isFocused1, child) {
            //       return TextFormField(
            //         style: TextStyle(
            //             fontSize: 16.sp,
            //             color: Color.fromRGBO(63, 61, 60, 1)
            //         ),
            //         onTap: () {
            //           _isFocused1.value = true;
            //         },
            //         onEditingComplete: () {
            //           _isFocused1.value = false;
            //         },
            //         controller: _controller1,
            //         decoration: InputDecoration(
            //           focusedBorder: UnderlineInputBorder(
            //             borderSide: BorderSide(
            //               color: Color.fromRGBO(23, 23, 23, 0.3),
            //               width: 0.5,
            //             ),
            //           ),
            //           border: UnderlineInputBorder(
            //             borderSide: BorderSide(
            //               color: Color.fromRGBO(23, 23, 23, 0.3),
            //               width: 0.5,
            //             ),
            //           ),
            //
            //           labelText: 'Город, улица и дом',
            //           labelStyle: TextStyle(
            //             color: isFocused1 || _controller1.text.isNotEmpty
            //                 ? Color.fromRGBO(63, 61, 60, 0.5)
            //                 : Color.fromRGBO(63, 61, 60, 1),
            //             fontSize: 12.sp,
            //           ),
            //           floatingLabelBehavior: FloatingLabelBehavior
            //               .
            //           auto
            //           ,
            //         )
            //         ,
            //       );
            //     },
            //   ),
            // ),
          ],
        ),
      ),
    );
  }
}
