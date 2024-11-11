import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:tashkentcityresturant/pages/home/home_page.dart';

import '../../../services/address.dart';
import '../../../services/address_hive.dart';

class BottomBarSheetMap extends StatelessWidget {
  BottomBarSheetMap({super.key});

  final TextEditingController _controller = TextEditingController();
  final TextEditingController _controllerPodezd = TextEditingController();
  final TextEditingController _controllerPCode = TextEditingController();
  final TextEditingController _controllerPFloor = TextEditingController();
  final TextEditingController _controllerPOffice = TextEditingController();
  final TextEditingController _controllerComment = TextEditingController();
  final TextEditingController _controller1 = TextEditingController();
  FocusNode _isFocusedCity = FocusNode();
  FocusNode _isFocusedPodezd = FocusNode();
  FocusNode _isFocusedCode = FocusNode();
  FocusNode _isFocusedFloor = FocusNode();
  FocusNode _isFocusedOffice = FocusNode();
  FocusNode _isFocusedComment = FocusNode();
  final ValueNotifier<bool> _isFocused1 = ValueNotifier(false);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
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
              padding: EdgeInsets.symmetric(horizontal: 16.w),
              child: Column(
                children: [
                  TextFormField(
                    focusNode: _isFocusedCity,
                    style: TextStyle(
                        fontSize: 16.sp, color: Color.fromRGBO(63, 61, 60, 1)),
                    onTap: () {},
                    onEditingComplete: () {},
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
                        color: _controller.text.isNotEmpty
                            ? Color.fromRGBO(63, 61, 60, 0.5)
                            : Color.fromRGBO(63, 61, 60, 1),
                        fontSize: 12.sp,
                      ),
                      floatingLabelBehavior: FloatingLabelBehavior.auto,
                    ),
                    cursorColor: Color.fromRGBO(216, 152, 65, 1),
                  ),
                  SizedBox(
                    width: 8.w,
                  ),
                  Row(
                    children: [
                      Expanded(
                        child: TextFormField(
                          focusNode: _isFocusedPodezd,
                          style: TextStyle(
                              fontSize: 16.sp,
                              color: Color.fromRGBO(63, 61, 60, 1)),
                          onTap: () {},
                          onEditingComplete: () {},
                          controller: _controllerPodezd,
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
                            labelText: 'Подъезд',
                            labelStyle: TextStyle(
                              color: _controller.text.isNotEmpty
                                  ? Color.fromRGBO(63, 61, 60, 0.5)
                                  : Color.fromRGBO(63, 61, 60, 1),
                              fontSize: 12.sp,
                            ),
                            floatingLabelBehavior: FloatingLabelBehavior.auto,
                          ),
                          cursorColor: Color.fromRGBO(216, 152, 65, 1),
                        ),
                      ),
                      SizedBox(
                        width: 11.w,
                      ),
                      Expanded(
                        child: TextFormField(
                          focusNode: _isFocusedCode,
                          style: TextStyle(
                              fontSize: 16.sp,
                              color: Color.fromRGBO(63, 61, 60, 1)),
                          onTap: () {},
                          onEditingComplete: () {},
                          controller: _controllerPCode,
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
                            labelText: 'Код на двери',
                            labelStyle: TextStyle(
                              color: _controller.text.isNotEmpty
                                  ? Color.fromRGBO(63, 61, 60, 0.5)
                                  : Color.fromRGBO(63, 61, 60, 1),
                              fontSize: 12.sp,
                            ),
                            floatingLabelBehavior: FloatingLabelBehavior.auto,
                          ),
                          cursorColor: Color.fromRGBO(216, 152, 65, 1),
                        ),
                      ),
                    ],
                  ),
                  SizedBox(
                    width: 8.w,
                  ),
                  Row(
                    children: [
                      Expanded(
                        child: TextFormField(
                          focusNode: _isFocusedFloor,
                          style: TextStyle(
                              fontSize: 16.sp,
                              color: Color.fromRGBO(63, 61, 60, 1)),
                          onTap: () {},
                          onEditingComplete: () {},
                          controller: _controllerPFloor,
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
                            labelText: 'Этаж',
                            labelStyle: TextStyle(
                              color: _controller.text.isNotEmpty
                                  ? Color.fromRGBO(63, 61, 60, 0.5)
                                  : Color.fromRGBO(63, 61, 60, 1),
                              fontSize: 12.sp,
                            ),
                            floatingLabelBehavior: FloatingLabelBehavior.auto,
                          ),
                          cursorColor: Color.fromRGBO(216, 152, 65, 1),
                        ),
                      ),
                      SizedBox(
                        width: 11.w,
                      ),
                      Expanded(
                        child: TextFormField(
                          focusNode: _isFocusedOffice,
                          style: TextStyle(
                              fontSize: 16.sp,
                              color: Color.fromRGBO(63, 61, 60, 1)),
                          onTap: () {},
                          onEditingComplete: () {},
                          controller: _controllerPOffice,
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
                            labelText: 'Квартира/офис',
                            labelStyle: TextStyle(
                              color: _controller.text.isNotEmpty
                                  ? Color.fromRGBO(63, 61, 60, 0.5)
                                  : Color.fromRGBO(63, 61, 60, 1),
                              fontSize: 12.sp,
                            ),
                            floatingLabelBehavior: FloatingLabelBehavior.auto,
                          ),
                          cursorColor: Color.fromRGBO(216, 152, 65, 1),
                        ),
                      ),
                    ],
                  ),
                  SizedBox(
                    width: 8.w,
                  ),
                  TextFormField(
                    focusNode: _isFocusedComment,
                    style: TextStyle(
                        fontSize: 16.sp, color: Color.fromRGBO(63, 61, 60, 1)),
                    onTap: () {},
                    onEditingComplete: () {},
                    controller: _controllerComment,
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
                      labelText: 'Комментарии к адресу',
                      labelStyle: TextStyle(
                        color: _controller.text.isNotEmpty
                            ? Color.fromRGBO(63, 61, 60, 0.5)
                            : Color.fromRGBO(63, 61, 60, 1),
                        fontSize: 12.sp,
                      ),
                      floatingLabelBehavior: FloatingLabelBehavior.auto,
                    ),
                    cursorColor: Color.fromRGBO(216, 152, 65, 1),
                  ),
                  SizedBox(
                    height: 28.h,
                  ),
                  Container(
                    width: 1.sw,
                    height: 56.h,
                    child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                            backgroundColor: Color.fromRGBO(57, 126, 91, 1),
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(40))),
                        onPressed: () {
                          saveAddressData(context);
                        },
                        child: Text(
                          "Доставить сюда",
                          style: TextStyle(
                              color: Color.fromRGBO(255, 253, 251, 1),
                              fontSize: 16.sp,
                              fontWeight: FontWeight.w500),
                        )),
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }

  void saveAddressData(BuildContext context) async {
    Address addresses = Address(
        _controller.text,
        _controllerPodezd.text,
        _controllerPCode.text,
        _controllerPFloor.text,
        _controllerPOffice.text,
        _controllerComment.text,
        true);
    List<Address> addressList = [addresses];

    AddressHive addressHive = AddressHive();
    await addressHive.saveAddresses(addressList);

    Navigator.of(context).pushReplacement(
      MaterialPageRoute(builder: (_) => HomePage()),
    );
  }
}
