import 'package:app_hive/index.dart';
import 'package:codeofland/codeofland.dart';
import 'package:core/core.dart';
import 'package:flutter/material.dart';

mixin HomeDrawerMixin on StatelessWidget {
  Future<String> userName() async {
    final metaData = AppMetaDataBase();
    await metaData.openBox();
    final data = metaData.readBox(MetaKeys.key.text);
    if (data == null) return "";
    if (data.user == null) return "";
    if (data.user!.username == null) return "";
    return data.user!.username!;
  }

  void logOutFunction() async {
    final metaData = AppMetaDataBase();
    await metaData.openBox();
    await metaData.logOutUser();
    //
    await ScaffoldKeys.of.homeKey.pushReplacementNamedNullable(
      MyRoute.authLogin.name,
    );
  }

  Widget futureText() {
    return FutureBuilder(
      future: userName(),
      builder: (context, AsyncSnapshot<String> snapshot) {
        if (snapshot.hasData) {
          if (snapshot.data.isNotNullOrEmpty) {
            return Text(snapshot.data!);
          }
        }
        return const Text("");
      },
    );
  }
}
