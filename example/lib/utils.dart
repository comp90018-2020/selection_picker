
import 'package:selection_picker/selection_item.dart';

class Utilities {
  static List<SelectionItem> getDays() {
    List<SelectionItem> days = [];
    days.add(SelectionItem(name: "L", isSelected: false, identifier: 1));
    days.add(SelectionItem(name: "M", isSelected: false, identifier: 2));
    days.add(SelectionItem(name: "M", isSelected: false, identifier: 3));
    days.add(SelectionItem(name: "J", isSelected: false, identifier: 4));
    days.add(SelectionItem(name: "V", isSelected: false, identifier: 5));
    days.add(SelectionItem(name: "S", isSelected: false, identifier: 6));
    days.add(SelectionItem(name: "D", isSelected: false, identifier: 7));
    return days;
  }
}
