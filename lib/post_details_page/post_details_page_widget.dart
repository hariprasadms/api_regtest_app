import '../flutter_flow/flutter_flow_theme.dart';
import '../flutter_flow/flutter_flow_util.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class PostDetailsPageWidget extends StatefulWidget {
  const PostDetailsPageWidget({
    Key key,
    this.post,
    this.name,
  }) : super(key: key);

  final dynamic post;
  final String name;

  @override
  _PostDetailsPageWidgetState createState() => _PostDetailsPageWidgetState();
}

class _PostDetailsPageWidgetState extends State<PostDetailsPageWidget> {
  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: scaffoldKey,
      appBar: AppBar(
        backgroundColor: FlutterFlowTheme.primaryColor,
        automaticallyImplyLeading: true,
        title: Text(
          'Post',
          style: FlutterFlowTheme.bodyText1.override(
            fontFamily: 'Poppins',
            color: FlutterFlowTheme.tertiaryColor,
            fontSize: 19,
          ),
        ),
        actions: [],
        centerTitle: true,
        elevation: 4,
      ),
      backgroundColor: Color(0xFFF5F5F5),
      body: SafeArea(
        child: ListTile(
          title: Text(
            getJsonField(
              widget.post,
              r'''$.title''',
            ).toString(),
            style: FlutterFlowTheme.title3,
          ),
          subtitle: Text(
            'Lorem ipsum dolor...',
            style: FlutterFlowTheme.subtitle2,
          ),
          tileColor: Color(0xFFF5F5F5),
          dense: false,
        ),
      ),
    );
  }
}
