import 'package:flutter/material.dart';
import 'package:glam_heaven_fashion_store/extensions/responsive_extension.dart';

class OrderStatus extends StatelessWidget {
  const OrderStatus({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBody: true,
      appBar: AppBar(
        backgroundColor: const Color(0xff242A54),
        leading: IconButton(
          onPressed: () {},
          icon: Icon(
            Icons.arrow_back_ios_new,
            color: Colors.white,
            size: context.width(15),
          ),
        ),
        title: const Text(
          "Order Details",
          style: TextStyle(color: Colors.white, fontFamily: "Comfortaa"),
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(
              height: context.width(20),
            ),
            Padding(
              padding: EdgeInsets.only(left: context.width(10)),
              child: RichText(
                text: const TextSpan(
                  children: <TextSpan>[
                    TextSpan(
                      text: "Order ID - ",
                      style: TextStyle(
                          color: Colors.black54, fontWeight: FontWeight.w500),
                    ),
                    TextSpan(
                      text: "OD3578944533992962462",
                      style: TextStyle(
                          color: Colors.black54, fontWeight: FontWeight.w500),
                    )
                  ],
                ),
              ),
            ),
            const Divider(
              thickness: 0.5,
            ),
            SizedBox(
              height: context.width(20),
            ),
            Padding(
              padding: EdgeInsets.only(right: context.width(10)),
              child: Row(
                children: [
                  Padding(
                    padding: EdgeInsets.only(
                        left: context.width(10), top: context.width(10)),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "Nike Boys Solid Polyester\nT Shirt (Black,pack of 1)...",
                          style: TextStyle(
                              fontSize: context.width(18),
                              fontWeight: FontWeight.w500),
                        ),
                        SizedBox(
                          height: context.width(15),
                        ),
                        Text(
                          "Black",
                          style: TextStyle(
                              fontSize: context.width(15),
                              fontWeight: FontWeight.w500,
                              color: Colors.black54),
                        ),
                        SizedBox(
                          height: context.width(
                            5,
                          ),
                        ),
                        RichText(
                          text: const TextSpan(
                            children: <TextSpan>[
                              TextSpan(
                                text: "Seller: ",
                                style: TextStyle(
                                    color: Colors.black54,
                                    fontWeight: FontWeight.w500),
                              ),
                              TextSpan(
                                text: "Nike",
                                style: TextStyle(
                                    color: Colors.black54,
                                    fontWeight: FontWeight.w500),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(
                    width: context.width(15),
                  ),
                  Image.asset(
                    "assets/images/niketshirt.png",
                  )
                ],
              ),
            ),
            SizedBox(
              height: context.width(15),
            ),
            Row(
              children: [
                SizedBox(
                  width: context.width(10),
                ),
                Icon(
                  Icons.currency_rupee_sharp,
                  size: context.width(19),
                ),
                Text(
                  "978",
                  style: TextStyle(
                      fontSize: context.width(18), fontWeight: FontWeight.w500),
                ),
                SizedBox(
                  width: context.width(10),
                ),
                Text(
                  "6",
                  style: TextStyle(
                    color: const Color(0xff1AD36F),
                    fontSize: context.width(11),
                  ),
                ),
                SizedBox(
                  width: context.width(
                    2,
                  ),
                ),
                Text(
                  "Offers",
                  style: TextStyle(
                    color: const Color(0xff1AD36F),
                    fontSize: context.width(11),
                  ),
                ),
              ],
            ),
            SizedBox(
              height: context.width(25),
            ),
            Padding(
              padding: EdgeInsets.symmetric(
                horizontal: context.width(10),
              ),
              child: Container(
                height: context.width(65),
                decoration: BoxDecoration(
                  color: const Color(0xff242A54),
                  borderRadius: BorderRadius.circular(
                    context.width(10),
                  ),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    const Text(
                      "Help our delivery agent Reach\nyou faster",
                      style: TextStyle(color: Colors.white),
                    ),
                    Container(
                      width: context.width(12),
                      height: context.width(40),
                      decoration: BoxDecoration(
                        color: const Color(0xffF6B14B),
                        borderRadius: BorderRadius.circular(
                          context.width(10),
                        ),
                      ),
                      child: const Center(
                        child: Text(
                          "Share Location",
                          style: TextStyle(fontWeight: FontWeight.w500),
                        ),
                      ),
                    )
                  ],
                ),
              ),
            ),
            SizedBox(
              height: context.width(10),
            ),
            const Divider(
              thickness: 0.5,
            ),
            Stepper(physics: NeverScrollableScrollPhysics(), steps: [
              Step(
                title: Text("Order Confirmed,Today,Sep 05"),
                content: Text("sdvhsjhd "),
              ),
              Step(
                  title: Text("Shipped,Expected By Sep 07"),
                  content: Text("sfdfdf")),
              Step(title: Text("Out For Delivery"), content: Text("sfdfdf")),
              Step(
                  title: Text("Delivery,Fri Sep 08 By 9 PM"),
                  content: Text("sfdfdf"))
            ]),
            SizedBox(
              height: 70,
            )
          ],
        ),
      ),
      bottomSheet: Row(
        children: [
          Container(
            width: MediaQuery.sizeOf(context).width / 2,
            height: context.width(50),
            decoration: BoxDecoration(
                border: Border(
                    right: BorderSide(
                      color: Colors.black38,
                    ),
                    top: BorderSide(
                      color: Colors.black38,
                    ))),
            child: Center(
              child: Text(
                "Cancel",
                style: TextStyle(fontSize: context.width(17)),
              ),
            ),
          ),
          Container(
            width: MediaQuery.sizeOf(context).width / 2,
            height: context.width(50),
            decoration: BoxDecoration(
                border: Border(
                    top: BorderSide(
              color: Colors.black38,
            ))),
            child: Center(
              child: Text(
                "Need help?",
                style: TextStyle(fontSize: context.width(17)),
              ),
            ),
          )
        ],
      ),
    );
  }
}
