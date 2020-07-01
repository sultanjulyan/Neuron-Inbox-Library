import 'package:flutter/material.dart';
import 'package:neuron_inbox/inbox_layout.dart';
import 'package:neuron_inbox/model/model.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {

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
  List<Data> dataList = new List();

  @override
  void initState() {
    dataList.add(new Data(data1: '2', data2: 'Info Tagihan Januari', data3: 'Harap bayar tagihan bulan ini segera, jika tidak segera membayar akan dikenakan denda 100%', data4: '1-Januari-2020'));
    dataList.add(new Data(data1: '2', data2: 'Info Tagihan Februari', data3: 'Harap bayar tagihan bulan ini segera, jika tidak segera membayar akan dikenakan denda 100%', data4: '1-Februari-2020'));
    dataList.add(new Data(data1: '2', data2: 'Info Tagihan Maret', data3: 'Harap bayar tagihan bulan ini segera, jika tidak segera membayar akan dikenakan denda 100%', data4: '1-Maret-2020'));
    dataList.add(new Data(data1: '1', data2: 'Info Tagihan April', data3: 'Harap bayar tagihan bulan ini segera, jika tidak segera membayar akan dikenakan denda 100%', data4: '1-April-2020'));
    dataList.add(new Data(data1: '1', data2: 'Info Tagihan Mei', data3: 'Harap bayar tagihan bulan ini segera, jika tidak segera membayar akan dikenakan denda 100%', data4: '1-Mei-2020'));
    dataList.add(new Data(data1: '2', data2: 'Info Tagihan Juni', data3: 'Harap bayar tagihan bulan ini segera, jika tidak segera membayar akan dikenakan denda 100%', data4: '1-Juni-2020'));
    dataList.add(new Data(data1: '1', data2: 'Info Tagihan Juli', data3: 'Harap bayar tagihan bulan ini segera, jika tidak segera membayar akan dikenakan denda 100%', data4: '1-Juli-2020'));
    dataList.add(new Data(data1: '1', data2: 'Info Tagihan Agustus', data3: 'Harap bayar tagihan bulan ini segera, jika tidak segera membayar akan dikenakan denda 100%', data4: '1-Agustus-2020'));

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomPadding: false,
      resizeToAvoidBottomInset: false,
      body: Padding(
        padding: EdgeInsets.only(bottom: MediaQuery.of(context).viewInsets.bottom),
        child: loadInboxLayout(dataList, false, 'Inbox', 'Detail Inbox'),
      ),
    );
  }

  InboxLayout loadInboxLayout(dataList, showLoading, titleListInbox, titleDetailListInbox){
    return InboxLayout(
      dataListInbox: dataList,
      showLoading: showLoading,
      titleListInbox: titleListInbox,
      titleDetailListInbox: titleDetailListInbox,
      imageRead: 'assets/images/dot_grey.png',
      imageUnRead: 'assets/images/dot.png',
      onDeleteTap: (value){
        print('Deleted '+value.toString());
      },
      onDetailTap: (value){
        print('Detail '+value.toString());
      },
      onRefresh: (value){
        print('Refresh '+value.toString());
        setState(() {
          loadInboxLayout(dataList, true, 'Inbox', 'Detail Inbox');
        });
      },
      endOfList: (value){
        print('End of list '+value.toString());
      },
    );
  }
}
