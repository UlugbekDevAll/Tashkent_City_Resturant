import 'package:flutter/material.dart';
import 'package:animated_toggle_switch/animated_toggle_switch.dart';
import 'package:blur/blur.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class HomeSwitchButton extends ConsumerStatefulWidget {
  const HomeSwitchButton({super.key});

  @override
  ConsumerState<HomeSwitchButton> createState() => _HomeSwitchButtonState();
}


class _HomeSwitchButtonState extends ConsumerState<HomeSwitchButton> {

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          height: 48,
          width: 217,
          margin: EdgeInsets.symmetric(vertical: 11.h),
          child: Stack(
            children: [
              Blur(
                blur: 10,
                blurColor: Colors.black,
                borderRadius: BorderRadius.circular(70),
                child: Container(
                  color: Colors.transparent,
                ),
              ),
              AnimatedToggleSwitch<bool>.size(
                current: true,
                height: 48,
                selectedIconScale: 1,
                textDirection: TextDirection.rtl,
                values: const [true, false],
                indicatorSize: const Size.fromWidth(105),
                iconBuilder: (bool online) {
                  return Container(
                    height: 42,
                    alignment: Alignment.center,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(70),
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        if(online) Padding(
                          padding: EdgeInsets.only(right: 4.w),
                          child: CircleAvatar(
                            radius: 4,
                            backgroundColor: Colors.green,
                          ),
                        ),
                        Text(
                          // (online ? "request_online".translate() : "request_offline".translate()).toUpperCase(),
                          // style: MyTextStyle.styleI_12_500.copyWith(
                          //   color: state.userDocs!.service.isOnline == online ? MyColors.labelsPrimary : MyColors.labelsSecondary,
                          // ),
                          "Online"
                        ),
                      ],
                    ),
                  );
                },
                borderWidth: 3,
                iconAnimationType: AnimationType.onHover,
                style: ToggleStyle(
                    borderColor: Colors.transparent,
                    backgroundColor: Colors.red,
                    indicatorColor: Colors.blue
                ),
                // onChanged: (bool val) => notifier.changeActiveness(),
              ),
            ],
          ),
        ),
        13.verticalSpace,
      ],
    );
  }
}