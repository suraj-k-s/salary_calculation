import 'dart:io';

import 'package:flutter/material.dart';
import 'package:salary_calculation/displayResult.dart';

class SalaryCalculator extends StatefulWidget {
  const SalaryCalculator({super.key});

  @override
  State<SalaryCalculator> createState() => _SalaryCalculatorState();
}

class _SalaryCalculatorState extends State<SalaryCalculator> {
  final _formKey = GlobalKey<FormState>();
  String? Gender;
  String? Marital;
  String? Department;
  final TextEditingController _fnameController = TextEditingController();
  TextEditingController _lnameController = TextEditingController();
  TextEditingController _basicSalaryController = TextEditingController();
  List<String> departments = ['Accounts', 'Sales', 'Manager', 'Clerk'];

  void submit(){
    var name = "${_fnameController.text} ${_lnameController.text}";
    double salary = double.parse(_basicSalaryController.text);
    Navigator.push(context, MaterialPageRoute(builder: (context) => DisplayResult(Name: name, Gender: Gender, Marital: Marital, Dept: Department, BasicSalary: salary),));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
            onPressed: () {
              exit(0);
            },
            icon: const Icon(Icons.arrow_back_ios_new_rounded)),
        title: const Text('Salary Calculator'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(15.0),
        child: Form(
          key: _formKey,
          child: ListView(
            children: [
              TextFormField(
                decoration: const InputDecoration(
                    hintText: 'First Name',
                    border: UnderlineInputBorder(
                    )),
                    controller: _fnameController,
              ),
              TextFormField(
                decoration: const InputDecoration(
                    hintText: 'Last Name',
                    border: UnderlineInputBorder(
                    )),
                    controller: _lnameController,
              ),
              Row(
                children: [
                  const Text('Gender:'),
                  Radio(
                      value: 'Male',
                      groupValue: Gender,
                      onChanged: (value) {
                        setState(() {
                          Gender = value;
                        });
                      }),
                  const Text('Male'),
                  Radio(
                      value: 'Female',
                      groupValue: Gender,
                      onChanged: (value) {
                        setState(() {
                          Gender = value;
                        });
                      }),
                  const Text('Female'),
                  Radio(
                      value: 'Others',
                      groupValue: Gender,
                      onChanged: (value) {
                        setState(() {
                          Gender = value;
                        });
                      }),
                  const Text('Others'),
                ],
              ),
              Row(
                children: [
                  const Text('Marital Status:'),
                  Radio(
                      value: 'Single',
                      groupValue: Marital,
                      onChanged: (value) {
                        setState(() {
                          Marital = value;
                        });
                      }),
                  const Text('Single'),
                  Radio(
                      value: 'Married',
                      groupValue: Marital,
                      onChanged: (value) {
                        setState(() {
                          Marital = value;
                        });
                      }),
                  const Text('Married'),
                ],
              ),
              DropdownButtonFormField(
                items: departments.map((String department) {
                  return DropdownMenuItem(
                    value: department,
                    child: Text(department),
                  );
                }).toList(),
                onChanged: (value) {
                  setState(() {
                    Department = value;
                  });
                },
                value: Department,
              ),
              TextFormField(
                controller: _basicSalaryController,
                decoration: const InputDecoration(
                    hintText: 'Basic Salary',
                    border: UnderlineInputBorder(
                    )),
              ),
              const SizedBox(
                height: 10,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  ElevatedButton(onPressed: (){
                    submit();
                  }, child: const Padding(
                    padding: EdgeInsets.only(left: 15, right: 15),
                    child: Text('Submit'),
                  )),
                  ElevatedButton(onPressed: (){
                     _formKey.currentState?.reset();
                      _fnameController.clear();
                      _lnameController.clear();
                      _basicSalaryController.clear();
                      setState(() {
                        Gender = null;
                        Marital = null;
                        Department = null;
                      });
                  }, child: const Padding(
                    padding: EdgeInsets.only(left: 15, right: 15),
                    child: Text('Reset'),
                  )),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
