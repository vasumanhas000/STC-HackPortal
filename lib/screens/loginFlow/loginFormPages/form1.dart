import 'package:flutter/material.dart';
import 'package:hackapp/constants.dart';
import 'form2.dart';

class Form1 extends StatefulWidget {
  final String name, college, year;
  Form1({this.name, this.college, this.year});
  @override
  _Form1State createState() => _Form1State(this.name, this.college, this.year);
}

class _Form1State extends State<Form1> {
  _Form1State(this.name, this.college, this.year);
  String bio = '', name, year, college;
  List toRemove = [];
  int selectWeb,
      selectMobile,
      selectDevOps,
      selectML,
      selectAI,
      selectDesign,
      selectManagement,
      selectBlock,
      selectCyber;
  List skillList = [];
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: ListView.builder(
            itemCount: 1,
            itemBuilder: (BuildContext context, int index) {
              return Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Hero(
                    tag: 'Heading',
                    child: Material(
                      color: Colors.transparent,
                      child: Padding(
                        padding: const EdgeInsets.fromLTRB(15, 15, 0, 30),
                        child: Container(
                          child: Text(
                            'Complete your profile',
                            style: TextStyle(
                                fontFamily: 'Muli',
                                fontSize: 30,
                                fontWeight: FontWeight.w600),
                          ),
                        ),
                      ),
                    ),
                  ),
                  Hero(
                    tag: 'Icons',
                    child: Padding(
                      padding: const EdgeInsets.only(bottom: 35),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Image(
                            image: AssetImage('images/1filled.png'),
                            height: 45,
                          ),
                          Image(
                            image: AssetImage('images/blueLine.png'),
                          ),
                          Image(
                            image: AssetImage('images/2unfilled.png'),
                            height: 45,
                          ),
                          Image(
                            image: AssetImage('images/blueLine.png'),
                            color: Colors.white,
                          ),
                          Image(
                            image: AssetImage('images/3unfilled.png'),
                            height: 45,
                          ),
                        ],
                      ),
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.fromLTRB(20, 0, 0, 30),
                    child: FittedBox(
                      fit: BoxFit.contain,
                      child: Text(
                        'Skills',
                        style: TextStyle(
                          fontSize: 30,
                          fontWeight: FontWeight.normal,
                        ),
                      ),
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.fromLTRB(20, 13, 0, 0),
                    child: Text(
                      'Brief description about yourself:',
                      style: kHeadingTextStyle,
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.fromLTRB(20, 10, 20, 10),
                    child: TextField(
                      style: kFieldTextStyle,
                      onChanged: (val) {
                        setState(() {
                          bio = val;
                        });
                      },
                      maxLines: 7,
                      decoration: kBigTextFieldDecoration,
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.fromLTRB(20, 13, 0, 0),
                    child: Text(
                      'Your Skills:',
                      style: kHeadingTextStyle,
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.fromLTRB(45, 15, 0, 0),
                    child: InkWell(
                        onTap: () {
                          setState(() {
                            if (selectWeb != 1) {
                              selectWeb = 1;
                            } else {
                              selectWeb = 0;
                            }
                          });
                        },
                        child: Row(
                          children: [
                            Icon(
                              Icons.fiber_manual_record,
                              size: 24,
                              color: selectWeb == 1
                                  ? kConstantBlueColor
                                  : Color(0xffD8D8D8),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(left: 8),
                              child: Container(
                                child: Text(
                                  'Web Development',
                                  style: kFieldTextStyle,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  Padding(
                    padding: const EdgeInsets.fromLTRB(45, 15, 0, 0),
                    child: InkWell(
                        onTap: () {
                          setState(() {
                            if (selectMobile != 1) {
                              selectMobile = 1;
                            } else {
                              selectMobile = 0;
                            }
                          });
                        },
                        child: Row(
                          children: [
                            Icon(
                              Icons.fiber_manual_record,
                              size: 24,
                              color: selectMobile == 1
                                  ? kConstantBlueColor
                                  : Color(0xffD8D8D8),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(left: 8),
                              child: Container(
                                child: Text('Mobile App Development',
                                    style: kFieldTextStyle),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  Padding(
                    padding: const EdgeInsets.fromLTRB(45, 15, 0, 0),
                    child: InkWell(
                        onTap: () {
                          setState(() {
                            if (selectDevOps != 1) {
                              selectDevOps = 1;
                            } else {
                              selectDevOps = 0;
                            }
                          });
                        },
                        child: Row(
                          children: [
                            Icon(
                              Icons.fiber_manual_record,
                              size: 24,
                              color: selectDevOps == 1
                                  ? kConstantBlueColor
                                  : Color(0xffD8D8D8),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(left: 8),
                              child: Container(
                                child: Text('Devops', style: kFieldTextStyle),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  Padding(
                    padding: const EdgeInsets.fromLTRB(45, 15, 0, 0),
                    child: InkWell(
                        onTap: () {
                          setState(() {
                            if (selectML != 1) {
                              selectML = 1;
                            } else {
                              selectML = 0;
                            }
                          });
                        },
                        child: Row(
                          children: [
                            Icon(
                              Icons.fiber_manual_record,
                              size: 24,
                              color: selectML == 1
                                  ? kConstantBlueColor
                                  : Color(0xffD8D8D8),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(left: 8),
                              child: Container(
                                child: Text('Machine Learning',
                                    style: kFieldTextStyle),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  Padding(
                    padding: const EdgeInsets.fromLTRB(45, 15, 0, 0),
                    child: InkWell(
                        onTap: () {
                          setState(() {
                            if (selectAI != 1) {
                              selectAI = 1;
                            } else {
                              selectAI = 0;
                            }
                          });
                        },
                        child: Row(
                          children: [
                            Icon(
                              Icons.fiber_manual_record,
                              size: 24,
                              color: selectAI == 1
                                  ? kConstantBlueColor
                                  : Color(0xffD8D8D8),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(left: 8),
                              child: Container(
                                child: Text('Artificial Intelligence',
                                    style: kFieldTextStyle),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  Padding(
                    padding: const EdgeInsets.fromLTRB(45, 15, 0, 0),
                    child: InkWell(
                        onTap: () {
                          setState(() {
                            if (selectDesign != 1) {
                              selectDesign = 1;
                            } else {
                              selectDesign = 0;
                            }
                          });
                        },
                        child: Row(
                          children: [
                            Icon(
                              Icons.fiber_manual_record,
                              size: 24,
                              color: selectDesign == 1
                                  ? kConstantBlueColor
                                  : Color(0xffD8D8D8),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(left: 8),
                              child: Container(
                                child:
                                    Text('Design - UI/UX', style: kFieldTextStyle),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  Padding(
                    padding: const EdgeInsets.fromLTRB(45, 15, 0, 0),
                    child: InkWell(
                        onTap: () {
                          setState(() {
                            if (selectManagement != 1) {
                              selectManagement = 1;
                            } else {
                              selectManagement = 0;
                            }
                          });
                        },
                        child: Row(
                          children: [
                            Icon(
                              Icons.fiber_manual_record,
                              size: 24,
                              color: selectManagement == 1
                                  ? kConstantBlueColor
                                  : Color(0xffD8D8D8),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(left: 8),
                              child: Container(
                                child: Text('Management skills',
                                    style: kFieldTextStyle),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  Padding(
                    padding: const EdgeInsets.fromLTRB(45, 15, 0, 0),
                    child: InkWell(
                          onTap: () {
                          setState(() {
                            if (selectBlock != 1) {
                              selectBlock = 1;
                            } else {
                              selectBlock = 0;
                            }
                          });
                        },
                        child: Row(
                          children: [
                            Icon(
                              Icons.fiber_manual_record,
                              size: 24,
                              color: selectBlock == 1
                                  ? kConstantBlueColor
                                  : Color(0xffD8D8D8),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(left: 8),
                              child: Container(
                                child: Text('Blockchain', style: kFieldTextStyle),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  Padding(
                    padding: const EdgeInsets.fromLTRB(45, 15, 0, 0),
                    child: InkWell(
                        onTap: () {
                          setState(() {
                            if (selectCyber != 1) {
                              selectCyber = 1;
                            } else {
                              selectCyber = 0;
                            }
                          });
                        },
                        child: Row(
                          children: [
                            Icon(
                              Icons.fiber_manual_record,
                              size: 24,
                              color: selectCyber == 1
                                  ? kConstantBlueColor
                                  : Color(0xffD8D8D8),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(left: 8),
                              child: Container(
                                child:
                                    Text('CyberSecurity', style: kFieldTextStyle),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  Hero(
                    tag: 'BottomIcon',
                    child: Material(
                      color: Colors.transparent,
                      child: Padding(
                        padding: const EdgeInsets.fromLTRB(0, 24, 24, 8),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            GestureDetector(
                              onTap: () async {
                                if (bio == '') {
                                  final snackBar = SnackBar(
                                    content: Text(
                                      'All fields are mandatory.',
                                      style: TextStyle(
                                          color: Colors.white,
                                          fontFamily: 'Montserrat'),
                                    ),
                                    backgroundColor: kConstantBlueColor,
                                  );
                                  await Scaffold.of(context)
                                      .showSnackBar(snackBar);
                                } else {
                                  if (selectWeb == 1) {
                                    var count = 0;
                                    for (var i in skillList) {
                                      if (i == 'Web Development') {
                                        count += 1;
                                      }
                                    }
                                    if (count == 0) {
                                      skillList.add('Web Development');
                                    }
                                  }
                                  if (selectMobile == 1) {
                                    var count = 0;
                                    for (var i in skillList) {
                                      if (i == 'Mobile App Development') {
                                        count += 1;
                                      }
                                    }
                                    if (count == 0) {
                                      skillList.add('Mobile App Development');
                                    }
                                  }
                                  if (selectDevOps == 1) {
                                    var count = 0;
                                    for (var i in skillList) {
                                      if (i == 'DevOps') {
                                        count += 1;
                                      }
                                    }
                                    if (count == 0) {
                                      skillList.add('DevOps');
                                    }
                                  }
                                  if (selectML == 1) {
                                    var count = 0;
                                    for (var i in skillList) {
                                      if (i == 'Machine Learning') {
                                        count += 1;
                                      }
                                    }
                                    if (count == 0) {
                                      skillList.add('Machine Learning');
                                    }
                                  }
                                  if (selectAI == 1) {
                                    var count = 0;
                                    for (var i in skillList) {
                                      if (i == 'Artificial Intelligence') {
                                        count += 1;
                                      }
                                    }
                                    if (count == 0) {
                                      skillList.add('Artificial Intelligence');
                                    }
                                  }
                                  if (selectDesign == 1) {
                                    var count = 0;
                                    for (var i in skillList) {
                                      if (i == 'Design-ui/ux') {
                                        count += 1;
                                      }
                                    }
                                    if (count == 0) {
                                      skillList.add('Design - ui/ux');
                                    }
                                  }
                                  if (selectManagement == 1) {
                                    var count = 0;
                                    for (var i in skillList) {
                                      if (i == 'Management') {
                                        count += 1;
                                      }
                                    }
                                    if (count == 0) {
                                      skillList.add('Management');
                                    }
                                  }
                                  if (selectBlock == 1) {
                                    var count = 0;
                                    for (var i in skillList) {
                                      if (i == 'BlockChain') {
                                        count += 1;
                                      }
                                    }
                                    if (count == 0) {
                                      skillList.add('BlockChain');
                                    }
                                  }
                                  if (selectCyber == 1) {
                                    var count = 0;
                                    for (var i in skillList) {
                                      if (i == 'CyberSecurity') {
                                        count += 1;
                                      }
                                    }
                                    if (count == 0) {
                                      skillList.add('CyberSecurity');
                                    }
                                  }
                                  if (selectWeb != 1) {
                                    for (var i in skillList) {
                                      if (i == 'Web Development') {
                                        toRemove.add(i);
                                      }
                                    }
                                  }
                                  if (selectMobile != 1) {
                                    for (var i in skillList) {
                                      if (i == 'Mobile App Development') {
                                        toRemove.add(i);
                                      }
                                    }
                                  }
                                  if (selectDevOps != 1) {
                                    for (var i in skillList) {
                                      if (i == 'DevOps') {
                                        toRemove.add(i);
                                      }
                                    }
                                  }
                                  if (selectML != 1) {
                                    for (var i in skillList) {
                                      if (i == 'Machine Learning') {
                                        toRemove.add(i);
                                      }
                                    }
                                  }
                                  if (selectAI != 1) {
                                    for (var i in skillList) {
                                      if (i == 'Artificial Intelligence') {
                                        toRemove.add(i);
                                      }
                                    }
                                  }
                                  if (selectDesign != 1) {
                                    for (var i in skillList) {
                                      if (i == 'Design - ui/ux') {
                                        toRemove.add(i);
                                      }
                                    }
                                  }
                                  if (selectManagement != 1) {
                                    for (var i in skillList) {
                                      if (i == 'Management') {
                                        toRemove.add(i);
                                      }
                                    }
                                  }
                                  if (selectBlock != 1) {
                                    for (var i in skillList) {
                                      if (i == 'BlockChain') {
                                        toRemove.add(i);
                                      }
                                    }
                                  }
                                  if (selectCyber != 1) {
                                    for (var i in skillList) {
                                      if (i == 'CyberSecurity') {
                                        toRemove.add(i);
                                      }
                                    }
                                  }
                                  skillList
                                      .removeWhere((e) => toRemove.contains(e));
                                  Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) => Form2(
                                                name: name,
                                                college: college,
                                                year: year,
                                                bio: bio,
                                                skillList: skillList,
                                              )));
                                }
                              },
                              child: Container(
                                height: 50,
                                width: 50,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(40),
                                  color: kConstantBlueColor,
                                ),
                                child: Icon(
                                  Icons.arrow_forward,
                                  color: Colors.white,
                                  size: 28,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ],
              );
            }),
      ),
    );
  }
}
