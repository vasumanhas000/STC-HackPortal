import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:hackapp/constants.dart';
import 'package:hackapp/screens/teamsPages/teamDetails.dart';
import 'package:modal_progress_hud/modal_progress_hud.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class InviteCRUD extends StatefulWidget {
  var user;
  final String id;
  InviteCRUD({this.user,this.id});
  @override
  _InviteCRUDState createState() => _InviteCRUDState(this.user,this.id);
}

class _InviteCRUDState extends State<InviteCRUD> {
  final _auth = FirebaseAuth.instance;
  String Token;
  Future cancelInvite(String id,String userID)async{
    FirebaseUser user = await _auth.currentUser();
    Token= await user.getIdToken().then((result) {
      String token = result.token;
      return token;
    });
    Map<String, String> headers = {"authtoken": Token,"Content-Type": "application/json"};
    var response = await http.post(
        "$kBaseUrl/teams/cancelinvite",
        headers: headers,body: jsonEncode({
      "teamId":id,
      "inviteeId":userID,
    }));
    print(response.statusCode);
    print(response.body);
    return response.statusCode;
  }
  var user;
  String id;
  bool _isInAsyncCall = false;
  _InviteCRUDState(this.user,this.id);
  void _moveToSignInScreen(BuildContext context) =>
      Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=>TeamDetails(id: id,)));
  @override
  Widget build(BuildContext context) {
    print(user);
    return WillPopScope(
      onWillPop: (){
        _moveToSignInScreen(context);
      },
      child: ModalProgressHUD(
        inAsyncCall: _isInAsyncCall,
        opacity: 0.5,
        progressIndicator: SpinKitFoldingCube(
          color: kConstantBlueColor,
        ),
        child: Scaffold(
          body: SafeArea(child: ListView.builder(
            physics: AlwaysScrollableScrollPhysics(),
            itemCount: 1,
            itemBuilder: (BuildContext context, int index) =>
             Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: EdgeInsets.fromLTRB(22,24,0,0),
                  child: Text('Profile',style: TextStyle(fontSize: 30,fontWeight: FontWeight.w600,fontFamily: 'Muli'),),
                ),
                Padding(
                  padding: const EdgeInsets.fromLTRB(22, 30, 0, 0),
                  child: Text(
                    'Name :',
                    style: TextStyle(fontSize: 20,fontWeight: FontWeight.w600),
                  ),
                ),
                Padding(padding: EdgeInsets.fromLTRB(22, 5, 8, 0),
                  child: FittedBox(child: Text(user['name'],style: TextStyle(fontSize: 16,fontWeight: FontWeight.w500),)),
                ),
                Padding(
                  padding: const EdgeInsets.fromLTRB(22, 25, 0, 0),
                  child: Text(
                    'Email :',
                    style: TextStyle(color: kConstantBlueColor, fontSize: 20,fontWeight: FontWeight.w600),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.fromLTRB(22, 5, 8, 0),
                  child: FittedBox(
                    child: Text(
                      user['email'],
                      style: TextStyle(fontSize: 16,),
                    ),
                    fit: BoxFit.contain,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.fromLTRB(22, 25, 0, 0),
                  child: Text(
                    'University Name:',
                    style: TextStyle( fontSize: 20,fontWeight: FontWeight.w600),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.fromLTRB(22, 5, 8, 0),
                  child: FittedBox(
                    child: Text(
                      user['college'],
                      style: TextStyle(fontSize: 16),
                    ),
                    fit: BoxFit.contain,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.fromLTRB(22, 25, 0, 0),
                  child: Text(
                    'Year of graduation',
                    style: TextStyle(fontSize: 20,fontWeight: FontWeight.w600),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.fromLTRB(22, 5, 8, 0),
                  child: FittedBox(
                    child: Text(
                      user['expectedGraduation'],
                      style: TextStyle(fontSize: 16),
                    ),
                    fit: BoxFit.contain,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.fromLTRB(22, 25, 8, 0),
                  child: Text(
                    'Description:',
                    style: TextStyle(fontSize: 20,fontWeight: FontWeight.w600),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.fromLTRB(22, 5, 8, 0),
                  child: Text(
                    user['bio'],
                    style: TextStyle(fontSize: 16),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.fromLTRB(22, 25, 0, 0),
                  child: Text(
                    'Skills:',
                    style: TextStyle(fontSize: 20,fontWeight: FontWeight.w600),
                  ),
                ),
                ListView.builder(
                    itemCount: user["skills"].length,
                    physics: NeverScrollableScrollPhysics(),
                    shrinkWrap: true,
                    itemBuilder: (BuildContext context, int index) {
                      if (user["skills"].length == 0) {
                        return Padding(
                          padding: const EdgeInsets.fromLTRB(20, 10, 0, 0),
                          child: Text('No Skills'),
                        );
                      } else {
                        return Padding(
                          padding: const EdgeInsets.fromLTRB(22, 8, 0, 0),
                          child: Text(
                            user['skills'][index],
                            style: TextStyle(fontSize: 16),
                          ),
                        );
                      }
                    }),
                Padding(
                  padding: const EdgeInsets.fromLTRB(0,32,16,0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      ButtonTheme(
                        minWidth: 100,
                        height: 38,
                        child: FlatButton(onPressed: ()async{
                          setState(() {
                            _isInAsyncCall=true;
                          });
                          if(await cancelInvite(id, user['_id'])==200){
                            setState(() {
                              _isInAsyncCall=false;
                            });
                            Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=>TeamDetails(id: id,)));
                          }
                        },child: Text('Cancel Invite',style: TextStyle(color: Colors.white,fontFamily: 'Montserrat',fontSize: 16,fontWeight: FontWeight.w500),),color: kConstantBlueColor,shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(4)),),
                      )
                    ],
                  ),
                ),
              ],
            ),
          ),),
        ),
      ),
    );
  }
}
