import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:charts_flutter/flutter.dart' as charts;
import 'package:mood_diary_app_flutter/helper/mood_data.dart';
import 'package:mood_diary_app_flutter/widgets/mood_card.dart';
import 'package:pie_chart/pie_chart.dart';
import 'package:provider/provider.dart';

class ChartsScreen extends StatefulWidget {
  @override
  _ChartsScreenState createState() => _ChartsScreenState();
}

class _ChartsScreenState extends State<ChartsScreen> {
  List<CircleAvatar> colors = [
    CircleAvatar(backgroundColor: Colors.blue),
    CircleAvatar(backgroundColor: Colors.green),
    CircleAvatar(backgroundColor: Colors.teal),
    CircleAvatar(backgroundColor: Colors.red),
    CircleAvatar(backgroundColor: Colors.yellow),
    CircleAvatar(backgroundColor: Colors.deepOrange),
    CircleAvatar(backgroundColor: Colors.purple),
    CircleAvatar(backgroundColor: Colors.pink),
    CircleAvatar(backgroundColor: Colors.black),
  ];

  List<String> colorNames = ['Blue','Green','Teal','Red','Yellow','Orange','Purple','Pink','Black'];

  double a=0;
  double b=0;
  double c=0;
  double d=0;
  double e=0;
  double f=0;
  double g=0;
  double h=0;
  double i=0;
  double j=0;
  double k=0;
  double l=0;
  double m=0;
  double n=0;
  double o=0;
  double p=0;
  double q=0;
  double r=0;
  double s=0;
  double t=0;
  double u=0;
  double v=0;
  double w=0;
  double x=0;
  double y=0;
  double z=0;

  Map<String, double> dataMap = Map();
  Map<String, double> dataMap2 = Map();

  @override
  void initState() {
    super.initState();
    Provider.of<MoodCard>(context,listen: false).data.forEach((element) {
      if(element.moodno == 1){
        a++;
      }
      else if(element.moodno == 2){
        b++;
      }
      else if(element.moodno == 3){
        c++;
      }
      else if(element.moodno == 4){
        d++;
      }
      else if(element.moodno == 5){
        e++;
      }
      else if(element.moodno == 6){
        f++;
      }
      else if(element.moodno == 7){
        g++;
      }
      else if(element.moodno == 8){
        h++;
      }
      else if(element.moodno == 9){
        i++;
      }
      else{
        j++;
      }
    });

    Provider.of<MoodCard>(context, listen: false).actiname.forEach((element) {
      if(element == 'Sports'){
        k++;
      }
      else if(element == 'Sleep'){
        l++;
      }
      else if(element == 'Shop'){
        m++;
      }
      else if(element == 'Relax'){
        n++;
      }
      else if(element == 'Read'){
        o++;
      }
      else if(element == 'Movies'){
        p++;
      }
      else if(element == 'Gaming'){
        q++;
      }
      else if(element == 'Friends'){
        r++;
      }
      else if(element == 'Family'){
        s++;
      }
      else if(element == 'Exercise'){
        t++;
      }
      else if(element == 'Eat'){
        u++;
      }
      else if(element == 'Date'){
        v++;
      }
      else if(element == 'Clean'){
        w++;
      }
      else if(element == 'School'){
        x++;
      }
      else if(element == 'Homework'){
        y++;
      }
    });
    
    dataMap.putIfAbsent('Happy', () => a);
    dataMap.putIfAbsent('Sad', () => b);
    dataMap.putIfAbsent('Bored', () => c);
    dataMap.putIfAbsent('Angry', () => d);
    dataMap.putIfAbsent('Shock', () => e);
    dataMap.putIfAbsent('Cool', () => f);
    dataMap.putIfAbsent('High', () => g);
    dataMap.putIfAbsent('Loving', () => h);
    dataMap.putIfAbsent('Scared', () => i);
    dataMap.putIfAbsent('Crying', () => j);
    dataMap.putIfAbsent('Sports', () => k);
    dataMap.putIfAbsent('Sleep', () => l);
    dataMap.putIfAbsent('Shop', () => m);
    dataMap.putIfAbsent('Relax', () => n);
    dataMap.putIfAbsent('Read', () => o);
    dataMap.putIfAbsent('Movies', () => p);
    dataMap.putIfAbsent('Gaming', () => q);
    dataMap.putIfAbsent('Friends', () => r);
    dataMap.putIfAbsent('Family', () => s);
    dataMap.putIfAbsent('Exercise', () => t);
    dataMap.putIfAbsent('Eat', () => u);
    dataMap.putIfAbsent('Date', () => v);
    dataMap.putIfAbsent('Clean', () => w);
    dataMap.putIfAbsent('School', () => x);
    dataMap.putIfAbsent('Homework', () => y);
  }
  
  @override
  Widget build(BuildContext context) {
    List<MoodData> data = Provider.of<MoodCard>(context,listen: false).data;
    List<charts.Series<MoodData, String>> series = [
      charts.Series(
        id: 'Moods',
        data: data,
        domainFn: (MoodData series, _) => series.date,
        measureFn: (MoodData series, _) => series.moodno,
        colorFn: (MoodData series, _) => charts.ColorUtil.fromDartColor(Colors.blue)
      )
    ];

    return Scaffold(
      appBar: AppBar(
        title: Text('Mood Graph'),
        backgroundColor: Colors.red,
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              width: 300,
              child: Card(
                child: Row(
                  children: [
                    SizedBox(width: 120),
                    Column(
                      children: [
                        Text('1-', style: TextStyle(fontWeight: FontWeight.bold)),
                        Text('2-', style: TextStyle(fontWeight: FontWeight.bold)),
                        Text('3-', style: TextStyle(fontWeight: FontWeight.bold)),
                        Text('4-', style: TextStyle(fontWeight: FontWeight.bold)),
                        Text('5-', style: TextStyle(fontWeight: FontWeight.bold)),
                        Text('6-', style: TextStyle(fontWeight: FontWeight.bold)),
                        Text('7-', style: TextStyle(fontWeight: FontWeight.bold)),
                        Text('8-', style: TextStyle(fontWeight: FontWeight.bold)),
                        Text('9-', style: TextStyle(fontWeight: FontWeight.bold)),
                        Text('10-', style: TextStyle(fontWeight: FontWeight.bold)),
                      ],
                    ),
                    SizedBox(width: 20),
                    Column(
                      children: [
                        Text('Happy', style: TextStyle(fontWeight: FontWeight.bold)),
                        Text('Sad', style: TextStyle(fontWeight: FontWeight.bold)),
                        Text('Bored', style: TextStyle(fontWeight: FontWeight.bold)),
                        Text('Angry', style: TextStyle(fontWeight: FontWeight.bold)),
                        Text('Shock', style: TextStyle(fontWeight: FontWeight.bold)),
                        Text('Cool', style: TextStyle(fontWeight: FontWeight.bold)),
                        Text('High', style: TextStyle(fontWeight: FontWeight.bold)),
                        Text('Loving', style: TextStyle(fontWeight: FontWeight.bold)),
                        Text('Scared', style: TextStyle(fontWeight: FontWeight.bold)),
                        Text('Crying', style: TextStyle(fontWeight: FontWeight.bold)),
                      ],
                    ),
                  ],
                ),
              ),
            ),
            Center(
              child: Container(
                height: 200,
                width: 300,
                child: charts.BarChart(
                  series,
                  animate: true,
                ),
              ),
            ),
            PieChart(
              dataMap: dataMap,
              animationDuration: Duration(milliseconds: 800),
              chartLegendSpacing: 32.0,
              chartRadius: MediaQuery.of(context).size.width / 2.7,
              showChartValuesInPercentage: true,
              showChartValues: true,
              showChartValuesOutside: false,
              chartValueBackgroundColor: Colors.grey[200],
              showLegends: true,
              legendPosition: LegendPosition.right,
              decimalPlaces: 1,
              showChartValueLabel: true,
              initialAngle: 0,
              chartValueStyle: defaultChartValueStyle.copyWith(color: Colors.blueGrey[900].withOpacity(0.9)),
              chartType: ChartType.disc,
            )
          ],
        ),
      ),
    );
  }
}
