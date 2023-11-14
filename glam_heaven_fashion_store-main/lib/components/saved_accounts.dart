import 'package:flutter/material.dart';
import 'package:glam_heaven_fashion_store/extensions/responsive_extension.dart';

class SavedAccountsContainer extends StatelessWidget {
  final String bankimage;
  final String bankname;
  final String accountNumber;
  final Icon selectedicon;
  const SavedAccountsContainer(
      {super.key,
      required this.bankimage,
      required this.bankname,
      required this.accountNumber,
      required this.selectedicon});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: context.width(60),
      width: MediaQuery.of(context).size.width,
      child: Padding(
        padding: EdgeInsets.symmetric(
          horizontal: context.width(10),
        ),
        child: Row(
          children: [
            Container(
              width: context.width(52),
              height: context.width(52),
              decoration: BoxDecoration(
                border: Border.all(
                  width: context.width(1),
                  color: Colors.grey,
                ),
                borderRadius: BorderRadius.circular(
                  context.width(8),
                ),
              ),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(
                  context.width(16),
                ),
                child: Image.asset(
                  bankimage,
                  fit: BoxFit.fill,
                ),
              ),
            ),
            SizedBox(
              width: context.width(19),
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  "$bankname Bank",
                  style: TextStyle(
                    fontSize: context.width(15),
                    fontFamily: 'Comfortaa',
                    fontWeight: FontWeight.w700,
                  ),
                ),
                SizedBox(
                  height: context.width(5),
                ),
                Text(
                  "XXXX $accountNumber",
                  style: TextStyle(
                    fontSize: context.width(14),
                    fontFamily: 'Comfortaa',
                    fontWeight: FontWeight.w700,
                  ),
                ),
              ],
            ),
            const Spacer(),
            selectedicon,
            SizedBox(
              width: context.width(5),
            ),
          ],
        ),
      ),
    );
  }
}
