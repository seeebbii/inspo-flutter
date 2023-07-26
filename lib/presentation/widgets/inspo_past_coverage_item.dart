import 'package:clean_architecture_template/utils/dimensions.dart';
import 'package:flutter/material.dart';

class InspoPastCoverageItem extends StatelessWidget {
  InspoPastCoverageItem({Key? key, this.times}) : super(key: key);

  int? times = 4;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 7.5, horizontal: 20),
      child: Column(
        children: [
          Stack(
            children: [
              SizedBox(
                height: 110,
                child: Image.asset("assets/images/sample2.png"),
              ),
              times! >= 2
                  ? Positioned(
                      bottom: 0,
                      right: 0,
                      child: Transform.translate(
                        offset: const Offset(15, 20),
                        child: Container(
                          padding: const EdgeInsets.all(10),
                          decoration: BoxDecoration(
                            color: Colors.white,
                            border: Border.all(width: 1, color: Colors.black),
                            shape: BoxShape.circle,
                          ),
                          child: RichText(
                            textAlign: TextAlign.center,
                            text: TextSpan(
                              children: [
                                TextSpan(
                                  text: '$times\n',
                                  style: const TextStyle(
                                    fontSize: 15,
                                    fontWeight: FontWeight.w700,
                                    color: Colors.black,
                                  ),
                                ),
                                const TextSpan(
                                  text: 'TIMES',
                                  style: TextStyle(
                                    fontSize: 4,
                                    fontWeight: FontWeight.w700,
                                    color: Colors.black,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                    )
                  : const SizedBox(),
            ],
          ),
          Container(
            margin: const EdgeInsets.only(top: 5),
            child: Text(
              "GOOD CUP",
              style: Dimensions.customTextStyle(
                24,
                FontWeight.w700,
                Colors.black,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
