import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  bool activindexMon = false;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(
                  height: 15,
                ),
                Center(
                  child: Text("Manage Availbility",
                      style: TextStyle(
                        letterSpacing: 1,
                        fontSize: 15,
                        fontWeight: FontWeight.bold,
                        color: Colors.black,
                      )),
                ),
                Divider(),
                Container(
                  child: Row(
                    children: [
                      Text("Plese define yoiur available dates ans time",
                          style: TextStyle(
                            letterSpacing: 1,
                            fontSize: 15,
                            fontWeight: FontWeight.bold,
                            color: Colors.blue,
                          )),
                      Icon(
                        Icons.help_center_rounded,
                        color: Colors.blue,
                      )
                    ],
                  ),
                ),
                SizedBox(
                  height: 10,
                ),
                Row(
                  children: [
                    Container(
                      padding: EdgeInsets.all(5),
                      decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          color: Colors.blue,
                          border: Border.all(color: Colors.grey)),
                    ),
                    SizedBox(
                      width: 5,
                    ),
                    Text("Monday",
                        style: TextStyle(
                          letterSpacing: 1,
                          fontSize: 15,
                          fontWeight: FontWeight.bold,
                          color: Colors.black,
                        )),
                  ],
                ),
                SizedBox(
                  height: 20,
                ),
                Row(
                  children: [
                    InkWell(
                      onTap: () {
                        setState(
                          () {
                            activindexMon = false;
                          },
                        );
                      },
                      child: Row(
                        children: [
                          Container(
                            padding: EdgeInsets.all(5),
                            decoration: BoxDecoration(
                                shape: BoxShape.circle,
                                border: Border.all(color: Colors.grey)),
                            child: Container(
                              padding: EdgeInsets.all(3),
                              decoration: BoxDecoration(
                                shape: BoxShape.circle,
                                color: activindexMon == false
                                    ? Colors.blue
                                    : Colors.white,
                              ),
                            ),
                          ),
                          SizedBox(
                            width: 8,
                          ),
                          Text(
                            "Daily",
                            style: TextStyle(
                                color: activindexMon == false
                                    ? Colors.blue
                                    : Colors.black,

                                // fontFamily: font,
                                fontWeight: FontWeight.bold,
                                fontSize: 18),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(
                      width: 30,
                    ),
                    InkWell(
                      onTap: (() {
                        setState(
                          () {
                            activindexMon = true;
                          },
                        );
                      }),
                      child: Row(
                        children: [
                          Container(
                            padding: EdgeInsets.all(5),
                            decoration: BoxDecoration(
                                shape: BoxShape.circle,
                                border: Border.all(color: Colors.grey)),
                            child: Container(
                              padding: EdgeInsets.all(3),
                              decoration: BoxDecoration(
                                shape: BoxShape.circle,
                                color: activindexMon == true
                                    ? Colors.blue
                                    : Colors.grey,
                              ),
                            ),
                          ),
                          SizedBox(
                            width: 8,
                          ),
                          Text(
                            "Time Slots",
                            style: TextStyle(
                                color: activindexMon == true
                                    ? Colors.blue
                                    : Colors.black,

                                // fontFamily: font,
                                fontWeight: FontWeight.bold,
                                fontSize: 18),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
                Column(
                    children: List.generate(
                        10,
                        (index) => Container(
                            // padding: EdgeInsets.all(20),
                            // height: 160,
                            width: MediaQuery.of(context).size.width - 60,
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(5),
                                color: Colors.grey.withOpacity(.1),
                                border: Border.all()))))
              ]),
        ),
      ),
    );
  }
}
