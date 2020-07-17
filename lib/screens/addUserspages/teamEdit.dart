import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:hackapp/components/Team.dart';
import 'package:hackapp/screens/addUserspages/teamDetails.dart';
import 'package:hackapp/constants.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:modal_progress_hud/modal_progress_hud.dart';
import 'package:hackapp/components/sizeConfig.dart';

class EditTeam extends StatefulWidget {
  final Team team;
  EditTeam({this.team});
  @override
  _EditTeamState createState() => _EditTeamState(this.team);
}

class _EditTeamState extends State<EditTeam> {
  bool _isInAsyncCall = false;
  Future updateTeam(String id, String name, String bio, List skills) async {
    Map<String, String> headers = {
      "authtoken": "vaibhav",
      "Content-Type": "application/json"
    };
    var response = await http.post(
        "https://hackportal.azurewebsites.net/teams/updateteam/$id",
        headers: headers,
        body: jsonEncode({
          "teamName": name,
          "description": bio,
          "skillsRequired": skills,
        }));
    print(response.body);
    print(response.statusCode);
    return response.statusCode;
  }

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
  var toRemove = [];
  Team team;
  _EditTeamState(this.team);
  _dismissKeyboard(BuildContext context) {
    FocusScope.of(context).requestFocus(new FocusNode());
  }

  void _moveToSignInScreen(BuildContext context) => Navigator.pushReplacement(
      context,
      MaterialPageRoute(builder: (context) => TeamDetails(id: team.teamId)));
  void initState() {
    // TODO: implement initState
    super.initState();
    List userSkills = team.skills;
    print(userSkills);
    for (var i in userSkills) {
      if (i.toString().toLowerCase() == 'Web Development'.toLowerCase()) {
        selectWeb = 1;
      }
      if (i.toString().toLowerCase() == 'App Development'.toLowerCase()) {
        selectMobile = 1;
      }
      if (i.toString().toLowerCase() == 'DevOps'.toLowerCase()) {
        selectDevOps = 1;
      }
      if (i.toString().toLowerCase() == 'Machine Learning'.toLowerCase()) {
        selectML = 1;
      }
      if (i.toString().toLowerCase() ==
          'Artificial Intelligence'.toLowerCase()) {
        selectAI = 1;
      }
      if (i.toString().toLowerCase() == 'Design'.toLowerCase()) {
        selectDesign = 1;
      }
      if (i.toString().toLowerCase() == 'Management'.toLowerCase()) {
        selectManagement = 1;
      }
      if (i.toString().toLowerCase() == 'BlockChain'.toLowerCase()) {
        selectBlock = 1;
      }
      if (i.toString().toLowerCase() == 'CyberSecurity'.toLowerCase()) {
        selectCyber = 1;
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    final name = TextEditingController(text: team.teamName);
    final bio = TextEditingController(text: team.description);
    return GestureDetector(
      onTap: () {
        _dismissKeyboard(context);
      },
      child: WillPopScope(
        onWillPop: () {
          _moveToSignInScreen(context);
        },
        child: Scaffold(
          body: ModalProgressHUD(
            inAsyncCall: _isInAsyncCall,
            opacity: 0.5,
            progressIndicator: SpinKitFoldingCube(
              color: kConstantBlueColor,
            ),
            child: SafeArea(
              child: ListView.builder(
                itemCount: 1,
                itemBuilder: (BuildContext context, int index) => Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Padding(
                      padding: const EdgeInsets.fromLTRB(16, 32, 8, 0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            'Edit your team',
                            style: TextStyle(fontFamily: 'Muli', fontSize: 30),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(right: 16),
                            child: Image(image: AssetImage('images/stc.png'),fit: BoxFit.contain,height: SizeConfig.safeBlockVertical*3.15,),
                          )
                        ],
                      ),
                    ),
                    Container(
                      margin: EdgeInsets.fromLTRB(20, 30, 0, 0),
                      child: Text(
                        'Team Name :',
                        style: TextStyle(color: Colors.black, fontSize: 18),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.fromLTRB(20, 10, 20, 10),
                      child: TextField(
                        style: TextStyle(
                            color: kConstantBlueColor,
                            fontFamily: 'Montserrat',
                            fontSize: 15),
                        controller: name,
                        decoration: kTextFieldDecoration,
                      ),
                    ),
                    Container(
                      margin: EdgeInsets.fromLTRB(20, 10, 0, 0),
                      child: Text(
                        'Project Description :',
                        style: TextStyle(color: Colors.black, fontSize: 18),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.fromLTRB(20, 10, 20, 10),
                      child: TextField(
                        maxLines: 6,
                        style: TextStyle(
                            color: kConstantBlueColor,
                            fontFamily: 'Montserrat',
                            fontSize: 15),
                        controller: bio,
                        decoration: kTextFieldDecoration,
                      ),
                    ),
                    Container(
                      margin: EdgeInsets.fromLTRB(20, 10, 0, 0),
                      child: Text(
                        'Skills:',
                        style: TextStyle(color: Colors.black, fontSize: 18),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.fromLTRB(45, 15, 0, 0),
                      child: Row(
                        children: [
                          GestureDetector(
                            child: Icon(
                              Icons.fiber_manual_record,
                              size: 24,
                              color: selectWeb == 1
                                  ? kConstantBlueColor
                                  : Color(0xffD8D8D8),
                            ),
                            onTap: () {
                              setState(() {
                                if (selectWeb != 1) {
                                  selectWeb = 1;
                                } else {
                                  selectWeb = 0;
                                }
                              });
                            },
                          ),
                          Padding(
                            padding: const EdgeInsets.only(left: 8),
                            child: Container(
                              child: Text(
                                'Web Development',
                                style: TextStyle(fontSize: 18),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.fromLTRB(45, 20, 0, 0),
                      child: Row(
                        children: [
                          GestureDetector(
                            child: Icon(
                              Icons.fiber_manual_record,
                              size: 24,
                              color: selectMobile == 1
                                  ? kConstantBlueColor
                                  : Color(0xffD8D8D8),
                            ),
                            onTap: () {
                              setState(() {
                                if (selectMobile != 1) {
                                  selectMobile = 1;
                                } else {
                                  selectMobile = 0;
                                }
                              });
                            },
                          ),
                          Padding(
                            padding: const EdgeInsets.only(left: 8),
                            child: Container(
                              child: Text('Mobile App Development',
                                  style: TextStyle(fontSize: 18)),
                            ),
                          ),
                        ],
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.fromLTRB(45, 20, 0, 0),
                      child: Row(
                        children: [
                          GestureDetector(
                            child: Icon(
                              Icons.fiber_manual_record,
                              size: 24,
                              color: selectDevOps == 1
                                  ? kConstantBlueColor
                                  : Color(0xffD8D8D8),
                            ),
                            onTap: () {
                              setState(() {
                                if (selectDevOps != 1) {
                                  selectDevOps = 1;
                                } else {
                                  selectDevOps = 0;
                                }
                              });
                            },
                          ),
                          Padding(
                            padding: const EdgeInsets.only(left: 8),
                            child: Container(
                              child:
                                  Text('Devops', style: TextStyle(fontSize: 18)),
                            ),
                          ),
                        ],
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.fromLTRB(45, 20, 0, 0),
                      child: Row(
                        children: [
                          GestureDetector(
                            child: Icon(
                              Icons.fiber_manual_record,
                              size: 24,
                              color: selectML == 1
                                  ? kConstantBlueColor
                                  : Color(0xffD8D8D8),
                            ),
                            onTap: () {
                              setState(() {
                                if (selectML != 1) {
                                  selectML = 1;
                                } else {
                                  selectML = 0;
                                }
                              });
                            },
                          ),
                          Padding(
                            padding: const EdgeInsets.only(left: 8),
                            child: Container(
                              child: Text('Machine Learning',
                                  style: TextStyle(fontSize: 18)),
                            ),
                          ),
                        ],
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.fromLTRB(45, 20, 0, 0),
                      child: Row(
                        children: [
                          GestureDetector(
                            child: Icon(
                              Icons.fiber_manual_record,
                              size: 24,
                              color: selectAI == 1
                                  ? kConstantBlueColor
                                  : Color(0xffD8D8D8),
                            ),
                            onTap: () {
                              setState(() {
                                if (selectAI != 1) {
                                  selectAI = 1;
                                } else {
                                  selectAI = 0;
                                }
                              });
                            },
                          ),
                          Padding(
                            padding: const EdgeInsets.only(left: 8),
                            child: Container(
                              child: Text('Artificial Intelligence',
                                  style: TextStyle(fontSize: 18)),
                            ),
                          ),
                        ],
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.fromLTRB(45, 20, 0, 0),
                      child: Row(
                        children: [
                          GestureDetector(
                            child: Icon(
                              Icons.fiber_manual_record,
                              size: 24,
                              color: selectDesign == 1
                                  ? kConstantBlueColor
                                  : Color(0xffD8D8D8),
                            ),
                            onTap: () {
                              setState(() {
                                if (selectDesign != 1) {
                                  selectDesign = 1;
                                } else {
                                  selectDesign = 0;
                                }
                              });
                            },
                          ),
                          Padding(
                            padding: const EdgeInsets.only(left: 8),
                            child: Container(
                              child: Text('Design - UI/UX',
                                  style: TextStyle(fontSize: 18)),
                            ),
                          ),
                        ],
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.fromLTRB(45, 20, 0, 0),
                      child: Row(
                        children: [
                          GestureDetector(
                            child: Icon(
                              Icons.fiber_manual_record,
                              size: 24,
                              color: selectManagement == 1
                                  ? kConstantBlueColor
                                  : Color(0xffD8D8D8),
                            ),
                            onTap: () {
                              setState(() {
                                if (selectManagement != 1) {
                                  selectManagement = 1;
                                } else {
                                  selectManagement = 0;
                                }
                              });
                            },
                          ),
                          Padding(
                            padding: const EdgeInsets.only(left: 8),
                            child: Container(
                              child: Text('Management skills',
                                  style: TextStyle(fontSize: 18)),
                            ),
                          ),
                        ],
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.fromLTRB(45, 20, 0, 0),
                      child: Row(
                        children: [
                          GestureDetector(
                            child: Icon(
                              Icons.fiber_manual_record,
                              size: 24,
                              color: selectBlock == 1
                                  ? kConstantBlueColor
                                  : Color(0xffD8D8D8),
                            ),
                            onTap: () {
                              setState(() {
                                if (selectBlock != 1) {
                                  selectBlock = 1;
                                } else {
                                  selectBlock = 0;
                                }
                              });
                            },
                          ),
                          Padding(
                            padding: const EdgeInsets.only(left: 8),
                            child: Container(
                              child: Text('Blockchain',
                                  style: TextStyle(fontSize: 18)),
                            ),
                          ),
                        ],
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.fromLTRB(45, 20, 0, 0),
                      child: Row(
                        children: [
                          GestureDetector(
                            child: Icon(
                              Icons.fiber_manual_record,
                              size: 24,
                              color: selectCyber == 1
                                  ? kConstantBlueColor
                                  : Color(0xffD8D8D8),
                            ),
                            onTap: () {
                              setState(() {
                                if (selectCyber != 1) {
                                  selectCyber = 1;
                                } else {
                                  selectCyber = 0;
                                }
                              });
                            },
                          ),
                          Padding(
                            padding: const EdgeInsets.only(left: 8),
                            child: Container(
                              child: Text('CyberSecurity',
                                  style: TextStyle(fontSize: 18)),
                            ),
                          ),
                        ],
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.fromLTRB(0, 24, 24, 8),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(right: 16),
                            child: RaisedButton(
                              onPressed: () {
                                Navigator.pushReplacement(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) =>
                                            TeamDetails(id: team.teamId)));
                              },
                              child: Text('Cancel',style: TextStyle(color: kConstantBlueColor,fontFamily: 'Montserrat'),),
                              color: Colors.white,
                              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(4),side: BorderSide(color: kConstantBlueColor)),
                            ),
                          ),
                          RaisedButton(
                            onPressed: () async {
                              setState(() {
                                _isInAsyncCall=true;
                              });
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
                                  if (i == 'App Development') {
                                    count += 1;
                                  }
                                }
                                if (count == 0) {
                                  skillList.add('App Development');
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
                                  if (i == 'Design') {
                                    count += 1;
                                  }
                                }
                                if (count == 0) {
                                  skillList.add('Design');
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
                                  if (i == 'App Development') {
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
                                  if (i == 'Design') {
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
                              skillList.removeWhere((e) => toRemove.contains(e));
                              if (await updateTeam(team.teamId, name.text,
                                      bio.text, skillList) ==
                                  200) {
                                setState(() {
                                  _isInAsyncCall=false;
                                });
                                Navigator.pushReplacement(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) =>
                                            TeamDetails(id: team.teamId)));
                              } else {
                                setState(() {
                                  _isInAsyncCall=false;
                                });
                                final snackBar = SnackBar(
                                  backgroundColor: kConstantBlueColor,
                                  content: Text(
                                    'Error.Please try again later',
                                    style: TextStyle(color: Colors.white),
                                  ),
                                  action:
                                      SnackBarAction(label: '', onPressed: () {}),
                                );
                                Scaffold.of(context).showSnackBar(snackBar);
                              }
                              ;
                            },
                            child: Text(
                              'Confirm',
                              style: TextStyle(color: Colors.white,fontFamily: 'Montserrat'),
                            ),
                            color: kConstantBlueColor,
                            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(4)),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
