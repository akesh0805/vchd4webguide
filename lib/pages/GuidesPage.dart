import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:vchd4webguide/models/guides.dart';
import 'package:vchd4webguide/pages/GuideTablePage.dart';

class GuidePage extends StatefulWidget {
  final String userName;
  const GuidePage({super.key, required this.userName});
  static const id = "Guide Page";
  @override
  State<GuidePage> createState() => _GuidepageState();
}

class _GuidepageState extends State<GuidePage> {
  @override
  Widget build(BuildContext context) {
    final guideData = Provider.of<Guides>(context);
    final guides = guideData.list;
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text("YO'RIQNOMALAR RO'YXATI"),
      ),
      body: ListView.builder(
        padding: const EdgeInsets.all(15),
        itemBuilder: (context, index) {
          return ListTile(
            onTap: () {
              Navigator.pushNamed(context, GuideTablePage.id);
            },
            leading: Text("VCHD TB"),
            title: Padding(
              padding: const EdgeInsets.only(left: 60),
              child: Text(guides[index].title, style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),),
            ),
            subtitle: Text(guides[index].about),
          );
        },
        itemCount: guides.length,
      ),
    );
  }
}
