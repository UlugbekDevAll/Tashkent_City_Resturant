import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:tashkentcityresturant/main.dart';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart'; // RatingBar uchun

class AssessWaiterDialog extends StatefulWidget {
  const AssessWaiterDialog({super.key});

  @override
  State<AssessWaiterDialog> createState() => _AssessWaiterDialogState();
}

class _AssessWaiterDialogState extends State<AssessWaiterDialog> {
  double rating = 0;
  final TextEditingController commentController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Color.fromRGBO(255, 253, 251, 1),
      child: SingleChildScrollView(
        // Scrollable qilamiz
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            SizedBox(height: 24.h),
            Container(
              margin: EdgeInsets.symmetric(horizontal: 16),
              child: Text(
                "Оцените услугу\nофицианта",
                style: TextStyle(
                  color: Color.fromRGBO(63, 61, 60, 1),
                  fontWeight: FontWeight.w400,
                  fontSize: 30.sp,
                ),
                textAlign: TextAlign.center,
              ),
            ),
            SizedBox(height: 32.h),
            RatingBar.builder(
              initialRating: rating,
              minRating: 1,
              direction: Axis.horizontal,
              allowHalfRating: true,
              itemCount: 5,
              itemPadding: EdgeInsets.symmetric(horizontal: 4.0),
              itemBuilder: (context, index) => Icon(
                Icons.star,
                color: index < rating
                    ? Color.fromRGBO(216, 152, 65, 1)
                    : Color.fromRGBO(23, 23, 23, 0.3),
              ),
              onRatingUpdate: (newRating) {
                setState(() {
                  rating = newRating;
                });
              },
            ),
            SizedBox(height: 32.h),
            Container(
              width: 1.sw,
              height: 100.h,
              margin: EdgeInsets.symmetric(horizontal: 16.0),
              decoration: BoxDecoration(
                color: Color.fromRGBO(247, 243, 235, 1),
                borderRadius: BorderRadius.circular(16),
              ),
              child: TextField(
                controller: commentController,
                decoration: InputDecoration(
                  border: InputBorder.none,
                  hintText: 'Ваш комментарий',
                  contentPadding: EdgeInsets.all(16.0),
                ),
              ),
            ),
            SizedBox(
              height: 112.h,
            ),
            Container(
              width: 1.sw,
              height: 56.h,
              margin: EdgeInsets.symmetric(horizontal: 16.0),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(40)
              ),
              child: ElevatedButton(
                  onPressed: () {},
                  child: Text(
                    "Готово",
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 16.sp,
                        fontWeight: FontWeight.w500),
                  ),
                style: ElevatedButton.styleFrom(backgroundColor: Color.fromRGBO(57, 126, 91, 0.5),shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(40),
                ),),
              ),
            ),
            SizedBox(height: 59.h,)
          ],
        ),
      ),
    );
  }
}
