import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:share_plus/share_plus.dart';
import 'package:tashkentcityresturant/main.dart';

class StoriesCustomPage extends StatefulWidget {
  const StoriesCustomPage({super.key});

  @override
  State<StoriesCustomPage> createState() => _StoriesCustomPageState();
}

class _StoriesCustomPageState extends State<StoriesCustomPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Container(
            width: double.infinity,
            height: double.infinity,
            decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage("assets/images/stories_img_bg.png"),
                fit: BoxFit.cover,
              ),
            ),
          ),
          Container(
            width: double.infinity,
            height: double.infinity,
            color: Color.fromRGBO(247, 243, 235, 0.1),
          ),

          // Overlay Content
          Column(
            children: [
              SizedBox(
                height: 50.h,
              ),
              Container(
                width: 1.sw,
                margin: EdgeInsets.symmetric(horizontal: 16.0),
                height: 3,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(4)
                ),
              ),
              SizedBox(
                height: 8.h,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  GestureDetector(
                    onTap: (){
                      Navigator.of(context).pop();
                    },
                    child: Container(
                      width: 40.w,
                      height: 40.h,
                      decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(100)),
                      child: Center(
                        child:
                            SvgPicture.asset('assets/my_icons/clear_map_ic.svg'),
                      ),
                    ),
                  ),
                  SizedBox(
                    width: 16.w,
                  )
                ],
              ),
              Spacer(),
              Text("Приведи друга получишь 500р",style: TextStyle(color: Color.fromRGBO(255, 253, 251, 1),fontSize: 48.sp),textAlign: TextAlign.center,),
              SizedBox(height: 24.h,),
              Text("Приводи друга – наслаждайтесь вместе вкусными блюдами, а мы подарим тебе 500₽ кешбека за каждый визит. Чем больше друзей, тем больше кешбек!",style: TextStyle(color: Color.fromRGBO(255, 255, 255, 0.6)),textAlign: TextAlign.center,),
              SizedBox(height: 86.h,),
              Container(
                  width: 1.sw,
                  height: 56.h,
                  margin: EdgeInsets.symmetric(horizontal:16 ),
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(backgroundColor: Color.fromRGBO(255, 253, 251, 1),shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(40))),
                      onPressed: () {
                        _shareContent();
                      },
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          SvgPicture.asset('assets/my_icons/send_ic.svg'),
                          SizedBox(width: 6.w ,),
                          Text(
                            'Пригласить',
                            style: TextStyle(
                                color: Color.fromRGBO(23, 23, 23, 1),
                                fontSize: 16.sp,
                                fontWeight: FontWeight.w500),
                          )
                        ],
                      ))),
              SizedBox(
                height: 100.h,
              )
            ],
          ),
        ],
      ),
    );

  }
  void _shareContent() {
    // You can share any text or URL here
    Share.share('Check out this awesome app!');
    // You can also share links or files, like: Share.shareFiles(['path_to_file'], text: 'Optional text');
  }

}
