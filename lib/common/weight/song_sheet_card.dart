import 'package:flutter/material.dart';

class SongSheetCard extends StatefulWidget {
  final num id;
  final String title;
  final String cover;

  const SongSheetCard(
      {Key? key, required this.id, required this.title, required this.cover})
      : super(key: key);

  @override
  State<StatefulWidget> createState() => _SongSheetCardState();
}

class _SongSheetCardState extends State<SongSheetCard> {
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        ClipRRect(
          borderRadius: const BorderRadius.all(Radius.circular(10)),
          child: widget.cover != ""
              ? Image.network(
                  widget.cover,
                  width: 115,
                  height: 115,
                  fit: BoxFit.cover,
                  // color: Theme.of(context).colorScheme.primary.withOpacity(0.1),
                )
              : Container(
                  width: 115,
                  height: 115,
                  color: Theme.of(context).colorScheme.primary.withOpacity(0.1),
            child:  Stack(
              alignment: Alignment.center,
              children: [
                Text(widget.title.substring(0,1),style: const TextStyle(
                  fontSize: 30,
                  fontWeight: FontWeight.bold
                ),)
              ],
            ),
                ),
        ),
        const SizedBox(
          height: 5,
        ),
        SizedBox(
          width: 115,
          child: Text(
            widget.title,
            textAlign: TextAlign.center,
            overflow: TextOverflow.ellipsis,
            maxLines: 1,
            softWrap: false,
          ),
        )
      ],
    );
  }
}
