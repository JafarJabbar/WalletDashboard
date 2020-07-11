import 'package:flutter/material.dart';

class StackStructure extends StatefulWidget {
  @override
  _StackStructureState createState() => _StackStructureState();
}

class _StackStructureState extends State<StackStructure> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Color(0xFF333340),
        body: Stack(
          children: <Widget>[
            createMenu(context),
          createDahsboard(context)
          ],
        ),
      ),
    );
  }

  Widget createMenu(BuildContext context) {
    TextStyle textStyle=TextStyle(color: Colors.white,fontSize: 14,fontFamily: 'Montserrat',fontWeight: FontWeight.w400,letterSpacing: 1);

    return
      Align(
        alignment: Alignment.centerLeft,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
              Container(
                padding: EdgeInsets.all(10),
                child: Row(
                  children: <Widget>[
                    Icon(Icons.account_balance_wallet,color: Colors.white,),
                    SizedBox(width: 10,),
                    Text('Dashboard',style: textStyle,)
                  ],
                ),
              ),
              Container(
                padding: EdgeInsets.all(10),
                child: Row(
                  children: <Widget>[
                    Icon(Icons.mail_outline,color: Colors.white,),
                    SizedBox(width: 10,),
                    Text('Messages',style: textStyle,)
                  ],
                ),
              ),
              Container(
                padding: EdgeInsets.all(10),
                child: Row(
                  children: <Widget>[
                    Icon(Icons.assignment,color: Colors.white,),
                    SizedBox(width: 10,),
                    Text('Utility Bills',style: textStyle,)
                  ],
                ),
              ),
              Container(
                padding: EdgeInsets.all(10),
                child: Row(
                  children: <Widget>[
                    Icon(Icons.compare_arrows,color: Colors.white,),
                    SizedBox(width: 10,),
                    Text('Funds transfer',style: textStyle,)
                  ],
                ),
              ),
              Container(
                padding: EdgeInsets.all(10),
                child: Row(
                  children: <Widget>[
                    Icon(Icons.business,color: Colors.white,),
                    SizedBox(width: 10,),
                    Text('Branches',style: textStyle,)
                  ],
                ),
              ),
          ],
        ),
      );
  }

  Widget createDahsboard(BuildContext context) {
    return
      Material(
        elevation: 8,
        child: Container(
          color: Color(0xFF333340),
          padding: EdgeInsets.all(10),
          child: Column(
            children: <Widget>[
              Container(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    Icon(Icons.menu,color: Colors.white70,),
                    Text("My cards",style: TextStyle(color: Colors.white70,fontSize: 16),),
                    Icon(Icons.add_circle_outline,color: Colors.white70,)
                  ],
                ),
              )
            ],
          ),
        ),
      );
  }

}
