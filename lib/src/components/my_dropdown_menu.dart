import 'package:fitness_app/src/screens/data/workout_days.dart';
import 'package:flutter/material.dart';

class MyDropDownMenu extends StatefulWidget {
  const MyDropDownMenu({
    Key? key,
    required this.myDropdownItems,
    this.title = '',
    this.icon = Icons.arrow_drop_down,
  }) : super(key: key);

  final List<String> myDropdownItems;
  final String title;
  final IconData icon;

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
    return SizedBox(
      width: MediaQuery.of(context).size.width * 0.5,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Text(
            widget.title,
            textAlign: TextAlign.end,
            style: Theme.of(context).textTheme.headline6,
          ),
          DropdownButton(
            value: _selectedItem,
            icon: Icon(widget.icon),
            iconSize: 24,
            elevation: 16,
            style: const TextStyle(color: Colors.deepPurple),
            onChanged: (String? newValue) {
              setState(() {
                _selectedItem = newValue!;
              });
            },
            items: widget.myDropdownItems.map<DropdownMenuItem<String>>(
              (String value) {
                return DropdownMenuItem<String>(
                  value: value,
                  child: Text(value),
                );
              },
            ).toList(),
          ),
        ],
      ),
    );
  }
}
/*

 required this.myDropdownItems,
    this.title = '',
    this.icon = Icons.arrow_drop_down,



Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        Text(widget.title),
        const SizedBox(width: 10),
        DropdownButton<String>(
          value: widget.myDropdownItems[0],
          icon: Icon(widget.icon),
          iconSize: 24,
          elevation: 16,
          style: const TextStyle(color: Colors.deepPurple),
          underline: Container(
            height: 2,
            color: Colors.deepPurpleAccent,
          ),
          onChanged: (String? newValue) {
            setState(() {
              widget.myDropdownItems[0] = newValue!;
            });
          },
          items: widget.myDropdownItems.map<DropdownMenuItem<String>>(
            (String value) {
              return DropdownMenuItem<String>(
                value: value,
                child: Text(value),
              );
            },
          ).toList(),
        ),
      ],
    )*/
