import 'package:flutter/material.dart';
import 'package:mingo/presentation/components/atoms/custom_text.dart';

class ContentCard extends StatefulWidget {

  final VoidCallback onTap;
  final String url;
  final String titleCard;
  final String subtitle;

  const ContentCard({super.key, required this.onTap, required this.url, required this.titleCard, required this.subtitle});

  @override
  State<ContentCard> createState() => _ContentCardState();
}

class _ContentCardState extends State<ContentCard> {
  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 0,
      child: ListTile(
        contentPadding: const EdgeInsets.symmetric(vertical: 10.0, horizontal: 15.0),
          leading: ClipRRect(
            borderRadius: BorderRadius.circular(10), // Radio alto para que sea un círculo
            child: Image.network(
              widget.url,
              width: 80,
              height: 100,
              fit: BoxFit.cover, // Importante: llena el círculo sin deformarse
            ),
          ),        title: CustomText(fontSize: 17, color: Colors.black, text: widget.titleCard,),
        subtitle: CustomText(fontWeight: FontWeight.w300,fontSize: 12, color: Colors.black, text: widget.subtitle),
        onTap: widget.onTap
      ),
    );
  }
}
