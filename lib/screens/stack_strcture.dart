import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class StackStructure extends StatefulWidget {
  @override
  _StackStructureState createState() => _StackStructureState();
}

class _StackStructureState extends State<StackStructure> with SingleTickerProviderStateMixin {
  double elementWidth, elementHeight;
  bool isMenuOpen = false;
  AnimationController _controller;
  Animation<double> _scaleController;
  Animation<double> _scaleMenuController;
  Animation<Offset> _offsetMenuController;
  Duration _duration=Duration(milliseconds: 400);

  @override
  void initState() {
    super.initState();
    _controller=AnimationController(vsync: this,duration: _duration);
    _scaleController=Tween(begin: 1.0,end: 0.7).animate(_controller);
    _scaleMenuController=Tween(begin: 0.0,end: 1.0).animate(_controller);
    _offsetMenuController=Tween(begin:Offset(-1,0),end: Offset(0,0)).animate(_controller);
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        bottomNavigationBar: BottomNavigationBar(
          backgroundColor: Color(0xFF333340),
          selectedItemColor: Color(0xFF3881FC),
          unselectedItemColor: Colors.white,
          items: const <BottomNavigationBarItem>[
            BottomNavigationBarItem(
              icon: Icon(Icons.add),
              title: Text('Add payment'),
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.business),
              title: Text('Business'),
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.school),
              title: Text('School'),
            ),
          ],
        ),        backgroundColor: Color(0xFF333340),
        body: Stack(
          children: <Widget>[createMenu(context), createDashboard(context)],
        ),
      ),
    );
  }

  Widget createMenu(BuildContext context) {
    TextStyle textStyle = TextStyle(
        color: Colors.white,
        fontSize: 14,
        fontFamily: 'Montserrat',
        fontWeight: FontWeight.w400,
        letterSpacing: 1);

    return Align(
      alignment: Alignment.centerLeft,
      child: SlideTransition(
        position: _offsetMenuController,
        child: ScaleTransition(
          scale: _scaleMenuController,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Container(
                width: 200,
                padding: EdgeInsets.all(10),
                margin: EdgeInsets.only(right: 150),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Container(
                      width: 100,
                      height: 100,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(50),
                        color: Colors.white
                      ),
                      child: Icon(Icons.person,size: 80,),
                    ),
                    SizedBox(height: 10,),
                    Text("Jabbarli Jafar",style: TextStyle(color: Colors.white) ,),
                    SizedBox(height: 10,),
                    Text("San Francisco, CA",style: TextStyle(color: Colors.white.withOpacity(.6)) ,),
                    SizedBox(height: 10,),

                  ],
                ),
              ),
            Container(
              padding: EdgeInsets.only(left: 20),
              child: Column(
                children: <Widget>[
                  Container(
                    padding: EdgeInsets.all(10),
                    child: Row(
                      children: <Widget>[
                        Icon(
                          Icons.account_balance_wallet,
                          color: Colors.white,
                        ),
                        SizedBox(
                          width: 10,
                        ),
                        Text(
                          'Dashboard',
                          style: textStyle,
                        )
                      ],
                    ),
                  ),
                  Container(
                    padding: EdgeInsets.all(10),
                    child: Row(
                      children: <Widget>[
                        Icon(
                          Icons.mail_outline,
                          color: Colors.white,
                        ),
                        SizedBox(
                          width: 10,
                        ),
                        Text(
                          'Messages',
                          style: textStyle,
                        )
                      ],
                    ),
                  ),
                  Container(
                    padding: EdgeInsets.all(10),
                    child: Row(
                      children: <Widget>[
                        Icon(
                          Icons.assignment,
                          color: Colors.white,
                        ),
                        SizedBox(
                          width: 10,
                        ),
                        Text(
                          'Utility Bills',
                          style: textStyle,
                        )
                      ],
                    ),
                  ),
                  Container(
                    padding: EdgeInsets.all(10),
                    child: Row(
                      children: <Widget>[
                        Icon(
                          Icons.compare_arrows,
                          color: Colors.white,
                        ),
                        SizedBox(
                          width: 10,
                        ),
                        Text(
                          'Funds transfer',
                          style: textStyle,
                        )
                      ],
                    ),
                  ),
                  Container(
                    padding: EdgeInsets.all(10),
                    child: Row(
                      children: <Widget>[
                        Icon(
                          Icons.business,
                          color: Colors.white,
                        ),
                        SizedBox(
                          width: 10,
                        ),
                        Text(
                          'Branches',
                          style: textStyle,
                        )
                      ],
                    ),
                  ),
                  SizedBox(height: 140,),
                  Container(
                    padding: EdgeInsets.all(10),
                    child: Row(
                      children: <Widget>[
                        Icon(
                          Icons.exit_to_app,
                          color: Colors.white,
                        ),
                        SizedBox(
                          width: 10,
                        ),
                        Text(
                          'Logout',
                          style: textStyle,
                        )
                      ],
                    ),
                  ),
                ],
              ),
            )
            ],
          ),
        ),
      ),
    );
  }

  Widget createDashboard(BuildContext context) {
    elementWidth = MediaQuery.of(context).size.width;
    elementHeight = MediaQuery.of(context).size.height;
    TextStyle balance=TextStyle(fontSize: 12,color: Colors.white.withOpacity(0.7));
    TextStyle number=TextStyle(fontSize: 22,color: Colors.white);
    TextStyle text=TextStyle(fontSize: 16,color: Colors.white);
    return AnimatedPositioned(
      duration: _duration,
      top: 0,
      bottom: 0,
      left: isMenuOpen ? 0.4 * elementWidth:0,
      right: isMenuOpen ? -0.4 * elementWidth:0,
      child:    ScaleTransition(
        scale:  _scaleController,
        child: Material(
          borderRadius: BorderRadius.circular(20),
          elevation: 8,
          child: Container(
            color: Color(0xFF333340),
            padding: EdgeInsets.all(10),
            child: Column(
              children: <Widget>[
                Container(
                  padding: EdgeInsets.all(15),
                  color: Color(0xFF272730),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      InkWell(
                          onTap: () {
                            setState(() {
                              !isMenuOpen ? _controller.forward() : _controller.reverse();
                              isMenuOpen=!isMenuOpen;

                            });
                          },
                          child:
                            changeIcon()
                      ),
                      Text(
                        "My cards",
                        style: TextStyle(color: Colors.white70, fontSize: 16),
                      ),
                      Icon(
                        Icons.add_circle_outline,
                        color: Colors.white70,
                      )
                    ],
                  ),
                ),
                Container(
                  height: 200,
                  margin: EdgeInsets.only(top: 10),
                  child: PageView(
                    children: <Widget>[
                      Container(
                        margin: EdgeInsets.all(8),
                        width: 100,
                        decoration: BoxDecoration(
                          color: Color(0xFF3881FC),
                          borderRadius: BorderRadius.circular(15)
                        ),
                        child: Padding(
                          padding: const EdgeInsets.all(15.0),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: <Widget>[
                              Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: <Widget>[
                                  Column(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: <Widget>[
                                      Text("Current Balance" ,style: balance,),
                                      SizedBox(height: 10,),
                                      Text("\$ 12.432.32" ,style: number,),

                                    ],
                                  ),
                                  Text("BankX",style: TextStyle(color: Colors.white,fontWeight: FontWeight.bold),)
                                ],
                              ),
                              Text("****   ****   ****   1505",style: number,),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                crossAxisAlignment: CrossAxisAlignment.end,
                                children: <Widget>[
                                  Column(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: <Widget>[
                                      Text("Card holder" ,style: balance,),
                                      SizedBox(height: 5,),
                                      Text("Laurel Bailey" ,style: text,),

                                    ],
                                  ),
                                  Column(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: <Widget>[
                                      Text("Expires date" ,style: balance,),
                                      SizedBox(height: 5,),
                                      Text("05 / 20" ,style: text,),

                                    ],
                                  ),
                                  Icon(Icons.all_inclusive,color: Colors.white,)
                                ],
                              ),
                            ],
                          ),
                        ),
                      ),
                      Container(
                        margin: EdgeInsets.all(8),
                        width: 100,
                        decoration: BoxDecoration(
                          color: Color(0xFF3881FC),
                          borderRadius: BorderRadius.circular(15)
                        ),
                        child: Padding(
                          padding: const EdgeInsets.all(15.0),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: <Widget>[
                              Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: <Widget>[
                                  Column(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: <Widget>[
                                      Text("Current Balance" ,style: balance,),
                                      SizedBox(height: 10,),
                                      Text("\$ 12.432.32" ,style: number,),

                                    ],
                                  ),
                                  Text("BankX",style: TextStyle(color: Colors.white,fontWeight: FontWeight.bold),)
                                ],
                              ),
                              Text("****   ****   ****   1505",style: number,),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                crossAxisAlignment: CrossAxisAlignment.end,
                                children: <Widget>[
                                  Column(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: <Widget>[
                                      Text("Card holder" ,style: balance,),
                                      SizedBox(height: 5,),
                                      Text("Laurel Bailey" ,style: text,),

                                    ],
                                  ),
                                  Column(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: <Widget>[
                                      Text("Expires date" ,style: balance,),
                                      SizedBox(height: 5,),
                                      Text("05 / 20" ,style: text,),

                                    ],
                                  ),
                                  Icon(Icons.all_inclusive,color: Colors.white,)
                                ],
                              ),
                            ],
                          ),
                        ),
                      ),
                      Container(
                        margin: EdgeInsets.all(8),
                        width: 100,
                        decoration: BoxDecoration(
                          color: Color(0xFF3881FC),
                          borderRadius: BorderRadius.circular(15)
                        ),
                        child: Padding(
                          padding: const EdgeInsets.all(15.0),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: <Widget>[
                              Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: <Widget>[
                                  Column(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: <Widget>[
                                      Text("Current Balance" ,style: balance,),
                                      SizedBox(height: 10,),
                                      Text("\$ 12.432.32" ,style: number,),

                                    ],
                                  ),
                                  Text("BankX",style: TextStyle(color: Colors.white,fontWeight: FontWeight.bold),)
                                ],
                              ),
                              Text("****   ****   ****   1505",style: number,),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                crossAxisAlignment: CrossAxisAlignment.end,
                                children: <Widget>[
                                  Column(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: <Widget>[
                                      Text("Card holder" ,style: balance,),
                                      SizedBox(height: 5,),
                                      Text("Laurel Bailey" ,style: text,),

                                    ],
                                  ),
                                  Column(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: <Widget>[
                                      Text("Expires date" ,style: balance,),
                                      SizedBox(height: 5,),
                                      Text("05 / 20" ,style: text,),

                                    ],
                                  ),
                                  Icon(Icons.all_inclusive,color: Colors.white,)
                                ],
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      Text('Transactions',style: TextStyle(color: Colors.white,fontSize: 16),),
                      Icon(Icons.swap_horiz,color: Colors.white,size: 20,)
                    ],
                  ),
                ),
                Expanded(
                  child: Container(
                    height: double.infinity,
                    child: ListView.separated(
                    separatorBuilder: (context,index)=>Divider(),
                    itemCount: 5,
                    itemBuilder: (context,index){
                        return
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: <Widget>[
                                Padding(
                                  padding: const EdgeInsets.all(10.0),
                                  child: Text("Today",style: TextStyle(color: Colors.white,fontSize: 16),),
                                ),
                                Material(
                                  elevation: 8,
                                  borderRadius: BorderRadius.circular(20),
                                  child: Column(
                                      children: <Widget>[
                                        ListTile(
                                          leading:CircleAvatar(
                                            backgroundImage: NetworkImage('https://www.theurldr.com/wp-content/uploads/2014/01/apple-logo.jpg'),
                                          ),
                                          title: Text('Macbook Pro   15"'),
                                          subtitle: Text('Apple'),
                                          trailing: Text("- 2499 \$",style: TextStyle(color: Colors.red),),
                                        ),
                                        ListTile(
                                          leading:CircleAvatar(
                                            backgroundImage: NetworkImage('https://idego-group.com/wp-content/themes/idego/assets/images/technological_landings/Companies/Upwork.png'),
                                          ),
                                          title: Text('Upcoming transfer'),
                                          subtitle: Text('Upwork'),
                                          trailing: Text("+ 499 \$",style: TextStyle(color: Colors.green),),
                                        ),
                                      ],
                                    ),
                                ),
                              ],
                            );
                    }),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget changeIcon() {
    return
      !isMenuOpen ?
      Icon(
        Icons.menu,
        color: Colors.white70,
      ):
      Icon(
        Icons.close,
        color: Colors.white70,
      );
  }
}
