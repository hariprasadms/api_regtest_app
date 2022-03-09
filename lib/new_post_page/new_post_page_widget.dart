import '../flutter_flow/flutter_flow_theme.dart';
import '../flutter_flow/flutter_flow_util.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class NewPostPageWidget extends StatefulWidget {
  const NewPostPageWidget({
    Key key,
    this.newpost,
  }) : super(key: key);

  final dynamic newpost;

  @override
  _NewPostPageWidgetState createState() => _NewPostPageWidgetState();
}

class _NewPostPageWidgetState extends State<NewPostPageWidget> {
  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: scaffoldKey,
      appBar: AppBar(
        backgroundColor: FlutterFlowTheme.of(context).primaryColor,
        automaticallyImplyLeading: true,
        title: Text(
          getJsonField(
            widget.newpost,
            r'''$.title''',
          ).toString(),
          style: FlutterFlowTheme.of(context).bodyText1,
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
              widget.newpost,
              r'''$.body''',
            ).toString(),
            style: FlutterFlowTheme.of(context).title3,
          ),
          subtitle: Text(
            'Lorem ipsum dolor...',
            style: FlutterFlowTheme.of(context).subtitle2,
          ),
          tileColor: Color(0xFFF5F5F5),
          dense: false,
        ),
      ),
    );
  }
}
