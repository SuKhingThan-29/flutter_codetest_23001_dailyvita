import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:mobile_code_test_23001_daily_vita/widget/health_item.dart';
import 'package:shimmer/shimmer.dart';

import '../bloc/get_health_bloc.dart';
import '../model/health.dart';
import '../styles/colors.dart';

class HealthScreen extends StatefulWidget {
  const HealthScreen({super.key});

  @override
  State<HealthScreen> createState() => _HealthScreenState();
}

class _HealthScreenState extends State<HealthScreen> {
  List<Health> healthList = [];
  bool isClick = false;

  @override
  void initState() {
    super.initState();
    healthBloc.updateHealthItems();
    SystemChrome.setEnabledSystemUIMode(SystemUiMode.manual, overlays: []);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: bgColor,
      body: Container(
        margin: const EdgeInsets.all(20),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Text("Select the top health concerns *)
            RichText(
              text: const TextSpan(
                text: 'Select the top health concern ',
                style: TextStyle(
                    color: Colors.black,
                    fontSize: 20,
                    fontWeight:
                        FontWeight.bold), // Default style for the entire text
                children: <TextSpan>[
                  TextSpan(
                    text: '*',
                    style: TextStyle(
                      fontWeight: FontWeight.normal,
                      color: Colors.red,
                    ),
                  ),
                ],
              ),
            ),
            const Text(
              '(upto 5)',
              style: TextStyle(
                  color: Colors.black,
                  fontSize: 20,
                  fontWeight: FontWeight.bold),
            ),
            StreamBuilder(
                stream: healthBloc.subject.stream,
                builder: (context, AsyncSnapshot<List<Health>> snapshot) {
                  if (snapshot.hasData) {
                    return _buildSuccessWidget(snapshot.data!);
                  } else if (snapshot.hasError) {
                    return _buildErrorWidget(snapshot.error as String);
                  } else {
                    return _buildLoadingWidget();
                  }
                }),
            Text(
              "Prioritize",
              style: TextStyle(color: Colors.black, fontSize: 22),
            ),
            Expanded(
                child: ListView.builder(
                    scrollDirection: Axis.vertical,
                    itemCount: healthList.length,
                    itemBuilder: (BuildContext context, int index) {
                      return Container(
                          margin: EdgeInsets.all(5),
                          width: MediaQuery.of(context).size.width,
                          height: 50,
                          decoration: BoxDecoration(
                              border: Border.all(color: Colors.black),
                              borderRadius: BorderRadius.circular(5)),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Container(
                                margin: EdgeInsets.all(4),
                                child: HealthItem(
                                    id: healthList[index].id,
                                    name: healthList[index].name,
                                    onTap: () async {
                                      setState(() {
                                        // print("HealthCLick: ${healthList[index].name}");
                                        // isClick=!isClick;
                                        // healthList[index].isClick=isClick;
                                        // healthList.add(healthList[index]);
                                      });
                                    },
                                    isClick: true),
                              ),
                              Container(
                                margin: EdgeInsets.all(10),
                                width: 30,
                                height: 30,
                                child: Image.asset(
                                  'assets/general/nav.png',
                                  color: Colors.grey,
                                ),
                              )
                            ],
                          ));
                    }))
          ],
        ),
      ),
    );
  }

  Widget _buildErrorWidget(String error) {
    return Center(
      child: Text("Error occured: $error"),
    );
  }

  Widget _buildLoadingWidget() {
    return SizedBox(
      height: 220.0,
      width: MediaQuery.of(context).size.width,
      child: Shimmer.fromColors(
        baseColor: grey.withOpacity(0.3),
        highlightColor: grey.withOpacity(0.1),
        child: Container(
          color: Colors.white,
        ),
      ),
    );
  }

  Widget _buildSuccessWidget(List<Health> generalList) {
    return Container(
      margin: const EdgeInsets.only(top: 20),
      height: 300,
      child: GridView.builder(
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 3, // Number of columns
            crossAxisSpacing: 2.0, // Spacing between columns
            mainAxisSpacing: 2.0, // Spacing between rows
            childAspectRatio: 1.5),
        itemCount: generalList.length, // Number of items in the grid
        itemBuilder: (BuildContext context, int index) {
          return HealthItem(
              id: generalList[index].id,
              name: generalList[index].name,
              onTap: () async {
                setState(() {
                  print("HealthCLick: ${generalList[index].name}");
                  isClick = !isClick;
                  generalList[index].isClick = isClick;
                  if (healthList.isNotEmpty) {
                    for (var j in healthList) {
                      if (j.name != generalList[index].name) {
                        healthList.add(generalList[index]);
                      }
                    }
                  } else {
                    healthList.add(generalList[index]);
                  }
                });
              },
              isClick: generalList[index].isClick);
        },
      ),
    );
  }
}
