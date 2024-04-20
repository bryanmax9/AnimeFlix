import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_swipeable_stack.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'package:flutter/material.dart';
import 'swipe_page_model.dart';
export 'swipe_page_model.dart';

class SwipePageWidget extends StatefulWidget {
  const SwipePageWidget({super.key});

  @override
  State<SwipePageWidget> createState() => _SwipePageWidgetState();
}

class _SwipePageWidgetState extends State<SwipePageWidget> {
  late SwipePageModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => SwipePageModel());

    WidgetsBinding.instance.addPostFrameCallback((_) => setState(() {}));
  }

  @override
  void dispose() {
    _model.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => _model.unfocusNode.canRequestFocus
          ? FocusScope.of(context).requestFocus(_model.unfocusNode)
          : FocusScope.of(context).unfocus(),
      child: Scaffold(
        key: scaffoldKey,
        backgroundColor: FlutterFlowTheme.of(context).secondaryBackground,
        appBar: AppBar(
          backgroundColor: FlutterFlowTheme.of(context).secondaryBackground,
          automaticallyImplyLeading: false,
          title: Align(
            alignment: const AlignmentDirectional(0.0, -1.0),
            child: Text(
              'AnimeFlix',
              style: FlutterFlowTheme.of(context).titleMedium.override(
                    fontFamily: 'Outfit',
                    color: FlutterFlowTheme.of(context).secondary,
                    fontSize: 40.0,
                    letterSpacing: 0.0,
                  ),
            ),
          ),
          actions: const [],
          centerTitle: false,
          elevation: 0.0,
        ),
        body: SafeArea(
          top: true,
          child: Column(
            mainAxisSize: MainAxisSize.max,
            children: [
              Expanded(
                child: StreamBuilder<List<MoviesRecord>>(
                  stream: queryMoviesRecord(),
                  builder: (context, snapshot) {
                    // Customize what your widget looks like when it's loading.
                    if (!snapshot.hasData) {
                      return Center(
                        child: SizedBox(
                          width: 50.0,
                          height: 50.0,
                          child: CircularProgressIndicator(
                            valueColor: AlwaysStoppedAnimation<Color>(
                              FlutterFlowTheme.of(context).primary,
                            ),
                          ),
                        ),
                      );
                    }
                    List<MoviesRecord> swipeableStackMoviesRecordList =
                        snapshot.data!;
                    return FlutterFlowSwipeableStack(
                      onSwipeFn: (index) {},
                      onLeftSwipe: (index) {},
                      onRightSwipe: (index) async {
                        final swipeableStackMoviesRecord =
                            swipeableStackMoviesRecordList[index];

                        await currentUserReference!.update({
                          ...mapToFirestore(
                            {
                              'MyList': FieldValue.arrayUnion([
                                swipeableStackMoviesRecordList[index].reference
                              ]),
                            },
                          ),
                        });

                        await swipeableStackMoviesRecordList[index]
                            .reference
                            .update({
                          ...mapToFirestore(
                            {
                              'LikedByUsers':
                                  FieldValue.arrayUnion([currentUserReference]),
                            },
                          ),
                        });
                      },
                      onUpSwipe: (index) {},
                      onDownSwipe: (index) {},
                      itemBuilder: (context, swipeableStackIndex) {
                        final swipeableStackMoviesRecord =
                            swipeableStackMoviesRecordList[swipeableStackIndex];
                        return Container(
                          width: 367.0,
                          height: 100.0,
                          decoration: BoxDecoration(
                            color: FlutterFlowTheme.of(context).alternate,
                            borderRadius: const BorderRadius.only(
                              bottomLeft: Radius.circular(8.0),
                              bottomRight: Radius.circular(8.0),
                              topLeft: Radius.circular(8.0),
                              topRight: Radius.circular(8.0),
                            ),
                          ),
                          child: Column(
                            mainAxisSize: MainAxisSize.max,
                            children: [
                              Expanded(
                                child: Padding(
                                  padding: const EdgeInsetsDirectional.fromSTEB(
                                      20.0, 20.0, 20.0, 12.0),
                                  child: ClipRRect(
                                    borderRadius: BorderRadius.circular(8.0),
                                    child: Image.network(
                                      swipeableStackMoviesRecord.image,
                                      width: double.infinity,
                                      height: 200.0,
                                      fit: BoxFit.cover,
                                    ),
                                  ),
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsetsDirectional.fromSTEB(
                                    20.0, 0.0, 20.0, 20.0),
                                child: Row(
                                  mainAxisSize: MainAxisSize.max,
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text(
                                      swipeableStackMoviesRecord.title,
                                      style: FlutterFlowTheme.of(context)
                                          .bodyMedium
                                          .override(
                                            fontFamily: 'Outfit',
                                            letterSpacing: 0.0,
                                          ),
                                    ),
                                    Text(
                                      swipeableStackMoviesRecord.year
                                          .toString(),
                                      style: FlutterFlowTheme.of(context)
                                          .bodyMedium
                                          .override(
                                            fontFamily: 'Outfit',
                                            letterSpacing: 0.0,
                                          ),
                                    ),
                                  ],
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsetsDirectional.fromSTEB(
                                    20.0, 0.0, 20.0, 20.0),
                                child: Row(
                                  mainAxisSize: MainAxisSize.max,
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceAround,
                                  children: [
                                    InkWell(
                                      splashColor: Colors.transparent,
                                      focusColor: Colors.transparent,
                                      hoverColor: Colors.transparent,
                                      highlightColor: Colors.transparent,
                                      onTap: () async {
                                        _model.swipeableStackController
                                            .swipeLeft();
                                      },
                                      child: Icon(
                                        Icons.thumb_down,
                                        color: FlutterFlowTheme.of(context)
                                            .primaryText,
                                        size: 40.0,
                                      ),
                                    ),
                                    InkWell(
                                      splashColor: Colors.transparent,
                                      focusColor: Colors.transparent,
                                      hoverColor: Colors.transparent,
                                      highlightColor: Colors.transparent,
                                      onTap: () async {
                                        context.pushNamed(
                                          'MovieDetails',
                                          queryParameters: {
                                            'recieveMovie': serializeParam(
                                              swipeableStackMoviesRecord
                                                  .reference,
                                              ParamType.DocumentReference,
                                            ),
                                          }.withoutNulls,
                                        );
                                      },
                                      child: Icon(
                                        Icons.info_rounded,
                                        color: FlutterFlowTheme.of(context)
                                            .primaryText,
                                        size: 40.0,
                                      ),
                                    ),
                                    InkWell(
                                      splashColor: Colors.transparent,
                                      focusColor: Colors.transparent,
                                      hoverColor: Colors.transparent,
                                      highlightColor: Colors.transparent,
                                      onTap: () async {
                                        _model.swipeableStackController
                                            .swipeRight();
                                      },
                                      child: Icon(
                                        Icons.thumb_up,
                                        color: FlutterFlowTheme.of(context)
                                            .primaryText,
                                        size: 40.0,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        );
                      },
                      itemCount: swipeableStackMoviesRecordList.length,
                      controller: _model.swipeableStackController,
                      loop: false,
                      cardDisplayCount: 3,
                      scale: 0.9,
                    );
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
