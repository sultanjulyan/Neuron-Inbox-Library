import 'package:flutter/material.dart';
import 'package:neuron_inbox/model/model.dart';
import 'package:neuron_inbox/neuron_inbox.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Inbox',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: HomeScreen(),
    );
  }
}

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {

  @override
  Widget build(BuildContext context) {
    List<Data> dataList = new List();

    dataList.add(new Data(data1: '1', data2: 'Info Tagihan Januari', data3: 'Harap bayar tagihan bulan ini segera, jika tidak segera membayar akan dikenakan denda 100%', data4: '1-Januari-2020'));
    dataList.add(new Data(data1: '1', data2: 'Info Tagihan Februari', data3: 'Harap bayar tagihan bulan ini segera, jika tidak segera membayar akan dikenakan denda 100%', data4: '1-Februari-2020'));
    dataList.add(new Data(data1: '1', data2: 'Info Tagihan Maret', data3: 'Harap bayar tagihan bulan ini segera, jika tidak segera membayar akan dikenakan denda 100%', data4: '1-Maret-2020'));
    dataList.add(new Data(data1: '1', data2: 'Info Tagihan April', data3: 'Harap bayar tagihan bulan ini segera, jika tidak segera membayar akan dikenakan denda 100%', data4: '1-April-2020'));
    dataList.add(new Data(data1: '1', data2: 'Info Tagihan Mei', data3: 'Harap bayar tagihan bulan ini segera, jika tidak segera membayar akan dikenakan denda 100%', data4: '1-Mei-2020'));
    dataList.add(new Data(data1: '1', data2: 'Info Tagihan Juni', data3: 'Harap bayar tagihan bulan ini segera, jika tidak segera membayar akan dikenakan denda 100%', data4: '1-Juni-2020'));
    dataList.add(new Data(data1: '1', data2: 'Info Tagihan Juli', data3: 'Harap bayar tagihan bulan ini segera, jika tidak segera membayar akan dikenakan denda 100%', data4: '1-Juli-2020'));
    dataList.add(new Data(data1: '1', data2: 'Info Tagihan Agustus', data3: 'Harap bayar tagihan bulan ini segera, jika tidak segera membayar akan dikenakan denda 100%', data4: '1-Agustus-2020'));

    return Scaffold(
      resizeToAvoidBottomPadding: false,
      resizeToAvoidBottomInset: false,
      body: Padding(
        padding: EdgeInsets.only(bottom: MediaQuery.of(context).viewInsets.bottom),
        child: InboxPage(dataListInbox: dataList),
      ),
    );
  }
}
