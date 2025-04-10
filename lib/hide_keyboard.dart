import 'package:flutter/cupertino.dart' show BuildContext, FocusNode, FocusScope;

Future<void> hideKeyboard({required BuildContext context}) async{
  FocusScope.of(context).requestFocus(FocusNode());
}