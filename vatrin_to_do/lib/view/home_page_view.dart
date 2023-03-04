import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:vatrin_to_do/assets/themes/constants.dart';
import 'package:vatrin_to_do/assets/themes/theme.dart';
import 'package:vatrin_to_do/view/widgets/add_task_widget.dart';
import 'package:vatrin_to_do/viewmodel/home_page_viewmodel.dart';

class HomePageView extends StatefulWidget {
  const HomePageView({super.key});

  @override
  State<HomePageView> createState() => _HomePageViewState();
}

class _HomePageViewState extends State<HomePageView> {
  @override
  void initState() {
    super.initState();
    Provider.of<HomePageViewModel>(context, listen: false).fetchTasks();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: <Widget>[
          IconButton(
            icon: const Icon(Icons.calendar_month),
            tooltip: 'Calender',
            onPressed: () {
              Provider.of<HomePageViewModel>(context);
            },
          ),
        ],
        centerTitle: true,
        title: const Text("Home"),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Spacer(),
            Provider.of<HomePageViewModel>(context).isEmpty
                ? Column(
                    children: const [
                      Text(
                        "What do you want to do today?",
                        style: TextStyle(
                            fontWeight: FontWeight.w400, fontSize: 20),
                      ),
                      Text(
                        "Tap + to add your tasks",
                        style: TextStyle(
                            fontWeight: FontWeight.w400, fontSize: 16),
                      ),
                    ],
                  )
                : Container(),
            const Spacer(),
            AddTask()
          ],
        ),
      ),
    );
  }
}
