
import 'package:selection_picker/selection_item.dart';

class Utilities {
  static List<SelectionItem> getDays() {
    List<SelectionItem> days = [];
    days.add(SelectionItem(name: "MO", isSelected: false, identifier: 1));
    days.add(SelectionItem(name: "TU", isSelected: false, identifier: 2));
    days.add(SelectionItem(name: "WE", isSelected: false, identifier: 3));
    days.add(SelectionItem(name: "TH", isSelected: false, identifier: 4));
    days.add(SelectionItem(name: "FR", isSelected: false, identifier: 5));
    days.add(SelectionItem(name: "SA", isSelected: false, identifier: 6));
    days.add(SelectionItem(name: "SU", isSelected: false, identifier: 7));
    return days;
  }
}
