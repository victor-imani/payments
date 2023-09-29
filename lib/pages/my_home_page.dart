import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:payments/component/colors.dart';
import 'package:payments/controllers/data_controllers.dart';
import 'package:payments/pages/payment_page.dart';
import 'package:payments/widgets/buttons.dart';
import 'package:payments/widgets/large_buttons.dart';
import 'package:payments/widgets/text_size.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key}) : super(key: key);

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  final DataController _controller = Get.put(DataController());
  @override
  Widget build(BuildContext context) {
    double h = MediaQuery.of(context).size.height;
    // double w = MediaQuery.of(context).size.width;

    return Scaffold(
      backgroundColor: AppColor.backGroundColor,
      body: SizedBox(
        height: h,
        child: Stack(
          children: [
            _headSection(),
            Obx(() {
              if (_controller.loading == false) {
                return const Center(
                  child: SizedBox(
                      width: 100,
                      height: 100,
                      child: CircularProgressIndicator()),
                );
              } else {
                return _listBills();
              }
            }),
            _payButton(),
          ],
        ),
      ),
    );
  }

  _headSection() {
    return SizedBox(
      height: 310,
      child: Stack(
        children: [
          _mainBackground(),
          _curveImageContainer(),
          _buttonContainer(),
          _textContainer(),
        ],
      ),
    );
  }

  _mainBackground() {
    return Positioned(
      bottom: 10,
      left: 0,
      child: Container(
        height: 300,
        width: MediaQuery.of(context).size.width,
        decoration: const BoxDecoration(
          image: DecorationImage(
            fit: BoxFit.cover,
            image: AssetImage("images/background.png"),
          ),
        ),
      ),
    );
  }

  _curveImageContainer() {
    return Positioned(
      left: 0,
      right: -2,
      bottom: 10,
      child: Container(
        height: MediaQuery.of(context).size.height * 0.1,
        decoration: const BoxDecoration(
          image: DecorationImage(
            fit: BoxFit.cover,
            image: AssetImage("images/curve.png"),
          ),
        ),
      ),
    );
  }

  _buttonContainer() {
    // double w = MediaQuery.of(context).size.width;
    return Positioned(
      bottom: 10, //10
      right: 50, //50
      child: GestureDetector(
        onTap: () {
          showModalBottomSheet<dynamic>(
            isScrollControlled: true,
            barrierColor: Colors.transparent,
            backgroundColor: Colors.transparent,
            context: context,
            builder: (BuildContext bc) {
              return SizedBox(
                height: MediaQuery.of(context).size.height - 240,
                child: Stack(
                  children: [
                    Positioned(
                      bottom: 0,
                      child: Container(
                        color: const Color(0xFFeef1f4).withOpacity(0.7),
                        width: MediaQuery.of(context).size.width,
                        height: MediaQuery.of(context).size.height - 300,
                      ),
                    ),
                    Positioned(
                      top: 0,
                      right: 50,
                      child: Container(
                        padding: const EdgeInsets.only(top: 5, bottom: 25),
                        width: 60,
                        height: 250,
                        decoration: BoxDecoration(
                          color: AppColor.mainColor,
                          borderRadius: BorderRadius.circular(29),
                        ),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            AppButtons(
                              icon: Icons.cancel,
                              iconColor: AppColor.mainColor,
                              textColor: Colors.white,
                              backgroundColor: Colors.white,
                              onTap: () {
                                Navigator.pop(context);
                              },
                            ),
                            AppButtons(
                              icon: Icons.add,
                              iconColor: AppColor.mainColor,
                              textColor: Colors.white,
                              backgroundColor: Colors.white,
                              onTap: () {},
                              text: "Add Bill",
                            ),
                            AppButtons(
                              icon: Icons.history,
                              iconColor: AppColor.mainColor,
                              textColor: Colors.white,
                              backgroundColor: Colors.white,
                              onTap: () {},
                              text: "History",
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              );
            },
          );
        },
        child: Container(
          height: 60,
          width: 60,
          decoration: BoxDecoration(
            image: const DecorationImage(
              image: AssetImage("images/lines.png"),
            ),
            boxShadow: [
              BoxShadow(
                blurRadius: 15,
                offset: const Offset(0, 1),
                color: const Color(0xFF11324d).withOpacity(0.2),
              ),
            ],
          ),
        ),
      ),
    );
  }

  _listBills() {
    return Positioned(
      top: 320,
      left: 0,
      right: 0,
      bottom: 0,
      child: MediaQuery.removePadding(
        removeTop: true,
        context: context,
        child: ListView.builder(
          itemCount: _controller.list.length,
          itemBuilder: (_, index) {
            return Container(
              margin: const EdgeInsets.only(
                top: 20,
                right: 20,
              ),
              height: 130,
              width: MediaQuery.of(context).size.width - 20,
              decoration: const BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.only(
                  topRight: Radius.circular(30),
                  bottomRight: Radius.circular(30),
                ),
                boxShadow: [
                  BoxShadow(
                      color: Color(0xFFd8dbe0),
                      offset: Offset(1, 1),
                      blurRadius: 20.0,
                      spreadRadius: 10),
                ],
              ),
              child: Container(
                margin: const EdgeInsets.only(top: 10, left: 18),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Row(
                          children: [
                            Container(
                              height: 60,
                              width: 60,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(10),
                                border: Border.all(
                                  width: 3,
                                  color: Colors.grey,
                                ),
                                image: DecorationImage(
                                  fit: BoxFit.cover,
                                  image: NetworkImage(
                                      // _controller.list[index]["img"]),
                                      "http://10.0.2.2:8000/uploads/${_controller.list[index].brandLogo}"),
                                ),
                              ),
                            ),
                            const SizedBox(width: 10),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  _controller.list[index].brandName,
                                  style: const TextStyle(
                                      fontSize: 16,
                                      color: AppColor.mainColor,
                                      fontWeight: FontWeight.w700),
                                ),
                                const SizedBox(height: 10),
                                Text("ID: ${_controller.list[index].brandId}",
                                    style: TextStyle(
                                        fontSize: 16,
                                        color: AppColor.idColor,
                                        fontWeight: FontWeight.w700)),
                              ],
                            ),
                          ],
                        ),
                        SizedText(
                            text: _controller.list[index].dueInfo,
                            color: AppColor.green),
                        const SizedBox(height: 5),
                      ],
                    ),
                    Row(
                      children: [
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            GestureDetector(
                              onTap: () {
                                if (_controller.list[index].status == 0) {
                                  _controller.list[index].status = 1;
                                } else if (_controller.list[index].status ==
                                    1) {
                                  _controller.list[index].status = 0;
                                }
                                _controller.list.refresh();
                              },
                              child: Container(
                                width: 80,
                                height: 30,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(30),
                                  color: _controller.list[index].status == 0
                                      ? AppColor.selectBackground
                                      : AppColor.green,
                                ),
                                child: Center(
                                  child: Text(
                                    "Select",
                                    style: TextStyle(
                                        fontSize: 16,
                                        color:
                                            _controller.list[index].status == 0
                                                ? AppColor.selectColor
                                                : Colors.white),
                                  ),
                                ),
                              ),
                            ),
                            Expanded(
                              child: Container(),
                            ),
                            Text(
                              "\$${_controller.list[index].due}",
                              style: const TextStyle(
                                  fontSize: 18,
                                  color: AppColor.mainColor,
                                  fontWeight: FontWeight.w900),
                            ),
                            Text(
                              "Due in 3 days",
                              style: TextStyle(
                                  fontSize: 14,
                                  color: AppColor.idColor,
                                  fontWeight: FontWeight.w700),
                            ),
                            const SizedBox(height: 10),
                          ],
                        ),
                        const SizedBox(width: 5),
                        Container(
                          width: 5,
                          height: 35,
                          decoration: BoxDecoration(
                            color: AppColor.halfOval,
                            borderRadius: const BorderRadius.only(
                              topLeft: Radius.circular(30),
                              bottomLeft: Radius.circular(30),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            );
          },
        ),
      ),
    );
  }

  _payButton() {
    return Positioned(
      bottom: 20,
      child: AppLargeButton(
        text: "Pay all bills",
        textColor: Colors.white,
        onTap: () {
          Get.to(() => const PaymentPage());
        },
      ),
    );
  }

  _textContainer() {
    return const Stack(
      children: [
        Positioned(
          left: 0,
          top: 100,
          child: Text(
            "My Bills",
            style: TextStyle(
              fontSize: 70,
              fontWeight: FontWeight.bold,
              color: Color(0xFF293952),
            ),
          ),
        ),
        Positioned(
          left: 40,
          top: 80,
          child: Text(
            "My Bills",
            style: TextStyle(
              fontSize: 50,
              fontWeight: FontWeight.bold,
              color: Colors.white,
            ),
          ),
        ),
      ],
    );
  }
}
