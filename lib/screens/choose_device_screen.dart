import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';

class ChooseDeviceScreen extends StatefulWidget {
  @override
  _ChooseDeviceScreenState createState() => _ChooseDeviceScreenState();
}

enum CoffeeMachine { FrenchPress, DripMachine }
CoffeeMachine _machine = CoffeeMachine.FrenchPress;

class _ChooseDeviceScreenState extends State<ChooseDeviceScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Center(
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Text(
                "What coffee maker are you using?",
                style: TextStyle(
                  fontFamily: 'Montserrat',
                  color: Color.fromRGBO(76, 116, 139, 100),
                  fontSize: 18.0,
                  fontWeight: FontWeight.w200,
                ),
              ),
              ListTile(
                title: const Text(
                  'French Press',
                  style: TextStyle(
                    fontFamily: 'Kollektif',
                    color: Color.fromRGBO(76, 116, 139, 100),
                    fontSize: 14.0,
                    fontWeight: FontWeight.w200,
                  ),
                ),
                leading: Radio<CoffeeMachine>(
                  value: CoffeeMachine.FrenchPress,
                  groupValue: _machine,
                  onChanged: (CoffeeMachine value) {
                    setState(() {
                      _machine = value;
                    });
                  },
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 30),
                child: ListTile(
                  title: const Text(
                    'Drip Machine',
                    style: TextStyle(
                      fontFamily: 'Kollektif',
                      color: Color.fromRGBO(76, 116, 139, 100),
                      fontSize: 14.0,
                      fontWeight: FontWeight.w200,
                    ),
                  ),
                  leading: Radio<CoffeeMachine>(
                    value: CoffeeMachine.DripMachine,
                    groupValue: _machine,
                    onChanged: (CoffeeMachine value) {
                      setState(() {
                        _machine = value;
                      });
                    },
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 30),
                child: RaisedButton(
                  child: Text(
                    'Continue',
                    style: TextStyle(color: Colors.white),
                  ),
                  shape: RoundedRectangleBorder(
                      borderRadius: (BorderRadius.circular(20))),
                  padding: EdgeInsets.only(left: 80, right: 80),
                  color: Color.fromRGBO(76, 116, 139, 100),
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => ChooseCupsScreen()),
                    );
                  },
                ),
              )
            ]),
      ),
    ));
  }
}

class ChooseCupsScreen extends StatefulWidget {
  @override
  _ChooseCupsScreenState createState() => _ChooseCupsScreenState();
}

var _cups;
var _water;
var _coffee;

final cupsCon = new TextEditingController();

class _ChooseCupsScreenState extends State<ChooseCupsScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
            backgroundColor: Colors.white,
            leading: IconButton(
              icon: Icon(
                Icons.arrow_back_ios,
                color: Colors.black,
              ),
              onPressed: () {
                Navigator.pop(context);
              },
            )),
        body: Center(
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Text(
                    "How many cups would you like?",
                    style: TextStyle(
                      fontFamily: 'Montserrat',
                      color: Color.fromRGBO(76, 116, 139, 100),
                      fontSize: 18.0,
                      fontWeight: FontWeight.w200,
                    ),
                  ),
                  Row(children: <Widget>[
                    Expanded(
                      child: Padding(
                        padding: const EdgeInsets.fromLTRB(20, 8, 20, 8),
                        child: TextField(
                          controller: cupsCon,
                          keyboardType: TextInputType.number,
                          decoration: new InputDecoration(
                            focusedBorder: OutlineInputBorder(
                              borderSide: BorderSide(
                                  color: Color.fromRGBO(76, 116, 139, 100),
                                  width: 1.0),
                            ),
                            enabledBorder: OutlineInputBorder(
                              borderSide: BorderSide(
                                  color: Color.fromRGBO(76, 116, 139, 100),
                                  width: 1.0),
                            ),
                          ),
                        ),
                      ),
                    ),
                  ]),
                  Padding(
                    padding: const EdgeInsets.only(top: 30),
                    child: RaisedButton(
                        child: Text(
                          'Continue',
                          style: TextStyle(color: Colors.white),
                        ),
                        shape: RoundedRectangleBorder(
                            borderRadius: (BorderRadius.circular(20))),
                        padding: EdgeInsets.only(left: 80, right: 80),
                        color: Color.fromRGBO(76, 116, 139, 100),
                        onPressed: () {
                          _cups = cupsCon.text;

                          Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => RecommendedScreen()),
                          );
                          machineChoice(_machine);
                        }),
                  ),
                ]),
          ),
        ));
  }
}

var _cup = int.parse(_cups);

void machineChoice(_machine) {
  if (_machine == CoffeeMachine.FrenchPress) {
    _water = _cup * 128;
    _coffee = _water / 17;
  }
  if (_machine == CoffeeMachine.DripMachine) {
    _water = _cup * 128;
    _coffee = _water / 14;
  }
}

class RecommendedScreen extends StatefulWidget {
  @override
  _RecommendedScreenState createState() => _RecommendedScreenState();
}

class _RecommendedScreenState extends State<RecommendedScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
            backgroundColor: Colors.white,
            leading: IconButton(
              icon: Icon(
                Icons.arrow_back_ios,
                color: Colors.black,
              ),
              onPressed: () {
                Navigator.pop(context);
              },
            )),
        body: Center(
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Spacer(
                    flex: 6,
                  ),
                  Text(
                    "Recommended",
                    style: TextStyle(
                      fontFamily: 'Kollektif',
                      color: Color.fromRGBO(76, 116, 139, 100),
                      fontSize: 18.0,
                      fontWeight: FontWeight.w200,
                    ),
                  ),
                  Divider(color: Color.fromRGBO(76, 116, 139, 100)),
                  Text(
                    "$_coffee g - course ground coffee",
                    style: TextStyle(
                      fontFamily: 'Kollektif',
                      color: Color.fromRGBO(76, 116, 139, 100),
                      fontSize: 14.0,
                      fontWeight: FontWeight.w200,
                    ),
                  ),
                  Spacer(),
                  Text(
                    "$_water g - water",
                    style: TextStyle(
                      fontFamily: 'Kollektif',
                      color: Color.fromRGBO(76, 116, 139, 100),
                      fontSize: 14.0,
                      fontWeight: FontWeight.w200,
                    ),
                  ),
                  Spacer(),
                  Text(
                    'You want $_cup of coffee',
                    style: TextStyle(
                      fontFamily: 'Kollektif',
                      color: Color.fromRGBO(76, 116, 139, 100),
                      fontSize: 14.0,
                      fontWeight: FontWeight.w200,
                    ),
                  ),
                  Spacer(),
                  Text(
                    'You want $_machine of coffee',
                    style: TextStyle(
                      fontFamily: 'Kollektif',
                      color: Color.fromRGBO(76, 116, 139, 100),
                      fontSize: 14.0,
                      fontWeight: FontWeight.w200,
                    ),
                  ),
                  Spacer(),
                  Text(
                    "Enjoy your delicious coffee",
                    style: TextStyle(
                      fontFamily: 'Montserrat',
                      fontStyle: FontStyle.italic,
                      color: Color.fromRGBO(76, 116, 139, 100),
                      fontSize: 10.0,
                      fontWeight: FontWeight.w200,
                    ),
                  ),
                  Spacer(
                    flex: 6,
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 30),
                    child: RaisedButton(
                      child: Text(
                        'Done',
                        style: TextStyle(color: Colors.white),
                      ),
                      shape: RoundedRectangleBorder(
                          borderRadius: (BorderRadius.circular(20))),
                      padding: EdgeInsets.only(left: 80, right: 80),
                      color: Color.fromRGBO(76, 116, 139, 100),
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => ChooseDeviceScreen()),
                        );
                      },
                    ),
                  )
                ]),
          ),
        ));
  }
}
