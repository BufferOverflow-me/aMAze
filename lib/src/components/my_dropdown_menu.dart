import 'package:fitness_app/src/services/workout_day_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class MyDropDownMenu extends StatefulWidget {
  const MyDropDownMenu({
    Key? key,
    required this.myDropdownItems,
    this.title = '',
    this.icon = Icons.arrow_drop_down,
    required this.index,
  }) : super(key: key);

  final List<String> myDropdownItems;
  final String title;
  final IconData icon;
  final int index;

  @override
  State<MyDropDownMenu> createState() => _MyDropDownMenuState();
}

class _MyDropDownMenuState extends State<MyDropDownMenu> {
  late String _selectedItem;
  @override
  void initState() {
    super.initState();
    _selectedItem = widget.myDropdownItems.first;
  }

  @override
  Widget build(BuildContext context) {
    // final provider = Provider.of<WorkoutDayProvider>(context, listen: false);
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Text(
          widget.title,
          textAlign: TextAlign.end,
          style: Theme.of(context).textTheme.headline6,
        ),
        SizedBox(
          width: MediaQuery.of(context).size.width * 0.5,
          child: DropdownButtonFormField(
            value: _selectedItem,
            icon: Icon(widget.icon),
            iconSize: 24,
            elevation: 16,
            style: const TextStyle(color: Colors.deepPurple),
            onChanged: (String? newValue) {
              setState(() {
                _selectedItem = newValue!;
              });
              Provider.of<WorkoutDayProvider>(context, listen: false)
                  .workoutDataArraySetter(widget.index, newValue!);
            },
            // onSaved: (String? newValue) {
            // print('WorkOut Data Array: ' +
            //     provider.workoutDataArray.toString());
            // },
            items: widget.myDropdownItems.map<DropdownMenuItem<String>>(
              (String value) {
                return DropdownMenuItem<String>(
                  value: value,
                  child: Text(value),
                );
              },
            ).toList(),
          ),
        ),
      ],
    );
  }
}
