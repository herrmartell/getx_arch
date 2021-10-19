import 'package:flutter/material.dart';
import 'package:get/get.dart';

class TopWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SliverToBoxAdapter(
      child: Container(
        height: 160,
        width: Get.width,
        decoration: BoxDecoration(
          color: Colors.black,
          border: Border(
            bottom: BorderSide(
              color: Colors.grey.shade300,
              width: 1,
            ),
          ),
        ),
        child: Stack(
          children: [
            Text(
              "=C1RV=CDZT=DBR=D5T=DCK=D6RF=DAR=D3G=C9P"
              "=E1rv=EDzt=FBr=F5t=FCk=F6rf=FAr=F3g=E9p"
              "=C1RV=CDZT=DBR=D5T=DCK=D6RF=DAR=D3G=C9P"
              "=E1rv=EDzt=FBr=F5t=FCk=F6rf=FAr=F3g=E9p"
              "=C1RV=CDZT=DBR=D5T=DCK=D6RF=DAR=D3G=C9P"
              "=E1rv=EDzt=FBr=F5t=FCk=F6rf=FAr=F3g=E9p",
              style: TextStyle(
                color: Colors.white12,
                fontSize: 22,
                fontWeight: FontWeight.bold,
                fontFamily: 'Courier',
              ),
              textAlign: TextAlign.justify,
            ),
            Center(
              child: Text(
                'PLEASE, HIRE ME!',
                style: TextStyle(
                  color: Colors.white24,
                  fontSize: 22,
                  fontWeight: FontWeight.bold,
                  fontFamily: 'Courier',
                  fontFamilyFallback: ['Monospaced'],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
