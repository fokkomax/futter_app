import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:intl/intl.dart';

class AddUserPage extends StatefulWidget {
  @override
  _AddUserPageState createState() => _AddUserPageState();
}

class _AddUserPageState extends State<AddUserPage> {
  TextEditingController ctrlFirstName = TextEditingController();
  TextEditingController ctrlLastName = TextEditingController();
  TextEditingController ctrlBirthDay = TextEditingController();
  final _formKey = GlobalKey<FormState>();
  Choice selectedSex = choice[0];
  bool isActive = true;

  Future _showDatePicker() async {
    DateTime currentDate = DateTime.now();
    DateTime firstDate = DateTime(currentDate.year - 100, 1, 1);
    DateTime lastDate = DateTime(currentDate.year, currentDate.month,
        currentDate.day - 1 <= 0 ? 1 : currentDate.day - 1);

    DateTime selectDate = await showDatePicker(
        context: context,
        initialDate: lastDate,
        firstDate: firstDate,
        lastDate: lastDate);

    var strDate = DateFormat.MMMMd('th_TH').format(selectDate);
    int thYear = selectDate.year + 543;
    String thaiDate = '$strDate $thYear';
    ctrlBirthDay.text = thaiDate;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: Text(
          'เพิ่มผู้ใช้งาน',
          style: TextStyle(fontSize: 20),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Column(
          children: <Widget>[
            Text(
              'รายละเอียดผู้ใช้งาน',
              style: TextStyle(fontSize: 20, color: Colors.black),
            ),
            Container(
              decoration: BoxDecoration(color: Colors.white),
              child: Container(
                decoration: BoxDecoration(color: Colors.white),
                child: Form(
                    key: _formKey,
                    child: Column(
                      children: <Widget>[
                        TextFormField(
                          validator: (value) {
                            if (value.isEmpty) {
                              return ('กรุณาระบุชื่อ');
                            }
                          },
                          controller: ctrlFirstName,
                          decoration: InputDecoration(
                              prefixIcon: Icon(Icons.person),
                              labelText: 'ชื่อ',
                              labelStyle: TextStyle(fontSize: 15)),
                        ),
                        TextFormField(
                          validator: (value) {
                            if (value.isEmpty) {
                              return ('กรุณาระบุนามสกุล');
                            }
                          },
                          controller: ctrlLastName,
                          decoration: InputDecoration(
                              prefixIcon: Icon(Icons.person_outline),
                              labelText: 'นามสกุล',
                              labelStyle: TextStyle(fontSize: 15)),
                        ),
                        TextFormField(
                          validator: (value) {
                            if (value.isEmpty) {
                              return ('Calendar');
                            }
                          },
                          controller: ctrlBirthDay,
                          decoration: InputDecoration(
                              prefixIcon: Icon(Icons.calendar_today),
                              suffixIcon: IconButton(
                                  icon: Icon(Icons.calendar_today),
                                  onPressed: () {
                                    _showDatePicker();
                                  }),
                              labelText: 'วันเกิด',
                              labelStyle: TextStyle(fontSize: 15)),
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: <Widget>[
                            Text('ssssss'),
                            DropdownButton<Choice>(
                              hint: Text('เพศ'),
                              value: selectedSex,
                              items: choice.map((Choice _sex) {
                                return new DropdownMenuItem<Choice>(
                                  value: _sex,
                                  child: new Text(_sex.title),
                                );
                              }).toList(),
                              onChanged: (value) {
                                print(value.title);
                                setState(() {
                                  selectedSex = value;
                                });
                              },
                            ),
                          ],
                        ),
                        SwitchListTile(
                          value: isActive,
                          title: Text('Active'),
                          onChanged: (bool value) {
                            setState(() {
                              isActive = value;
                            });
                          },
                        )
                      ],
                    )),
              ),
            ),
            SizedBox(
              height: 20,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                FlatButton.icon(
                    onPressed: () {
                      if (_formKey.currentState.validate()) {
                        //save
                      } else {
                        //alert
                      }
                    },
                    icon: Icon(
                      Icons.save,
                      //color: Colors.white,
                    ),
                    label: Text(
                      'บันทึก',
                      //style: TextStyle(color: Colors.white),
                    )),
                FlatButton.icon(
                    onPressed: () {},
                    icon: Icon(
                      Icons.clear,
                      //color: Colors.white,
                    ),
                    label: Text(
                      'ยกเลิก',
                      //style: TextStyle(color: Colors.white),
                    ))
              ],
            )
          ],
        ),
      ),
    );
  }
}

class Choice {
  const Choice({this.title, this.value});

  final String title;
  final int value;
}

const List<Choice> choice = const <Choice>[
  const Choice(title: 'ชาย', value: 1),
  const Choice(title: 'หญิง', value: 2)
];
