import 'dart:collection';
import 'package:selection_picker/selection_item.dart';
import 'package:flutter/material.dart';

class SelectionPicker extends StatefulWidget {
  List<SelectionItem> items;
  Function(List<SelectionItem>) onSelected;
  bool showTitle;
  bool showSelectAll;
  Text selectAllTitle;
  Text title;
  Color backgroundColorSelected;
  Color backgroundColorNoSelected;
  Color textColor;
  Alignment aligment = Alignment.center;

  SelectionPicker(
      {@required this.items,
        this.showTitle = true,
        this.showSelectAll = true,
        this.selectAllTitle,
        this.title,
        this.backgroundColorSelected,
        this.backgroundColorNoSelected,
        this.textColor,
        this.aligment,
        @required this.onSelected});

  @override
  SelectionPickerState createState() => SelectionPickerState();
}

class SelectionPickerState extends State<SelectionPicker> {
  List<SelectionItem> selectedDays = [];
  bool isChecked = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Center(
          child: Container(
            margin: EdgeInsets.all(16.0),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: <Widget>[
                _showTitle(widget.showTitle),
                Container(
                    alignment: widget.aligment,
                    child: Wrap(
                      children: _createItems(),
                    )),
                _showSelectedAllWidget(widget.showSelectAll),
              ],
            ),
          ),
        ));
  }

  Widget _showTitle(bool select) {
    if (select && widget.title != null) {
      return Container(
          margin:
          EdgeInsets.only(left: 16.0, right: 16.0, top: 16.0, bottom: 12.0),
          alignment: Alignment.centerLeft,
          child: widget.title);
    } else {
      return Container();
    }
  }

  List<Widget> _createItems() {
    List<Widget> days = [];

    _checkIdentifiers();

    widget.items.forEach((item) {
      final widgetItem = Container(
        width: 50,
        height: 50,
        child: Container(
          margin: EdgeInsets.only(right: 5.0),
          child: FlatButton(
              padding: EdgeInsets.all(5.0),
              onPressed: () {
                setState(() {
                  item.isSelected = !item.isSelected;
                  item.isSelected
                      ? _addToSelectedDays(item)
                      : _removeFromSelectedDays(item);
                  _updateSwitch();
                  widget.onSelected(selectedDays);
                });
              },
              child: _setName(item.name),
              shape: CircleBorder(),
              color: _setSelectedColor(item.isSelected)),
        ),
      );
      days.add(widgetItem);
    });

    return days;
  }

  Widget _setName(String name) {
    var colorItem =
    widget.textColor != null ? widget.textColor : Colors.black;

    if (name.length >= 2) {
      return Text(
        name.substring(0, 2),
        style: TextStyle(
            color: colorItem, fontWeight: FontWeight.bold, fontSize: 15.0),
      );
    }

    return Text(
      name,
      style: TextStyle(
          color: colorItem, fontWeight: FontWeight.bold, fontSize: 17.0),
    );
  }

  _addToSelectedDays(SelectionItem day) => selectedDays.add(day);

  _removeFromSelectedDays(SelectionItem day) => selectedDays.remove(day);

  Widget _showSelectedAllWidget(bool select) =>
      select ? _createSelectAllDays() : Container();

  Widget _createSelectAllDays() {
    return SwitchListTile(
        value: isChecked,
        title: widget.selectAllTitle != null
            ? widget.selectAllTitle
            : Text("Set switch title here"),
        activeColor: Color(0xFF003A5D),
        onChanged: (checked) {
          setState(() {
            isChecked = checked;
            _selectAllDays(isChecked);
          });
        });
  }

  _selectAllDays(bool select) {
    selectedDays.clear();
    widget.items.forEach((item) {
      item.isSelected = select;
      if (select) selectedDays.add(item);
    });

    widget.onSelected(selectedDays);
  }

  _updateSwitch() {
    isChecked = selectedDays.length == widget.items.length ? true : false;
  }

  Color _setSelectedColor(bool selected) {
    if (selected) {
      return widget.backgroundColorSelected != null
          ? widget.backgroundColorSelected
          : Colors.black12;
    } else {
      return widget.backgroundColorNoSelected != null
          ? widget.backgroundColorNoSelected
          : Colors.transparent;
    }
  }

  ///Throw and exception if array [items] given has duplicated identifiers
  void _checkIdentifiers() {
    List<dynamic> identifiers = [];

    widget.items.forEach((item) {
      identifiers.add(item.identifier);
    });

    if (identifiers.isNotEmpty) {
      List<dynamic> result = LinkedHashSet<dynamic>.from(identifiers).toList();
      if (result.length != identifiers.length) {
        throw "There are duplicated identifiers in Items Array , the item identifier must be unique";
      }
    }
  }
}
