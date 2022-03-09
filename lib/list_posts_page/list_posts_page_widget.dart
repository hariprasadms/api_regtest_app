import '../backend/api_requests/api_calls.dart';
import '../flutter_flow/flutter_flow_theme.dart';
import '../flutter_flow/flutter_flow_util.dart';
import 'package:easy_debounce/easy_debounce.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class ListPostsPageWidget extends StatefulWidget {
  const ListPostsPageWidget({Key key}) : super(key: key);

  @override
  _ListPostsPageWidgetState createState() => _ListPostsPageWidgetState();
}

class _ListPostsPageWidgetState extends State<ListPostsPageWidget> {
  TextEditingController textController;
  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    textController = TextEditingController();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: scaffoldKey,
      appBar: AppBar(
        backgroundColor: FlutterFlowTheme.of(context).primaryColor,
        automaticallyImplyLeading: true,
        title: Text(
          'All Posts',
          style: FlutterFlowTheme.of(context).bodyText1.override(
                fontFamily: 'Poppins',
                color: FlutterFlowTheme.of(context).tertiaryColor,
                fontSize: 18,
              ),
        ),
        actions: [
          Padding(
            padding: EdgeInsetsDirectional.fromSTEB(0, 0, 10, 0),
            child: Icon(
              Icons.add,
              color: FlutterFlowTheme.of(context).tertiaryColor,
              size: 30,
            ),
          ),
        ],
        centerTitle: true,
        elevation: 4,
      ),
      backgroundColor: Color(0xFFF5F5F5),
      body: SafeArea(
        child: Column(
          mainAxisSize: MainAxisSize.max,
          children: [
            TextFormField(
              onChanged: (_) => EasyDebounce.debounce(
                'textController',
                Duration(milliseconds: 0),
                () => setState(() {}),
              ),
              controller: textController,
              obscureText: false,
              decoration: InputDecoration(
                hintText: '[Some hint text...]',
                enabledBorder: UnderlineInputBorder(
                  borderSide: BorderSide(
                    color: Color(0x00000000),
                    width: 1,
                  ),
                  borderRadius: const BorderRadius.only(
                    topLeft: Radius.circular(4.0),
                    topRight: Radius.circular(4.0),
                  ),
                ),
                focusedBorder: UnderlineInputBorder(
                  borderSide: BorderSide(
                    color: Color(0x00000000),
                    width: 1,
                  ),
                  borderRadius: const BorderRadius.only(
                    topLeft: Radius.circular(4.0),
                    topRight: Radius.circular(4.0),
                  ),
                ),
              ),
              style: FlutterFlowTheme.of(context).bodyText1,
            ),
            Expanded(
              child: FutureBuilder<ApiCallResponse>(
                future: AllPostsCall.call(),
                builder: (context, snapshot) {
                  // Customize what your widget looks like when it's loading.
                  if (!snapshot.hasData) {
                    return Center(
                      child: SizedBox(
                        width: 50,
                        height: 50,
                        child: CircularProgressIndicator(
                          color: FlutterFlowTheme.of(context).primaryColor,
                        ),
                      ),
                    );
                  }
                  final listViewAllPostsResponse = snapshot.data;
                  return Builder(
                    builder: (context) {
                      final posts = AllPostsCall.getAllPosts(
                            (listViewAllPostsResponse?.jsonBody ?? ''),
                          )?.toList() ??
                          [];
                      return ListView.builder(
                        padding: EdgeInsets.zero,
                        scrollDirection: Axis.vertical,
                        itemCount: posts.length,
                        itemBuilder: (context, postsIndex) {
                          final postsItem = posts[postsIndex];
                          return ListTile(
                            title: Text(
                              getJsonField(
                                postsItem,
                                r'''$.title''',
                              ).toString(),
                              style: FlutterFlowTheme.of(context).title3,
                            ),
                            subtitle: Text(
                              'Lorem ipsum dolor...',
                              style: FlutterFlowTheme.of(context).subtitle2,
                            ),
                            trailing: Icon(
                              Icons.arrow_forward_ios,
                              color: Color(0xFF303030),
                              size: 20,
                            ),
                            tileColor: Color(0xFFF5F5F5),
                            dense: false,
                          );
                        },
                      );
                    },
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
