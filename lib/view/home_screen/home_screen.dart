import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:my_to_do_app/view/to_do_screen/to_do_screen.dart';
import 'package:shared_preferences/shared_preferences.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {

  SharedPreferences? sharedPreferences;
  List<ToDoModel> toDoModel = [];

  setInstant() async {
    sharedPreferences = await SharedPreferences.getInstance();
    getData();
  }
  getData(){
    var data sharedPreferences!.getStringList("ToDoData");
    for(var mapData in data!){
      toDoModel.add(toDoModelFromJson(mapData));
    }
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text(
          "Track Your Tasks",
          style: TextStyle(fontSize: 20, fontWeight: FontWeight.w800),
        ),
        leading: const BackButton(),
      ),
      body: ListView.separated(
          scrollDirection: Axis.vertical,
          shrinkWrap: true,
          physics: const BouncingScrollPhysics(),
          itemBuilder: (context, index) {
            return Slidable(
              direction: Axis.horizontal,
              endActionPane: ActionPane(
                motion: const ScrollMotion(),
                children: [
                  SlidableAction(
                    onPressed: (context) {
                      setState(() {
                        // toDoData.removeAt(index);
                      });
                    },
                    backgroundColor: const Color(0xffFF1900),
                    icon: Icons.delete,
                    borderRadius:
                    const BorderRadius.all(Radius.circular(10)),
                  ),
                ],
              ),
              child: Column(
                children: [
                  Container(
                    margin: const EdgeInsets.symmetric(horizontal: 15, vertical: 8),
                    clipBehavior: Clip.antiAlias,
                    height: 80,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(15),
                      color: Colors.white,
                      boxShadow: const [
                        BoxShadow(
                          spreadRadius: 2,
                          color: Colors.black26,
                          blurRadius: 10,
                          offset: Offset(0, 5),
                        ),
                      ],
                    ),
                    child: Row(
                      children: [
                        Container(
                          decoration: BoxDecoration(
                            color: Colors.grey,
                            borderRadius: BorderRadius.circular(15),
                          ),
                          width: 70,
                          child: Center(
                            child: Text(
                              (index + 1).toString(),
                              style: const TextStyle(
                                color: Colors.black,
                                fontWeight: FontWeight.w600,
                                fontSize: 20,
                              ),
                            ),
                          ),
                        ),
                        const SizedBox(width: 20),
                        Column(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Row(
                              children: [
                                const Text(
                                  "Task",
                                  style: TextStyle(
                                    color: Colors.black,
                                    fontWeight: FontWeight.w600,
                                    fontSize: 20,
                                  ),
                                ),
                                const SizedBox(
                                  width: 10,
                                ),
                                Container(
                                  height: 20,
                                  width: 2,
                                  decoration: const BoxDecoration(color: Colors.black26),
                                ),
                                const SizedBox(
                                  width: 10,
                                ),
                                const Text(
                                  "Time",
                                  style: TextStyle(
                                    color: Colors.black,
                                    fontWeight: FontWeight.w600,
                                    fontSize: 20,
                                  ),
                                ),
                              ],
                            ),
                            const Text(
                              "Description",
                              style: TextStyle(
                                color: Colors.black,
                                fontWeight: FontWeight.w600,
                                fontSize: 20,
                              ),
                            ),
                          ],
                        ),
                        const Spacer(),
                        IconButton(
                          splashRadius: 1,
                          onPressed: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => const ToDoScreen(),
                              ),
                            );
                          },
                          icon: const Icon(Icons.drive_file_rename_outline, color: Colors.green),
                        ),
                        IconButton(
                          splashRadius: 1,
                          onPressed: () {},
                          icon: const Icon(Icons.delete, color: Colors.red),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            );
          },
          separatorBuilder: (context, index) => const SizedBox(height: 15),
          itemCount: 10),
    );
  }
  Map<String, dynamic> toDoData ={
    "Title":"text",
    "description":"text",
    "time": "time" ,
  };
}
