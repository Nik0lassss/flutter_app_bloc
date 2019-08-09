import 'package:flutter/material.dart';
import 'package:flutter_app_bloc/data/network/model/questions/question_item.dart';
import 'package:flutter_app_bloc/data/network/model/sites/item.dart';
import 'package:flutter_app_bloc/domain/buisness/site_detail/site_detail_bloc.dart';
import 'package:flutter_app_bloc/presentation/di/component.dart';

class SiteDetail extends StatefulWidget {
  static const routeName = '/SiteDetail';

  final SiteDetailBloc _siteDetailBloc = Component.getSiteDetailBloc();

  @override
  State<StatefulWidget> createState() => SiteDetailState();
}

class SiteDetailState extends State<SiteDetail> {
  SiteItem siteItem;

  SiteDetailState() {
    siteItem = ModalRoute.of(context).settings.arguments;
  }

  @override
  void initState() {
    super.initState();
    widget._siteDetailBloc.init();
    widget._siteDetailBloc.fetchQuestionsBySite(siteItem.name);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Stack sites"),
      ),
      body: StreamBuilder(
          stream: widget._siteDetailBloc.questions,
          builder:
              (context, AsyncSnapshot<Future<List<QuestionItem>>> snapshot) {
            if (snapshot.hasData) {
              return FutureBuilder(
                future: snapshot.data,
                builder:
                    (context, AsyncSnapshot<List<QuestionItem>> itemSnapshot) {
                  if (itemSnapshot.hasData) {
                    return builtList(itemSnapshot);
                  } else
                    return Center(
                      child: CircularProgressIndicator(),
                    );
                },
              );
            }
          }),
    );
  }

  Widget builtList(AsyncSnapshot<List<QuestionItem>> snapshot) {
    return ListView.builder(
      itemCount: snapshot.data.length,
      itemBuilder: (BuildContext context, int index) {
        return getItem(snapshot.data[index]);
      },
    );
  }

  Widget getItem(QuestionItem questionItem) {
    return new Card(
        child: Column(mainAxisSize: MainAxisSize.min, children: <Widget>[
      ListTile(
          title: Text(questionItem.title),
          subtitle: Text("Answers: " + questionItem.answerCount.toString())),
      new ButtonTheme.bar(
          // make buttons use the appropriate styles for cards
          child: new ButtonBar(children: <Widget>[
        new FlatButton(
          child: const Text('Open in webview'),
          onPressed: () {
            /* ... */
          },
        ),
      ]))
    ]));
  }

  @override
  void dispose() {
    widget._siteDetailBloc.dispose();
    super.dispose();
  }
}
