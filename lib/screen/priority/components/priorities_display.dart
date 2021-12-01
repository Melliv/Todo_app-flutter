import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todo_app_flutter/providers/priority_provider.dart';
import 'package:todo_app_flutter/screen/priority/components/priority_item.dart';

class PrioritiesDisplay extends StatefulWidget {
  const PrioritiesDisplay({Key? key}) : super(key: key);

  @override
  _PrioritiesDisplayState createState() => _PrioritiesDisplayState();
}

class _PrioritiesDisplayState extends State<PrioritiesDisplay> {
  @override
  Widget build(BuildContext context) {
    PriorityProvider priorityProv = Provider.of<PriorityProvider>(context);

    return ListView.builder(
        physics: NeverScrollableScrollPhysics(),
        shrinkWrap: true,
        itemCount: priorityProv.priorities.length,
        itemBuilder: (BuildContext context, int index) {
          return PriorityItem(priority: priorityProv.priorities[index]);
        });
  }
}
