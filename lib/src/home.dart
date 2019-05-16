import 'package:flutter/material.dart';
import 'package:realcount_capres/API/api.dart';
import 'dart:convert';
import 'package:charts_flutter/flutter.dart' as charts;
import 'package:intl/intl.dart';
import 'package:realcount_capres/model/realcount.dart';
class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  var data= new List<RealCount>();
  var joko;
  var totaldata;
  var persenjokowi;
  var persenprabowo;
  RealCount rc;
  void initState(){
      super.initState();
      _getData();
      
      
    }
    
    _getData(){
    API.getData().then((responses){
      setState(() {
        final list = json.decode(responses.body);
        
           rc = new RealCount.fromJson(list);
         print(rc.chart.jokowi);
         print('\n');
         print(rc.chart.prabowo);
         totaldata=(rc.progress.proses/rc.progress.total)*100;
         var totalkabeh= rc.chart.jokowi+rc.chart.prabowo;
         persenjokowi=(rc.chart.jokowi/totalkabeh)*100;
         persenprabowo=(rc.chart.prabowo/totalkabeh)*100;

      });

    });
  }
  @override
  Widget build(BuildContext context) {

    var jumlah=[
          DataPilpres('Jokowi-Amin', persenjokowi, Colors.red),
          DataPilpres('Prabowo-Sandi', persenprabowo, Colors.yellow),
        ];
    
      
       var series=[
          charts.Series(
              domainFn: (DataPilpres target,_)=>target.total,
            measureFn: (DataPilpres target,_)=>target.jumlah,
            colorFn: (DataPilpres target,_)=>target.color,
            id: 'Pencapaian',
            data: jumlah,
            labelAccessorFn: (DataPilpres target,_)=>'${target.total} : ${target.jumlah.toString()}'
            ),
         
            
        ];
         var chart = charts.PieChart(
          series,
          defaultRenderer: charts.ArcRendererConfig(
            arcRendererDecorators: [charts.ArcLabelDecorator()]
          ),
          
        );

    final NumberFormat formatter = NumberFormat.simpleCurrency(
      locale: Localizations.localeOf(context).toString(), name: '');
    return Scaffold(
      appBar: AppBar(
      backgroundColor: Colors.greenAccent[400],
        title: Text('Real Count Pemilu'),
        actions: <Widget>[
          new IconButton(icon: Icon(Icons.search, color: Colors.white,), onPressed: (){}),
        ],
    ),

      body: Card(
      child: (rc != null && totaldata != null) ? 

      Container(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Padding(padding: EdgeInsets.all(4.0),child: Text('Jokowi-Amin: '+formatter.format(rc.chart.jokowi)),),
            Padding(padding: EdgeInsets.all(4.0),child: Text('Prabowo-Sandi: '+formatter.format(rc.chart.prabowo)),),
            SizedBox(
              height: 400,
              child: chart,
            ),
            Padding(padding: EdgeInsets.all(4.0),child: Text('Total Suara Masuk: '+ formatter.format(totaldata)+'%'),),
            Padding(padding: EdgeInsets.all(4.0),child: Text('Update Terakhir pada: '+ rc.ts),),
  

          ],
        ),
        
      )
      
     
      
      
      : Center(child: CircularProgressIndicator(),) ,
       )

    ); 
  }
}


class DataPilpres{
  final String total;
  final double jumlah;
  final charts.Color color;

  DataPilpres(this.total, this.jumlah, Color color)
  :this.color=charts.Color(r: color.red, g: color.green, b: color.blue,a: color.alpha);
}