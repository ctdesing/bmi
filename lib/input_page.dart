import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'i_card.dart';
import 'i_palette.dart';
import 'constants.dart';

class InputPage extends StatefulWidget {
  @override
  _InputPageState createState() => _InputPageState();
}

enum Gender { male, female }

class _InputPageState extends State<InputPage> {
  Color maleColor = IPalette.darkNavy;
  Color femaleColor = IPalette.darkNavy;
  Gender selectedGender;
  double height = 180;

  void selectGender(Gender gender) {
    setState(() {
      selectedGender = gender;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('BMI CALCULATOR'),
      ),
      body: Column(
        children: <Widget>[
          Expanded(
            child: Row(
              children: <Widget>[
                Expanded(
                  child: ICard(
                    onClick: () {
                      selectGender(Gender.male);
                    },
                    color: selectedGender == Gender.male
                        ? IPalette.fadedBlue
                        : IPalette.darkNavy,
                    child: GenderSelect(
                      icon: FontAwesomeIcons.mars,
                      text: 'MALE',
                    ),
                  ),
                ),
                Expanded(
                  child: ICard(
                    onClick: () {
                      selectGender(Gender.female);
                    },
                    color: selectedGender == Gender.female
                        ? IPalette.fadedBlue
                        : IPalette.darkNavy,
                    child: GenderSelect(
                      icon: FontAwesomeIcons.venus,
                      text: 'FEMALE',
                    ),
                  ),
                ),
              ],
            ),
          ),
          Expanded(
            child: ICard(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Text(
                    'Height',
                    style: kLabel,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.baseline,
                    textBaseline: TextBaseline.alphabetic,
                    children: <Widget>[
                      Text(
                        height.toString(),
                        style: kHugeText,
                      ),
                      Text(
                        'cm',
                        style: kLabel,
                      ),
                    ],
                  ),
                  Slider(
                    value: height,
                    min: 120,
                    max: 220,
                    activeColor: IPalette.cherryRed,
                    inactiveColor: IPalette.dark,
                    onChanged: (double value) {
                      setState(() {
                        height = value.roundToDouble();
                      });
                    },
                  ),
                ],
              ),
            ),
          ),
          Expanded(
            child: Row(
              children: <Widget>[
                Expanded(
                  child: ICard(),
                ),
                Expanded(
                  child: ICard(),
                ),
              ],
            ),
          ),
          Container(
            margin: EdgeInsets.only(top: 10),
            color: IPalette.cherryRed,
            width: double.infinity,
            height: 65,
          ),
        ],
      ),
    );
  }
}

class GenderSelect extends StatelessWidget {
  GenderSelect({@required this.icon, @required this.text});

  final IconData icon;
  final String text;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        Icon(
          icon,
          size: 80,
        ),
        Container(
          margin: EdgeInsets.only(top: 15),
          child: Text(
            text,
            style: kLabel,
          ),
        )
      ],
    );
  }
}
