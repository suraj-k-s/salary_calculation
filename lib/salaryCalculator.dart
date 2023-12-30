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
  String FName = '';
  String? ErrorTextGender = '';
  String? ErrorTextMarital = '';
  final TextEditingController _fnameController = TextEditingController();
  TextEditingController _lnameController = TextEditingController();
  TextEditingController _basicSalaryController = TextEditingController();
  List<String> departments = ['Accounts', 'Sales', 'Manager', 'Clerk'];

  String? validateFName(String? value) {
    if (value == null || value.isEmpty) {
      return 'Please enter a name';
    }
    return null;
  }

  String? validateLName(String? value) {
    if (value == null || value.isEmpty) {
      return 'Please enter a name';
    }
    return null;
  }

  String? validatBS(String? value) {
    if (value == null || value.isEmpty) {
      return 'Please enter a name';
    }
    return null;
  }

  String? validateGRadio(String? value) {
    if (value == null) {
      return 'Please select an option';
    }
    return null;
  }

  String? validateMRadio(String? value) {
    if (value == null) {
      return 'Please select an option';
    }
    return null;
  }

  String? validateRadio(String? value) {
    if (value == null) {
      return 'Please select an option';
    }
    return null;
  }

  String? validateDropdown(String? value) {
    if (value == null || value.isEmpty) {
      return 'Please select a department';
    }
    return null;
  }

  void submit() {
    if (Gender == null) {
      setState(() {
        ErrorTextGender = 'Please select a gender';
      });
    }
    if (Marital == null) {
      setState(() {
        ErrorTextMarital = 'Please select a marital status';
      });
    }
    if (_formKey.currentState?.validate() ?? false) {
      setState(() {
        FName = "${_fnameController.text} ${_lnameController.text}";
      });
    }
    double salary = double.parse(_basicSalaryController.text);
    if (Gender != null && Marital != null) {
      Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => DisplayResult(
                Name: FName,
                Gender: Gender,
                Marital: Marital,
                Dept: Department,
                BasicSalary: salary),
          ));
    }
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
                    hintText: 'First Name', border: UnderlineInputBorder()),
                controller: _fnameController,
                validator: validateFName,
              ),
              TextFormField(
                decoration: const InputDecoration(
                    hintText: 'Last Name', border: UnderlineInputBorder()),
                controller: _lnameController,
                validator: validateLName,
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
                          ErrorTextGender = '';
                        });
                      }),
                  const Text('Male'),
                  Radio(
                      value: 'Female',
                      groupValue: Gender,
                      onChanged: (value) {
                        setState(() {
                          Gender = value;
                          ErrorTextGender = '';
                        });
                      }),
                  const Text('Female'),
                  Radio(
                      value: 'Others',
                      groupValue: Gender,
                      onChanged: (value) {
                        setState(() {
                          Gender = value;
                          ErrorTextGender = '';
                        });
                      }),
                  const Text('Others'),
                ],
              ),
              if (ErrorTextGender!.isNotEmpty)
                Text(
                  ErrorTextGender!,
                  style: const TextStyle(color: Colors.red),
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
                          ErrorTextMarital = '';
                        });
                      }),
                  const Text('Single'),
                  Radio(
                    value: 'Married',
                    groupValue: Marital,
                    onChanged: (value) {
                      setState(() {
                        Marital = value;
                        ErrorTextMarital = '';
                      });
                    },
                  ),
                  const Text('Married'),
                ],
              ),
              if (ErrorTextMarital!.isNotEmpty)
                Text(
                  ErrorTextMarital!,
                  style: const TextStyle(color: Colors.red),
                ),
              DropdownButtonFormField(
                validator: validateDropdown,
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
                validator: validatBS,
                decoration: const InputDecoration(
                    hintText: 'Basic Salary', border: UnderlineInputBorder()),
              ),
              const SizedBox(
                height: 10,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  ElevatedButton(
                      onPressed: () {
                        submit();
                      },
                      child: const Padding(
                        padding: EdgeInsets.only(left: 15, right: 15),
                        child: Text('Submit'),
                      )),
                  ElevatedButton(
                      onPressed: () {
                        _formKey.currentState?.reset();
                        _fnameController.clear();
                        _lnameController.clear();
                        _basicSalaryController.clear();
                        setState(() {
                          Gender = null;
                          Marital = null;
                          Department = null;
                          ErrorTextGender = '';
                          ErrorTextMarital = '';
                        });
                      },
                      child: const Padding(
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
