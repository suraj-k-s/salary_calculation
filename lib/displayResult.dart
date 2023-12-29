import 'package:flutter/material.dart';

class DisplayResult extends StatefulWidget {
  final String Name;
  final String? Gender;
  final String? Marital;
  final String? Dept;
  final double? BasicSalary;

  const DisplayResult({
    Key? key,
    required this.Name,
    required this.Gender,
    required this.Marital,
    required this.Dept,
    required this.BasicSalary,
  }) : super(key: key);

  @override
  State<DisplayResult> createState() => _DisplayResultState();
}

class _DisplayResultState extends State<DisplayResult> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Employee Details'),
        leading: IconButton(onPressed: (){
          Navigator.pop(context);
        }, icon: const Icon(Icons.arrow_back_ios_new_rounded)),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('Name: ${widget.Name}'),
            Text('Gender: ${widget.Gender}'),
            Text('Marital Status: ${widget.Marital}'),
            Text('Department: ${widget.Dept}'),
            Text('Basic Salary: ${widget.BasicSalary}'),
          ],
        ),
      ),
    );
  }
}
