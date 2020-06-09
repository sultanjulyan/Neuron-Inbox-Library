import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:shimmer/shimmer.dart';

import 'component/component_navigations.dart';
import 'component/component_style_guides.dart';
import 'detail/detail_inbox_page.dart';
import 'model/model.dart';

class InboxLayout extends StatefulWidget {
  final List<Data> dataListInbox;

  const InboxLayout({Key key, this.dataListInbox}) : super(key: key);

  @override
  _InboxLayoutState createState() => _InboxLayoutState();
}

class _InboxLayoutState extends State<InboxLayout> {
  bool showShimmer = false;
  //List<Data> dataListInbox = new List();
  int index = 0;
  ScrollController scrollController;
  bool isLoadingMore = false;

  void scrollListener() {
    print(scrollController.position.extentAfter);
    if (scrollController.position.extentAfter == 0) {
      index = index + 10;
    }
  }

  @override
  void initState() {
    scrollController = new ScrollController()..addListener(scrollListener);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    Widget shimmerLayout = Column(mainAxisSize: MainAxisSize.max, children: <Widget>[
      Expanded(
        child: Container(
          margin: EdgeInsets.only(top: 16),
          child: ListView.builder(
            itemBuilder: (_, __) => Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 4),
              child: Container(
                height: 100,
                padding: EdgeInsets.all(24),
                decoration: new BoxDecoration(
                  color: Colors.white,
                  borderRadius: new BorderRadius.circular(8),
                ),
                child: Shimmer.fromColors(
                  baseColor: Colors.grey[300],
                  highlightColor: Colors.grey[100],
                  enabled: true,
                  child: Column(
                    children: <Widget>[
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Container(
                            decoration: new BoxDecoration(
                              color: Colors.white,
                              borderRadius: new BorderRadius.circular(40),
                            ),
                            width: 10.0,
                            height: 10.0,
                          ),
                          const Padding(
                            padding: EdgeInsets.symmetric(horizontal: 10.0),
                          ),
                          Expanded(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: <Widget>[
                                Container(width: double.infinity, height: 8.0, color: Colors.white),
                                SizedBox(height: 5),
                                Container(
                                  width: double.infinity,
                                  height: 8.0,
                                  color: Colors.white,
                                ),
                                SizedBox(height: 5),
                                Container(
                                  width: 100.0,
                                  height: 8.0,
                                  color: Colors.white,
                                ),
                                SizedBox(height: 5),
                                Container(
                                  width: 100.0,
                                  height: 8.0,
                                  color: Colors.white,
                                ),
                              ],
                            ),
                          )
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            ),
            itemCount: 10,
          ),
        ),
      )
    ]);

    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: ComponentNavigations.defaultAppBar(context, 'Inbox', null, null, false, null, null),
      body: Container(
        color: ColorStyled.mySecondAlternativeColor,
        width: double.infinity,
        child: RefreshIndicator(
          child: showShimmer
              ? shimmerLayout
              : widget.dataListInbox.length == 0
                  ? new Container(
                      child: Center(
                        child: Column(
                          mainAxisSize: MainAxisSize.max,
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: <Widget>[
                            Image.asset(
                              'assets/images/inbox_empty.png',
                              height: 250.0,
                              width: 250.0,
                            ),
                            SizedBox(
                              height: 20.0,
                            ),
                            Text(
                              "Tidak ada pesan saat ini",
                              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18.0),
                            ),
                            SizedBox(
                              height: 8.0,
                            ),
                            Text(
                              "Kami akan mengirimkan notifikasi kepada Anda",
                              style: TextStyle(color: Colors.grey),
                            ),
                            SizedBox(
                              height: 3.0,
                            ),
                            Text(
                              "bila terdapat pesan baru",
                              style: TextStyle(color: Colors.grey),
                            ),
                          ],
                        ),
                      ),
                    )
                  : ListView.builder(
                      padding: EdgeInsets.all(16.0),
                      itemCount: widget.dataListInbox.length,
                      controller: scrollController,
                      itemBuilder: (BuildContext context, int index) {
                        if (index < widget.dataListInbox.length) {
                          return Column(
                            children: <Widget>[
                              Slidable(
                                actionPane: SlidableDrawerActionPane(),
                                actionExtentRatio: 0.25,
                                child: GestureDetector(
                                  onTap: () {
                                    Navigator.of(context).push(
                                      PageRouteBuilder(
                                        opaque: false,
                                        pageBuilder: (BuildContext context, _, __) =>
                                            DetailInboxPage(
                                          itemListModel: widget.dataListInbox[index],
                                        ),
                                      ),
                                    );
                                  },
                                  child: Card(
                                    shape: RoundedRectangleBorder(
                                        borderRadius: BorderRadius.circular(8)),
                                    child: Container(
                                      padding:
                                          EdgeInsets.symmetric(vertical: 24.0, horizontal: 12.0),
                                      child: Row(
                                        mainAxisSize: MainAxisSize.max,
                                        crossAxisAlignment: CrossAxisAlignment.start,
                                        children: <Widget>[
                                          Padding(
                                            padding:
                                                EdgeInsets.only(top: 5.0, right: 12.0, left: 8.0),
                                            child: widget.dataListInbox[index].data1 == '1'
                                                ? Image.asset(
                                                    "assets/images/dot_grey.png",
                                                    height: 10,
                                                    width: 10,
                                                  )
                                                : Image.asset(
                                                    "assets/images/dot.png",
                                                    height: 10,
                                                    width: 10,
                                                  ),
                                          ),
                                          SizedBox(
                                            width: 5,
                                          ),
                                          Column(
                                            crossAxisAlignment: CrossAxisAlignment.start,
                                            children: <Widget>[
                                              Container(
                                                child: Text(
                                                  widget.dataListInbox[index].data2,
                                                  overflow: TextOverflow.ellipsis,
                                                  style: TextStyle(
                                                      color:
                                                          widget.dataListInbox[index].data1 == '1'
                                                              ? Colors.grey
                                                              : Colors.black,
                                                      fontSize: 15,
                                                      fontWeight: FontWeight.bold),
                                                ),
                                              ),
                                              new Container(
                                                width: MediaQuery.of(context).size.width / 1.6,
                                                child: Text(
                                                  widget.dataListInbox[index].data3,
                                                  style: TextStyle(
                                                    fontSize: 12,
                                                    color: widget.dataListInbox[index].data1 == '1'
                                                        ? Colors.grey
                                                        : Colors.black,
                                                  ),
                                                ),
                                              ),
                                              new Container(
                                                width: MediaQuery.of(context).size.width / 1.6,
                                                child: Text(
                                                  widget.dataListInbox[index].data4,
                                                  style: TextStyle(
                                                    fontSize: 12,
                                                    color: widget.dataListInbox[index].data1 == '1'
                                                        ? Colors.grey
                                                        : Colors.black,
                                                  ),
                                                ),
                                              ),
                                            ],
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                ),
                                secondaryActions: <Widget>[
                                  IconSlideAction(
                                    color: Colors.red,
                                    icon: Icons.delete,
                                    caption: "Delete",
                                    onTap: () {},
                                  )
                                ],
                              ),
                              index == widget.dataListInbox.length - 1 && isLoadingMore
                                  ? new Center(
                                      child: new Container(
                                        margin: EdgeInsets.only(bottom: 15.0, top: 15.0),
                                        child: CircularProgressIndicator(),
                                      ),
                                    )
                                  : new Container(),
                            ],
                          );
                        } else {
                          return new Center(
                            child: new Opacity(
                              opacity: 1.0,
                              child: new CircularProgressIndicator(),
                            ),
                          );
                        }
                      },
                    ),
          onRefresh: () async {
            showShimmer = true;
            index = 0;
            //widget.dataListInbox.clear();
            setState(() {
              showShimmer = false;
            });
          },
        ),
      ),
    );

//    return BlocListener<InboxBloc, InboxState>(
//      listener: (context, state) {
//        if (state is InboxFailed) {
//          showShimmer = false;
//          index = 0;
//          Flushbar(
//            isDismissible: true,
//            flushbarPosition: FlushbarPosition.TOP,
//            duration: Duration(seconds: 3),
//            backgroundColor: Colors.orange,
//            message: '${state.errorMessage}',
//          )..show(context);
//        } else if (state is InboxSuccess) {
//          showShimmer = false;
//          setState(() {
//            widget.dataListInbox..addAll(state.listInboxModel.data);
//          });
//        } else if (state is InboxDeleteSuccess) {
//          showShimmer = true;
//          index = 0;
//          widget.dataListInbox.clear();
//          BlocProvider.of<InboxBloc>(context).add(InboxInit());
//          setState(() {});
//        } else if (state is InboxLoading) {
//          showShimmer = true;
//        }
//      },
//      child: BlocBuilder<InboxBloc, InboxState>(builder: (context, inboxState) {
//        Widget shimmerLayout =
//            Column(mainAxisSize: MainAxisSize.max, children: <Widget>[
//          Expanded(
//            child: Container(
//              margin: EdgeInsets.only(top: 16),
//              child: ListView.builder(
//                itemBuilder: (_, __) => Padding(
//                  padding:
//                      const EdgeInsets.symmetric(horizontal: 16, vertical: 4),
//                  child: Container(
//                    height: 100,
//                    padding: EdgeInsets.all(24),
//                    decoration: new BoxDecoration(
//                      color: Colors.white,
//                      borderRadius: new BorderRadius.circular(8),
//                    ),
//                    child: Shimmer.fromColors(
//                      baseColor: Colors.grey[300],
//                      highlightColor: Colors.grey[100],
//                      enabled: true,
//                      child: Column(
//                        children: <Widget>[
//                          Row(
//                            crossAxisAlignment: CrossAxisAlignment.start,
//                            children: [
//                              Container(
//                                decoration: new BoxDecoration(
//                                  color: Colors.white,
//                                  borderRadius: new BorderRadius.circular(40),
//                                ),
//                                width: 10.0,
//                                height: 10.0,
//                              ),
//                              const Padding(
//                                padding: EdgeInsets.symmetric(horizontal: 10.0),
//                              ),
//                              Expanded(
//                                child: Column(
//                                  crossAxisAlignment: CrossAxisAlignment.start,
//                                  children: <Widget>[
//                                    Container(
//                                        width: double.infinity,
//                                        height: 8.0,
//                                        color: Colors.white),
//                                    SizedBox(height: 5),
//                                    Container(
//                                      width: double.infinity,
//                                      height: 8.0,
//                                      color: Colors.white,
//                                    ),
//                                    SizedBox(height: 5),
//                                    Container(
//                                      width: 100.0,
//                                      height: 8.0,
//                                      color: Colors.white,
//                                    ),
//                                    SizedBox(height: 5),
//                                    Container(
//                                      width: 100.0,
//                                      height: 8.0,
//                                      color: Colors.white,
//                                    ),
//                                  ],
//                                ),
//                              )
//                            ],
//                          ),
//                        ],
//                      ),
//                    ),
//                  ),
//                ),
//                itemCount: 10,
//              ),
//            ),
//          )
//        ]);
//
//        return Scaffold(
//          resizeToAvoidBottomInset: false,
//          appBar: ComponentNavigations.defaultAppBar(context, 'Inbox', null, null, false, null, null),
//          body: Container(
//            color: ColorStyled.mySecondAlternativeColor,
//            width: double.infinity,
//            child: RefreshIndicator(
//              child: showShimmer
//                  ? shimmerLayout
//                  : widget.dataListInbox.length == 0
//                      ? new Container(
//                          child: Center(
//                            child: Column(
//                              mainAxisSize: MainAxisSize.max,
//                              mainAxisAlignment: MainAxisAlignment.center,
//                              crossAxisAlignment: CrossAxisAlignment.center,
//                              children: <Widget>[
//                                Image.asset(
//                                  'assets/images/inbox_empty.png',
//                                  height: 250.0,
//                                  width: 250.0,
//                                ),
//                                SizedBox(
//                                  height: 20.0,
//                                ),
//                                Text(
//                                  "Tidak ada pesan saat ini",
//                                  style: TextStyle(
//                                      fontWeight: FontWeight.bold,
//                                      fontSize: 18.0),
//                                ),
//                                SizedBox(
//                                  height: 8.0,
//                                ),
//                                Text(
//                                  "Kami akan mengirimkan notifikasi kepada Anda",
//                                  style: TextStyle(color: Colors.grey),
//                                ),
//                                SizedBox(
//                                  height: 3.0,
//                                ),
//                                Text(
//                                  "bila terdapat pesan baru",
//                                  style: TextStyle(color: Colors.grey),
//                                ),
//                              ],
//                            ),
//                          ),
//                        )
//                      : ListView.builder(
//                          padding: EdgeInsets.all(16.0),
//                          itemCount: widget.dataListInbox.length,
//                          controller: scrollController,
//                          itemBuilder: (BuildContext context, int index) {
//                            if (index < widget.dataListInbox.length) {
//                              return Column(
//                                children: <Widget>[
//                                  Slidable(
//                                    actionPane: SlidableDrawerActionPane(),
//                                    actionExtentRatio: 0.25,
//                                    child: GestureDetector(
//                                      onTap: () {
//                                        BlocProvider.of<InboxBloc>(context).add(
//                                            InboxItemPressed(
//                                                itemListModel:
//                                                    widget.dataListInbox[index]));
//                                        Navigator.of(context).push(
//                                            PageRouteBuilder(
//                                                opaque: false,
//                                                pageBuilder: (BuildContext
//                                                            context,
//                                                        _,
//                                                        __) =>
//                                                    DetailInboxPage(
//                                                      itemListModel:
//                                                          widget.dataListInbox[index],
//                                                    )));
//                                      },
//                                      child: Card(
//                                        shape: RoundedRectangleBorder(
//                                            borderRadius:
//                                                BorderRadius.circular(8)),
//                                        child: Container(
//                                          padding: EdgeInsets.symmetric(
//                                              vertical: 24.0, horizontal: 12.0),
//                                          child: Row(
//                                            mainAxisSize: MainAxisSize.max,
//                                            crossAxisAlignment:
//                                                CrossAxisAlignment.start,
//                                            children: <Widget>[
//                                              Padding(
//                                                padding: EdgeInsets.only(
//                                                    top: 5.0,
//                                                    right: 12.0,
//                                                    left: 8.0),
//                                                child:
//                                                    widget.dataListInbox[index].data1 ==
//                                                            '1'
//                                                        ? Image.asset(
//                                                            "assets/images/dot_grey.png",
//                                                            height: 10,
//                                                            width: 10,
//                                                          )
//                                                        : Image.asset(
//                                                            "assets/images/dot.png",
//                                                            height: 10,
//                                                            width: 10,
//                                                          ),
//                                              ),
//                                              SizedBox(
//                                                width: 5,
//                                              ),
//                                              Column(
//                                                crossAxisAlignment:
//                                                    CrossAxisAlignment.start,
//                                                children: <Widget>[
//                                                  Container(
//                                                    child: Text(
//                                                      widget.dataListInbox[index]
//                                                          .data2,
//                                                      overflow:
//                                                          TextOverflow.ellipsis,
//                                                      style: TextStyle(
//                                                          color: widget.dataListInbox[
//                                                                          index]
//                                                                      .data1 ==
//                                                                  '1'
//                                                              ? Colors.grey
//                                                              : Colors.black,
//                                                          fontSize: 15,
//                                                          fontWeight:
//                                                              FontWeight.bold),
//                                                    ),
//                                                  ),
//                                                  new Container(
//                                                    width:
//                                                        MediaQuery.of(context)
//                                                                .size
//                                                                .width /
//                                                            1.6,
//                                                    child: Text(
//                                                      widget.dataListInbox[index].data3,
//                                                      style: TextStyle(
//                                                        fontSize: 12,
//                                                        color:
//                                                            widget.dataListInbox[index]
//                                                                        .data1 ==
//                                                                    '1'
//                                                                ? Colors.grey
//                                                                : Colors.black,
//                                                      ),
//                                                    ),
//                                                  ),
//                                                  new Container(
//                                                    width:
//                                                        MediaQuery.of(context)
//                                                                .size
//                                                                .width /
//                                                            1.6,
//                                                    child: Text(
//                                                      widget.dataListInbox[index]
//                                                          .data4,
//                                                      style: TextStyle(
//                                                        fontSize: 12,
//                                                        color:
//                                                            widget.dataListInbox[index]
//                                                                        .data1 ==
//                                                                    '1'
//                                                                ? Colors.grey
//                                                                : Colors.black,
//                                                      ),
//                                                    ),
//                                                  ),
//                                                ],
//                                              ),
//                                            ],
//                                          ),
//                                        ),
//                                      ),
//                                    ),
//                                    secondaryActions: <Widget>[
//                                      IconSlideAction(
//                                        color: Colors.red,
//                                        icon: Icons.delete,
//                                        caption: "Delete",
//                                        onTap: () {
//                                          BlocProvider.of<InboxBloc>(context)
//                                              .add(InboxDelete(
//                                                  id: widget.dataListInbox[index]
//                                                      .data5));
//                                        },
//                                      )
//                                    ],
//                                  ),
//                                  index == widget.dataListInbox.length - 1 &&
//                                          isLoadingMore
//                                      ? new Center(
//                                          child: new Container(
//                                            margin: EdgeInsets.only(
//                                                bottom: 15.0, top: 15.0),
//                                            child: CircularProgressIndicator(),
//                                          ),
//                                        )
//                                      : new Container(),
//                                ],
//                              );
//                            } else {
//                              return new Center(
//                                child: new Opacity(
//                                  opacity: 1.0,
//                                  child: new CircularProgressIndicator(),
//                                ),
//                              );
//                            }
//                          },
//                        ),
//              onRefresh: () async {
//                showShimmer = true;
//                index = 0;
//                widget.dataListInbox.clear();
//                BlocProvider.of<InboxBloc>(context).add(InboxInit());
//                setState(() {});
//              },
//            ),
//          ),
//        );
//      }),
//    );
  }
}
