import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:glam_heaven_fashion_store/components/swipeable_button.dart';
import 'package:glam_heaven_fashion_store/extensions/responsive_extension.dart';
import 'package:glam_heaven_fashion_store/provider/getstart_provider.dart';
import 'package:glam_heaven_fashion_store/view/signin/login.dart';

class GetStart extends ConsumerWidget {
  const GetStart({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      body: Stack(
        children: [
          SizedBox(
            width: MediaQuery.sizeOf(context).width,
            child: ShaderMask(
              shaderCallback: (bounds) => const LinearGradient(
                colors: [Colors.white, Color(0xFF242A54)],
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
              ).createShader(bounds),
              child: Image.asset(
                'assets/images/cameras212 1.png',
                fit: BoxFit.fill,
              ),
            ),
          ),
          coln(context, ref)
        ],
      ),
    );
  }

  Column coln(BuildContext context, WidgetRef ref) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        SizedBox(
          width: context.width(400),
          child: Stack(
            children: [
              Center(
                child: Text(
                  'TAKE YOUR STYLE\nEVERYWHERE WITH US',
                  style: TextStyle(
                    color: const Color.fromARGB(255, 255, 255, 255),
                    fontFamily: 'sixcaps',
                    fontSize: context.width(50),
                  ),
                  textAlign: TextAlign.center,
                ),
              ),
              Positioned(
                left: context.width(22),
                child: SizedBox(
                  width: context.width(350),
                  child: Text(
                    'TAKE YOUR STYLE\nEVERYWHERE WITH US',
                    style: TextStyle(
                        fontFamily: 'sixcaps',
                        fontSize: context.width(50),
                        foreground: Paint()
                          ..style = PaintingStyle.stroke
                          ..strokeWidth = context.width(1)
                          ..color = const Color(0xFFF9A956)),
                    textAlign: TextAlign.center,
                  ),
                ),
              ),
            ],
          ),
        ),
        SizedBox(
            height: context.height(
          10,
        )),
        Text(
          'MORE THAN A THOUSAND OF OUR ITEMS\nAVAILABLE FOR YOUR LUXURY',
          style: TextStyle(
              color: Colors.white,
              fontWeight: FontWeight.w600,
              fontFamily: 'inter',
              fontSize: context.width(15)),
          textAlign: TextAlign.center,
        ),
        // SizedBox(height: context.height(20, context)),
        Padding(
          padding: const EdgeInsets.all(14.0),
          child: SwipeableButtonViews(
            onWaitingProcess: () {
              Future.delayed(const Duration(microseconds: 3000));
              ref.read(isFinished.notifier).state =
                  !ref.read(isFinished.notifier).state;
            },
            isFinished: ref.watch(isFinished),
            onFinish: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => const Login(),
                ),
              );
              ref.read(isFinished.notifier).state =
                  !ref.read(isFinished.notifier).state;
            },
            activeColor: const Color(0xFFF6F6F6).withOpacity(0.5),
            buttonWidget: Icon(
              CupertinoIcons.chevron_right_2,
              size: context.width(25),
            ),
            buttonText: 'Start\tNow',
          ),
        )
      ],
    );
  }
}













// Padding(
//           padding: const EdgeInsets.all(15.0),
//           child: Container(
//             width: MediaQuery.sizeOf(context).width,
//             height: context.height(70, context),
//             decoration: BoxDecoration(
//                 borderRadius: BorderRadius.circular(40),
                // color: Color(0xFFF6F6F6).withOpacity(0.5)),
//           ),
//         )