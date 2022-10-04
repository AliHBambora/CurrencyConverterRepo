import 'package:Currency_Converter/DataBaseProvider/HiveConversionHistoryProvider.dart';
import 'package:Currency_Converter/widgets/ConverterHistoryCard.dart';
import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';

import '../models/ConversionHistory.dart';

class ConverterHistoryScreen extends StatefulWidget {
  final HiveConversionHistoryDBProvider
      dbprovider; //Dependency injection of the Database provider for the conversion history

  //Future<List<ConversionHistory>> chList;
  ConverterHistoryScreen({Key? key, required this.dbprovider})
      : super(key: key);

  @override
  State<ConverterHistoryScreen> createState() => _ConverterHistoryState();
}

class _ConverterHistoryState extends State<ConverterHistoryScreen> {
  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
    Hive.box('Currency').close();
    super.dispose();
  }

  bool toggle = false; //State used for refreshing the screen

  Future<List<ConversionHistory>> getallConverHistory() async {
    return await widget.dbprovider.getAllConversionHistory();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text("Last 7 days conversion"),
      ),
      body: SafeArea(
          child: FutureBuilder<List<ConversionHistory>>(
        future: getallConverHistory(),
        builder: (BuildContext context,
            AsyncSnapshot<List<ConversionHistory>> snapshot) {
          if (!snapshot.hasData) {
            return const Center(
                child: CircularProgressIndicator(color: Colors.blueAccent));
          }
          return ListView.builder(
              itemCount: snapshot.data!.length,
              itemBuilder: (BuildContext context, int index) {
                ConversionHistory ch = snapshot.data![index];
                return ConverterHistoryCard(ch: ch);
              });
        },
      )),
      floatingActionButton: FloatingActionButton(
          child: Icon(
            Icons.refresh,
            size: 30.0,
          ),
          backgroundColor: Colors.blueAccent,
          foregroundColor: Colors.white,
          elevation: 5,
          onPressed: () {
            setState(() {
              toggle = !toggle;
            });
          }),
    );
  }
}
