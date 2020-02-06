import 'package:flutter/material.dart';
import 'package:selection_picker_example/utils.dart';
import 'package:selection_picker/selectionpicker.dart';
class ExamplePage extends StatelessWidget{

  final _styleTitleSelectAll = TextStyle(
      fontSize: 16.0,
      color: Color(0xFF003A5D),
      fontWeight: FontWeight.bold
  );

  final _styleTitle =  TextStyle(fontSize: 16.0,color: Color(0xFFEC0B43));

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Home"),
      ),
      body: Center(
        child: Container(
          child: SelectionPicker(
            items: Utilities.getDays(),
            showSelectAll: true,
            textColor: Color(0xFF003A5D),
            selectAllTitle: Text("Select all",style: _styleTitleSelectAll),
            showTitle: true,
            title: Text("Week days",style: _styleTitle,),
            backgroundColorSelected: Colors.black12,
            onSelected: (items){
            //Items selected here 
            },
            aligment: Alignment.center,
          ),
        ),
      ),
    );
  }
}