import 'package:flutter/widgets.dart';
import 'package:sand_box/model/list_model.dart';

class ListViewModel extends StatelessWidget {
  final ListModel listModel;

  ListViewModel(this.listModel);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: <Widget>[
          Text(
            listModel.id.toString() + " " + listModel.title,
          ),
          SizedBox(
            height: 16,
          ),
          Text(listModel.value.toStringAsFixed(1)),
        ],
      ),
    );
  }
}
