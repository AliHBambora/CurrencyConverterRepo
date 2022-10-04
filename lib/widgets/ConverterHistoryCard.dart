import 'package:Currency_Converter/models/ConversionHistory.dart';
import 'package:flutter/material.dart';

import '../models/Currency.dart';

class ConverterHistoryCard extends StatefulWidget {
  final ConversionHistory ch;
  const ConverterHistoryCard({Key? key, required this.ch}) : super(key: key);

  @override
  State<ConverterHistoryCard> createState() => _ConverterHistoryCardState();
}

class _ConverterHistoryCardState extends State<ConverterHistoryCard> {
  @override
  Widget build(BuildContext context) {
    var screenHeight = MediaQuery.of(context).size.height;
    var screenWidth = MediaQuery.of(context).size.width;

    return Container(
      margin: EdgeInsets.symmetric(
          horizontal: screenWidth * 0.05, vertical: screenHeight * 0.03),
      width: screenWidth * 0.70,
      padding: EdgeInsets.all(8),
      decoration: BoxDecoration(
          border: Border.all(color: Colors.blueAccent),
          borderRadius: BorderRadius.circular(15)),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          Container(
            width: screenWidth * 0.20,
            child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      CircleAvatar(
                          backgroundImage: NetworkImage(
                        "https://flagcdn.com/w40/${widget.ch.fromCurrencyCode.substring(0, widget.ch.fromCurrencyCode.length - 1).toLowerCase()}.png",
                      )),
                      const SizedBox(width: 8.0),
                      Text(
                        "${widget.ch.fromCurrencyCode}",
                        style: TextStyle(
                            fontSize: 15.0, fontWeight: FontWeight.bold),
                      ),
                    ],
                  ),
                  const SizedBox(height: 10.0),
                  Container(
                    child: Text(
                      "${widget.ch.fromCurrencyAmount} ${widget.ch.fromCurrencyName}",
                      style: TextStyle(
                          fontSize: 14.0, fontWeight: FontWeight.bold),
                    ),
                  )
                ]),
          ),
          Container(
              width: screenWidth * 0.21,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Container(
                    height: screenHeight * 0.08,
                    child: Icon(Icons.arrow_forward_rounded,
                        size: 50, color: Colors.black87),
                  ),
                  Container(
                      height: screenHeight * 0.05,
                      child: Text(
                        "${widget.ch.conversionDate}",
                        overflow: TextOverflow.ellipsis,
                        style: TextStyle(
                            fontSize: 13.0, fontWeight: FontWeight.bold),
                      )),
                ],
              )),
          Container(
            width: screenWidth * 0.30,
            child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Row(
                    children: [
                      CircleAvatar(
                          backgroundImage: NetworkImage(
                        "https://flagcdn.com/w40/${widget.ch.toCurrencyCode.substring(0, widget.ch.toCurrencyCode.length - 1).toLowerCase()}.png",
                      )),
                      const SizedBox(width: 8.0),
                      Text(
                        "${widget.ch.toCurrencyCode}",
                        style: TextStyle(
                            fontSize: 15.0, fontWeight: FontWeight.bold),
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 10.0,
                  ),
                  Text(
                      "${widget.ch.toCurrencyAmount} ${widget.ch.toCurrencyName}",
                      overflow: TextOverflow.ellipsis,
                      style: TextStyle(
                          fontSize: 14.0, fontWeight: FontWeight.bold)),
                ]),
          ),
        ],
      ),
    );
  }
}
