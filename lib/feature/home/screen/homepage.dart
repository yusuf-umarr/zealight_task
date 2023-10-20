import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:zealight_task/feature/home/models/school_model.dart';
import 'package:zealight_task/feature/home/view_model/home_view_model.dart';

class Homepage extends StatefulWidget {
  const Homepage({super.key});

  @override
  State<Homepage> createState() => _HomepageState();
}

class _HomepageState extends State<Homepage> {
  @override
  void initState() {
    final provider = Provider.of<HomeViewModel>(context, listen: false);
    provider.fetchSchoolData(context);

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    HomeViewModel homeViewModel = context.watch<HomeViewModel>();
    return Scaffold(
      appBar: AppBar(
        title: const Text("Zealight Task"),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          children: [
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  border: Border.all()),
              child: TextFormField(
                onChanged: (query) {
                  homeViewModel.searchSchool(query);
                },
                decoration: const InputDecoration(
                  hintText: "Search school",
                  border: InputBorder.none,
                  enabledBorder: InputBorder.none,
                ),
              ),
            ),
            if (homeViewModel.schoolDataList.isEmpty)
              const CircularProgressIndicator(
                color: Colors.blue,
              ),
           const SizedBox(
              height: 20,
            ),
            Expanded(
              child: ListView.builder(
                itemCount: homeViewModel.newSearchedSchool.length,
                itemBuilder: (context, index) {
                  final SchoolModel schools =
                      homeViewModel.newSearchedSchool[index];

                  return Column(
                    children: [
                      Text(
                        schools.name,
                        style: const TextStyle(
                          fontSize: 17,
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                    ],
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
