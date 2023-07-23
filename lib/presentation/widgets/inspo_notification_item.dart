import 'package:clean_architecture_template/presentation/widgets/inspo_button.dart';
import 'package:flutter/material.dart';

class InspoNotificationItem extends StatelessWidget {
  const InspoNotificationItem({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Container(
        width: MediaQuery.of(context).size.width,
        margin: EdgeInsets.only(top: 8,left: 20,right: 20),
        decoration: BoxDecoration(
          shape: BoxShape.rectangle,
          border: Border.all(width: 2),
          borderRadius: BorderRadius.circular(4)
        ),
        child: Column(
          children: [
            Row(
              children: [
                Container(
                    margin: EdgeInsets.only(top: 19,left: 15),
                    width: 28,
                    height: 28,
                    child: Image.asset("assets/images/avtar.png")
                ),
                Container(
                  margin: EdgeInsets.only(left: 10,top: 10),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        children: [
                          Text(
                            "GOOD CUP",
                            style: TextStyle(
                                fontSize: 21,
                                fontWeight: FontWeight.w600
                            ),
                          ),
                          Container(
                              margin: EdgeInsets.only(left: 7),
                              child: Image.asset("assets/images/ic_arrow_right.png")
                          ),
                          Container(
                            margin: EdgeInsets.only(left: 7),
                            child: Text(
                              "Requirements",
                              style: TextStyle(
                                  fontSize: 11,
                                  fontWeight: FontWeight.w600
                              ),
                            ),
                          ),
                        ],
                      ),
                      Text(
                        "10hr",
                        style: TextStyle(
                            fontSize: 12,
                            fontWeight: FontWeight.w400
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
            Container(
              margin: EdgeInsets.only(left: 15,right: 15,top: 10),
              child: Text(
                "GOODCUP HAS ACCEPTED YOUR REQUEST SEE YOU @ 6:00 ",
                style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w400
                ),
              ),
            ),
            Row(
              children: [
                Expanded(
                  child: InspoButton(
                    text: "COVERED",
                    height: 63,
                    marginTop: 16,
                    marginLeft: 11,
                    marginRight: 4,
                    marginBottom: 24,
                    buttonColor: Colors.black,
                    buttonRadius: 9,
                    fontSize: 14,
                    fontWeight: FontWeight.w600,
                    textColor: Colors.white,
                    borderWidth: 2,
                    onPressed: (){
                    },
                  ),
                ),
                Expanded(
                  child: InspoButton(
                    text: "NOPE",
                    height: 63,
                    marginTop: 16,
                    marginLeft: 11,
                    marginRight: 12,
                    marginBottom: 24,
                    buttonColor: Colors.white,
                    buttonRadius: 9,
                    fontSize: 14,
                    fontWeight: FontWeight.w600,
                    textColor: Colors.black,
                    borderWidth: 2,
                    onPressed: (){
                    },
                  ),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
