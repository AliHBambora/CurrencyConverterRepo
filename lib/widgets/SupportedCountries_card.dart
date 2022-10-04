import 'package:flutter/material.dart';
import 'package:Currency_Converter/models/Currency.dart';

class SupportedCountriesCard extends StatefulWidget {
  //final Currency currency;
  final Currency currency;

  const SupportedCountriesCard({Key? key, required this.currency})
      : super(key: key);

  @override
  State<SupportedCountriesCard> createState() => _SupportedCountriesCardState();
}

class _SupportedCountriesCardState extends State<SupportedCountriesCard> {
  @override
  Widget build(BuildContext context) {
    return Container(
      // height: 100,
      width: double.infinity,
      margin: new EdgeInsets.symmetric(horizontal: 10.0, vertical: 10.0),
      padding: EdgeInsets.symmetric(horizontal: 10.0, vertical: 10.0),
      decoration: BoxDecoration(
          border: Border.all(color: Colors.blueAccent),
          borderRadius: BorderRadius.circular(15.0),
          color: Colors.white),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          CircleAvatar(
              backgroundImage: NetworkImage(
            "https://flagcdn.com/w20/${widget.currency.symbol.substring(0, widget.currency.symbol.length - 1).toLowerCase()}.png",
          )),
          const SizedBox(
            width: 10.0,
          ),
          Container(
            child: Text(widget.currency.symbol,
                style: const TextStyle(
                    fontSize: 14.0, fontWeight: FontWeight.bold)),
            width: 40.0,
          ),
          Expanded(
            child: Container(
              child: Text(
                widget.currency.name,
                overflow: TextOverflow.ellipsis,
                style: const TextStyle(
                    fontSize: 16.0,
                    fontWeight: FontWeight.bold,
                    color: Colors.black87),
              ),
              width: 10.0,
            ),
          )
        ],
      ),
    );
  }
}
