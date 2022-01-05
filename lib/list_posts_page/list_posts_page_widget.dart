import '../backend/api_requests/api_calls.dart';
import '../flutter_flow/flutter_flow_theme.dart';
import '../flutter_flow/flutter_flow_util.dart';
import '../post_details_page/post_details_page_widget.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class ListPostsPageWidget extends StatefulWidget {
  const ListPostsPageWidget({Key key}) : super(key: key);

  @override
  _ListPostsPageWidgetState createState() => _ListPostsPageWidgetState();
}

class _ListPostsPageWidgetState extends State<ListPostsPageWidget> {
  ApiCallResponse apiCallOutput;
  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: scaffoldKey,
      appBar: AppBar(
        backgroundColor: FlutterFlowTheme.primaryColor,
        automaticallyImplyLeading: true,
        title: Text(
          'All Posts',
          style: FlutterFlowTheme.bodyText1.override(
            fontFamily: 'Poppins',
            color: FlutterFlowTheme.tertiaryColor,
            fontSize: 18,
          ),
        ),
        actions: [
          Padding(
            padding: EdgeInsetsDirectional.fromSTEB(0, 0, 10, 0),
            child: InkWell(
              onTap: () async {
                apiCallOutput = await CreateAPostCall.call(
                  title: 'Hari',
                  body: 'Added',
                );
                if (apiCallOutput.succeeded) {
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(
                      content: Text(
                        'Added',
                        style: TextStyle(),
                      ),
                      duration: Duration(milliseconds: 4000),
                      backgroundColor: Color(0x00000000),
                    ),
                  );
                }

                setState(() {});
              },
              child: Icon(
                Icons.add,
                color: FlutterFlowTheme.tertiaryColor,
                size: 30,
              ),
            ),
          ),
        ],
        centerTitle: true,
        elevation: 4,
      ),
      backgroundColor: Color(0xFFF5F5F5),
      body: SafeArea(
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
                    color: FlutterFlowTheme.primaryColor,
                  ),
                ),
              );
            }
            final listViewAllPostsResponse = snapshot.data;
            return Builder(
              builder: (context) {
                final posts = AllPostsCall.getAllPosts(
                      listViewAllPostsResponse.jsonBody,
                    )?.toList() ??
                    [];
                return ListView.builder(
                  padding: EdgeInsets.zero,
                  scrollDirection: Axis.vertical,
                  itemCount: posts.length,
                  itemBuilder: (context, postsIndex) {
                    final postsItem = posts[postsIndex];
                    return InkWell(
                      onTap: () async {
                        await Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => PostDetailsPageWidget(
                              post: postsItem,
                              name: 'hari',
                            ),
                          ),
                        );
                      },
                      child: ListTile(
                        title: Text(
                          getJsonField(
                            postsItem,
                            r'''$.title''',
                          ).toString(),
                          style: FlutterFlowTheme.title3,
                        ),
                        subtitle: Text(
                          'Lorem ipsum dolor...',
                          style: FlutterFlowTheme.subtitle2,
                        ),
                        trailing: Icon(
                          Icons.arrow_forward_ios,
                          color: Color(0xFF303030),
                          size: 20,
                        ),
                        tileColor: Color(0xFFF5F5F5),
                        dense: false,
                      ),
                    );
                  },
                );
              },
            );
          },
        ),
      ),
    );
  }
}
