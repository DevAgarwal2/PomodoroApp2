import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:pomodroapp/App1/Comp/floating_button.dart';
import 'package:pomodroapp/App1/Comp/mybutton.dart';
import 'package:pomodroapp/App1/Comp/showmodal.dart';
import 'package:pomodroapp/App1/logic/calender_model.dart';
import 'package:table_calendar/table_calendar.dart';

import '../Comp/myTextField.dart';

class CalenderPage extends StatefulWidget {
  const CalenderPage({super.key});

  @override
  State<CalenderPage> createState() => _CalenderPageState();
}

class _CalenderPageState extends State<CalenderPage> {
  TextEditingController taskController = TextEditingController();
  TextEditingController editController = TextEditingController();

  List data = [];

  static DateTime today = DateTime.now();

  String properDate = "";

  void onDaySelected(DateTime day, DateTime focuseDate) {
    setState(() {
      today = day;
    });
  }

  Future showModel(BuildContext context, TextEditingController edit,
      Function()? onPressed) async {
    showModalBottomSheet(
      enableDrag: true,
      isScrollControlled: true,
      context: context,
      shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.vertical(top: Radius.circular(15))),
      builder: (context) {
        return Container(
          height: 570,
          decoration: BoxDecoration(
              borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(18), topRight: Radius.circular(18))),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                SizedBox(
                  height: 20,
                ),
                Image.asset(
                  "Assets/4894122.jpg",
                  height: 160,
                  width: 160,
                ),
                SizedBox(
                  height: 15,
                ),
                myTextField(
                  controller: edit,
                ),
                SizedBox(
                  height: 15,
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 15, right: 15),
                  child: TextButton(
                    onPressed: onPressed,
                    child: Text(
                      "Edit",
                      style: TextStyle(color: Colors.white, fontSize: 16),
                    ),
                    style: ButtonStyle(
                        backgroundColor:
                            MaterialStatePropertyAll(Colors.deepPurple)),
                  ),
                )
              ],
            ),
          ),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey.shade200,
      floatingActionButton: Padding(
        padding: const EdgeInsets.only(bottom: 60),
        child: FloatButton(
            taskController: taskController,
            onPressed: () {
              createData(date: today, note: taskController.text);
              Navigator.pop(context);
              taskController.clear();
            }),
      ),
      body: StreamBuilder(
        stream: getData(),
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            data = snapshot.data!.toList();
            return SafeArea(
                child: Column(
              children: [
                Container(
                  child: TableCalendar(
                      headerStyle: HeaderStyle(
                        formatButtonVisible: false,
                        titleCentered: true,
                      ),
                      availableGestures: AvailableGestures.all,
                      focusedDay: today,
                      onDaySelected: onDaySelected,
                      selectedDayPredicate: (day) => isSameDay(day, today),
                      firstDay: DateTime.utc(2023, 6, 1),
                      lastDay: DateTime.utc(2030, 12, 31)),
                ),
                SizedBox(
                  height: 30,
                ),
                Expanded(
                    child: ListView(
                  children: data
                      .where((task) =>
                          isSameDay(DateTime.parse(task.dateTime), today))
                      .map((e) => fetchData(e))
                      .toList(),
                ))
              ],
            ));
          } else if (snapshot.hasError) {
            return Center(
              child: Text(snapshot.error.toString()),
            );
          }
          return CircularProgressIndicator();
        },
      ),
    );
  }

  Widget fetchData(Task task2) {
    DateTime taskDateTime = DateTime.parse(task2.dateTime);

    String formatDate = DateFormat("MMM d").format(taskDateTime);
    return Padding(
      padding: const EdgeInsets.all(6.0),
      child: Container(
        margin: EdgeInsets.only(left: 15, right: 15),
        padding: EdgeInsets.all(5),
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(12), color: Colors.white),
        child: ListTile(
          title: Text(formatDate),
          subtitle: Text(task2.task),
          trailing: PopupMenuButton(
            onSelected: (value) {
              if (value == "1") {
              
                showDialog(
                  context: context,
                  builder: (context) {
                    return AlertDialog(
                      scrollable: true,
                      title: myTextField(controller: editController),
                      actions: [
                        
                      Row(
                        children: [
                          SizedBox(width: 50,),
                            GestureDetector(
                          onTap: () {
                            final editName = editController.text;

                                  final docUser = FirebaseFirestore.instance
                                      .collection("pomodro")
                                      .doc(task2.id);
                                  docUser.update({
                                    
                                    "task": editName
                                  });
                                  editController.clear();
                            Navigator.pop(context);
                          },
                          child:Container(
                            width: 80,
                            padding: EdgeInsets.only(top: 10,left: 20,right: 20,bottom: 10),
                            decoration: BoxDecoration(
                              color: Colors.green,
                              borderRadius: BorderRadius.circular(12)
                            ),
                            child: Text("Edit",textAlign: TextAlign.center,style: TextStyle(color: Colors.white,fontSize: 18),),

                          ) ),
                        SizedBox(width: 15,),
                        GestureDetector(
                          onTap: () {
                            Navigator.pop(context);
                          },
                          child: Container(
                            width: 80,
                            padding: EdgeInsets.only(top: 10,left: 10,right: 10,bottom: 10),
                            decoration: BoxDecoration(
                              color: Colors.red,
                              borderRadius: BorderRadius.circular(12)
                            ),
                            child: Text("Cancel",style: TextStyle(color: Colors.white,fontSize: 18),),

                          ))
                        ],
                      )
                      ],
                    );
                  },
                );
              }
            },
            itemBuilder: (context) {
              return <PopupMenuEntry<String>>[
                PopupMenuItem(
                  value: "1",
                  child: Row(
                    children: [
                      Icon(Icons.edit),
                      SizedBox(
                        width: 10,
                      ),
                      Text("Edit")
                      
                    ],
                  ),
                ),
                PopupMenuItem(
                    onTap: () {
                      final docUser = FirebaseFirestore.instance
                          .collection("pomodro")
                          .doc(task2.id);
                      docUser.delete();
                    },
                    child: Row(
                      children: [
                        Icon(
                          Icons.delete,
                          color: Colors.red,
                        ),
                        SizedBox(
                          width: 10,
                        ),
                        Text("Delete")
                      ],
                    )),
              ];
            },
          ),
        ),
      ),
    );
  }

  Future createData({required DateTime date, required String note}) async {
    final docUser = FirebaseFirestore.instance.collection("pomodro").doc();
    final data = Task(dateTime: date.toString(), task: note, id: docUser.id);
    final json = data.toJson();
    await docUser.set(json);
  }

  Stream<Iterable<Task>> getData() {
    return FirebaseFirestore.instance
        .collection("pomodro")
        .snapshots()
        .map((event) => event.docs.map((e) => Task.fromJson(e.data())));
  }
}
