import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:modal_bottom_sheet/modal_bottom_sheet.dart';
import 'package:tashkentcityresturant/core/configs/assets/app_icons.dart';
import 'package:tashkentcityresturant/core/configs/theme/app_colors.dart';
import 'package:tashkentcityresturant/main.dart';
import 'package:tashkentcityresturant/pages/home/home_page.dart';
import 'package:tashkentcityresturant/pages/profile/widget/address_page.dart';
import 'package:tashkentcityresturant/pages/profile/widget/profile_button.dart';
import 'package:tashkentcityresturant/pages/profile/widget/profile_edit_data_dialog.dart';
import 'package:tashkentcityresturant/pages/profile/widget/top_bar_widget.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({super.key});

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  @override
  Widget build(BuildContext context) {
    return CupertinoPageScaffold(
      backgroundColor: AppColors.lightBackground,
      child: SafeArea(
        child: Column(
          children: [
            TopBarWidget(title: "Профиль"),
            SizedBox(height: 27.h,),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              child: Container(
                height: 136.h,
                width: double.infinity,
                decoration: BoxDecoration(
                  color: AppColors.cardBg,
                  borderRadius: BorderRadius.all(Radius.circular(16))
                ),

                child: Stack(
                  children: [

                    Column(
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(top: 20.0,left: 16.0),
                          child: Row(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Text("305",style: TextStyle(color: Color(0xffFFFDFB),fontSize: 32.sp,fontWeight: FontWeight.w400,decoration: TextDecoration.none)),
                              SizedBox(width: 8.w),
                              SvgPicture.asset(AppIcons.coinIcon)
                            ],
                          ),
                        ),
                        Spacer(),
                        

                        Padding(
                          padding: const EdgeInsets.only(left: 16.0,bottom: 16.0),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              Text("Начисляем 3% c покупки",style: TextStyle(fontSize: 15.sp,decoration: TextDecoration.none,fontWeight: FontWeight.w500,color: Color(0xffF7F3EB)),textAlign: TextAlign.end),
                            ],
                          ),
                        )

                      ],
                    ),

                    Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        SvgPicture.asset(AppIcons.appBgIcon),
                      ],
                    ),
                  ],
                )

              ),
            ),
            SizedBox(height: 32.h,),
            ProfileButton(icon_title: AppIcons.dataProfileIcon, title: "Личные данные и телефон",onTap: (){

              showCupertinoModalBottomSheet(
                context: context,
                builder: (context) => ProfileEditDataDialog(),
              );
            },),
            SizedBox(height: 8.h,),
            ProfileButton(icon_title: AppIcons.locationIcon, title: "Адреса",onTap: (){
              showModalBottomSheet(
                context: context,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.vertical(top: Radius.circular(32.0)), // radius ni o'zingiz xohlagan qiymatga o'zgartiring
                ),
                barrierColor: Colors.black.withOpacity(0.45),
                builder: (context) => SingleChildScrollView(
                  child: AddressPage(),
                ),
              );
            },),
            SizedBox(height: 8.h,),
            ProfileButton(icon_title: AppIcons.historyIcon, title: "История заказ"),
            SizedBox(height: 8.h,),
            ProfileButton(icon_title: AppIcons.discountIcon, title: "Пригласить друга"),
            SizedBox(height: 8.h,),
            ProfileButton(icon_title: AppIcons.supportIcon, title: "Поддержка"),
            SizedBox(height: 8.h,),
            ProfileButton(icon_title: AppIcons.logOutIcon, title: "Выйти"),
            // Add more content here
          ],
        ),
      ),
    );
  }
}
