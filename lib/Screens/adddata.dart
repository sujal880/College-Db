import 'package:collegedb/Database/dbhelper.dart';
import 'package:collegedb/Widgets/uihelper.dart';
import 'package:flutter/material.dart';
import 'dart:developer';
class AddDataScreen extends StatefulWidget {
  const AddDataScreen ({super.key});

  @override
  State<AddDataScreen > createState() => _AddDataScreenState();
}

class _AddDataScreenState extends State<AddDataScreen > {
  TextEditingController titleController=TextEditingController();
  TextEditingController descController=TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Add Data"),
        centerTitle: true,
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
        UiHelper.CustomTextField(titleController,"Enter Title", Icons.title),
        UiHelper.CustomTextField(descController,"Enter Description", Icons.description),
        SizedBox(height: 30,),
        ElevatedButton(onPressed: (){
          addData(titleController.text.toString(), descController.text.toString());
        }, child: Text("Add Data"))
      ],),
    );
  }
  addData(String title,String desc)async{
    if(title=="" || desc==""){
      return log("Enter Required Field's");
    }
    else{
      DbHelper().addData(title, desc);
      log("Data Inserted!!");
    }
  }
}
