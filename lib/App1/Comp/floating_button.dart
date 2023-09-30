import "package:flutter/material.dart";
import "package:pomodroapp/App1/Comp/myTextField.dart";
class FloatButton extends StatelessWidget {
   FloatButton({super.key,required this.taskController,required this.onPressed});
    TextEditingController taskController = TextEditingController();
    Function()? onPressed;


  @override
  Widget build(BuildContext context) {
    return FloatingActionButton(
          child: Icon(Icons.add),
          onPressed: () {
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
                          topLeft: Radius.circular(18),
                          topRight: Radius.circular(18))),
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
                        myTextField(controller: taskController,),
                        SizedBox(
                          height: 15,
                        ),
                        Padding(
                          padding: const EdgeInsets.only(left: 15,right: 15),
                          child: TextButton(
                            onPressed:onPressed,
                            child: Text("Add",style: TextStyle(color: Colors.white,fontSize: 16),),
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
          },
          backgroundColor: Colors.deepPurple,
        
      
  
    );}}