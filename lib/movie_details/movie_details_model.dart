import '/flutter_flow/flutter_flow_util.dart';
import 'movie_details_widget.dart' show MovieDetailsWidget;
import 'package:flutter/material.dart';

class MovieDetailsModel extends FlutterFlowModel<MovieDetailsWidget> {
  ///  State fields for stateful widgets in this page.

  final unfocusNode = FocusNode();

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {
    unfocusNode.dispose();
  }
}
