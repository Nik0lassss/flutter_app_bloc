import 'package:flutter/material.dart';
import 'package:flutter_app_bloc/data/network/model/sites/item.dart';
import 'package:flutter_app_bloc/domain/buisness/sites/site_bloc.dart';
import 'package:flutter_app_bloc/presentation/di/component.dart';
import 'package:flutter_app_bloc/presentation/ui/site_detail/site_detail.dart';

class SiteList extends StatefulWidget {
  static const routeName = 'SiteList';

  SiteBloc _bloc;

  SiteList() {
    _bloc = Component.getSiteBloc();
  }

  @override
  State<StatefulWidget> createState() => SiteListState();
}

class SiteListState extends State<SiteList> {
  bool _isLoading = false;
  bool _hasMore = true;
  int _prevSize = 0;
  int _loadedPage = 1;
  int _pageSize = 80;

  @override
  void initState() {
    super.initState();
    widget._bloc.init();
    widget._bloc.fetch(_loadedPage, _pageSize);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Stack sites"),
      ),
      body: StreamBuilder(
        stream: widget._bloc.allSites,
        builder: (context, AsyncSnapshot<List<SiteItem>> snapshot) {
          print("snapshot " + (snapshot != null).toString());
          if (snapshot.hasData) {
            _isLoading = false;
            checkMore(snapshot.data.length);
            return builtList(snapshot);
          } else if (snapshot.hasError) {
            return Center(
                child: Column(
              children: <Widget>[
                Text(snapshot.error.toString()),
                RaisedButton(
                  onPressed: _loadData,
                  child: const Text("Retry"),
                ),
              ],
            ));
//            return Text(snapshot.error.toString());
          }
          return Center(
            child: CircularProgressIndicator(),
          );
        },
      ),
    );
  }

  Widget builtList(AsyncSnapshot<List<SiteItem>> snapshot) {
    return ListView.builder(
      controller: getScrollController(),
      itemCount: snapshot.data.length,
      itemBuilder: (BuildContext context, int index) {
        return getItem(snapshot.data[index]);
      },
    );
  }

  ScrollController getScrollController() {
    ScrollController scrollController = ScrollController();
    scrollController.addListener(() {
      if (scrollController.position.maxScrollExtent ==
              scrollController.position.pixels &&
          !_isLoading &&
          _hasMore) {
        _isLoading = !_isLoading;
        _loadData();
      }
    });
    return scrollController;
  }

  void _loadData() {
    widget._bloc.fetch(_loadedPage, _pageSize);
  }

  Widget getItem(SiteItem siteItem) {
    return GestureDetector(
      onTap: () => openSitePage(siteItem),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
        child: LimitedBox(
          maxHeight: 48,
          child: Row(
            children: [
              AspectRatio(
                aspectRatio: 1,
                child: Image.network(siteItem.icon_url),
              ),
              SizedBox(width: 24),
              Expanded(
                child: Text(siteItem.name),
              ),
            ],
          ),
        ),
      ),
    );
  }

  openSitePage(SiteItem siteItem) {
    Navigator.pushNamed(context, SiteDetail.routeName, arguments: siteItem);
  }

  void checkMore(int size) {
    if (size > _prevSize) {
      _hasMore = true;
      _prevSize = size;
    } else {
      _hasMore = false;
    }
  }

  @override
  void dispose() {
    widget._bloc.dispose();
    super.dispose();
  }
}
