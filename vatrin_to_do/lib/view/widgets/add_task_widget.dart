import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:vatrin_to_do/assets/themes/constants.dart';

class AddTask extends StatefulWidget {
  const AddTask({super.key});

  @override
  State<AddTask> createState() => _AddTaskState();
}

class _AddTaskState extends State<AddTask> {
  @override
  Widget build(BuildContext context) {
    return (Container(
      alignment: Alignment.bottomRight,
      margin: const EdgeInsets.only(bottom: 28, right: 15),
      child: ElevatedButton(
        onPressed: () => showModalBottomSheet<void>(
          context: context,
          builder: (BuildContext context) {
            return SizedBox(
              //return Container(
              // decoration: const BoxDecoration(
              //     borderRadius: BorderRadius.only(
              //         topLeft: Radius.circular(16),
              //         topRight: Radius.circular(16))),
              height: 560,
              child: Center(
                child: Column(
                  // mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Container(
                        margin: const EdgeInsets.only(left: 25, top: 25),
                        alignment: Alignment.topLeft,
                        child: const Text(
                          'Add Task',
                          style: TextStyle(
                              fontWeight: FontWeight.w400, fontSize: 20),
                        )),
                    Container(
                        alignment: Alignment.center,
                        padding: const EdgeInsets.symmetric(
                            vertical: 14, horizontal: 24),
                        child: const TextField(
                          decoration: InputDecoration(
                            border: InputBorder.none,
                            hintText: "Do math homework",
                          ),
                        )),
                    Container(
                        alignment: Alignment.center,
                        padding: const EdgeInsets.symmetric(horizontal: 24),
                        child: const TextField(
                          decoration: InputDecoration(
                            border: InputBorder.none,
                            hintText: "Description",
                          ),
                        )),
                    Padding(
                      padding: const EdgeInsets.fromLTRB(26, 26, 26, 0),
                      child: Row(children: [
                        IconButton(
                            onPressed: null,
                            icon: Icon(
                              Icons.timer,
                              size: 20,
                              color: Colors.white,
                            )),
                        IconButton(
                            onPressed: null,
                            icon: Icon(
                              Icons.category_outlined,
                              size: 20,
                              color: Colors.white,
                            )),
                        Spacer(),
                        IconButton(
                            onPressed: null,
                            icon: Icon(
                              Icons.send_rounded,
                              size: 20,
                              color: SecondaryColor,
                            ))
                      ]),
                    )
                  ],
                ),
              ),
            );
          },
        ),
        style: ElevatedButton.styleFrom(
            backgroundColor: SecondaryColor,
            shape: const CircleBorder(),
            padding: const EdgeInsets.all(20)),
        child: const Icon(Icons.add, color: Colors.white),
      ),
    ));
  }
}
