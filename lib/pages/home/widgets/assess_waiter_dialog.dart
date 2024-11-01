

import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:tashkentcityresturant/main.dart';

class AssessWaiterDialog extends StatefulWidget {
  const AssessWaiterDialog({super.key});

  @override
  State<AssessWaiterDialog> createState() => _AssessWaiterDialogState();
}

class _AssessWaiterDialogState extends State<AssessWaiterDialog> {
  double rating = 0;
  @override
  Widget build(BuildContext context) {
    return Container(
      color:  Color.fromRGBO(255, 253, 251, 1),
      height: 504.h,
      child: Column(
        children: [
          SizedBox(height: 24.h,),
          Container(margin:EdgeInsets.symmetric(horizontal: 16),child: Text("Оцените услугу\nофицианта",style: TextStyle(color: Color.fromRGBO(63, 61, 60, 1),fontWeight: FontWeight.w400,fontSize: 30.sp),textAlign: TextAlign.center,)),

          SizedBox(height: 32.h,),
          RatingBar.builder(
            initialRating: rating,
            minRating: 1,
            direction: Axis.horizontal,
            allowHalfRating: true,
            itemCount: 5,
            itemPadding: EdgeInsets.symmetric(horizontal: 4.0),
            itemBuilder: (context, index) => Icon(
              Icons.star,
              color: index < rating ? Color.fromRGBO(216, 152, 65, 1) : Color.fromRGBO(23, 23, 23, 0.3),
            ),

            onRatingUpdate: (newRating) {
              setState(() {
                rating = newRating;
              });
            },
          ),
        ],
      ),
    );
  }
}
