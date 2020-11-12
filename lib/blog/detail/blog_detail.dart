/*
 * @Author: Kingtous
 * @Date: 2020-10-14 23:13:00
 * @LastEditors: Kingtous
 * @LastEditTime: 2020-10-14 23:47:49
 * @Description: Kingtous' Code
 */
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_markdown/flutter_markdown.dart';
import 'package:kingtous_blog/blog/detail/providers/blog_detail_provider.dart';
import 'package:provider/provider.dart';
import 'package:markdown/markdown.dart' as md;

class BlogDetailPage extends StatefulWidget {
  @override
  _BlogDetailPageState createState() => _BlogDetailPageState();
}

class _BlogDetailPageState extends State<BlogDetailPage> {
  var _scrollController = ScrollController();
  var _markdownData = "";

  @override
  void initState() {
    super.initState();
    rootBundle
        .loadString(
            Provider.of<BlogDetailProvider>(context, listen: false).currentPath)
        .then((value) {
      setState(() {
        _markdownData = value;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("博文详情")),
      body: Container(
        alignment: Alignment.center,
        child: Markdown(
          controller: _scrollController,
          selectable: true,
          data: _markdownData,
          imageDirectory: '',
        ),
      ),
    );
  }
}
