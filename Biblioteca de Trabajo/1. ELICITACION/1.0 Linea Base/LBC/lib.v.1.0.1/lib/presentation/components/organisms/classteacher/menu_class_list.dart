import 'package:flutter/material.dart';
import 'package:mingo/data/models/code_model.dart';
import 'package:mingo/presentation/components/organisms/classteacher/card/menu_class_card.dart';

class MenuClassList extends StatefulWidget {

  final List<CodeModel> codes;

  const MenuClassList({super.key, required this.codes});

  @override
  State<MenuClassList> createState() => _MenuClassListState();
}

class _MenuClassListState extends State<MenuClassList> {

  @override
  Widget build(BuildContext context) {

    if (widget.codes.isEmpty) {
      return const SliverFillRemaining(
        hasScrollBody: false,
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(Icons.search_off, size: 64, color: Colors.grey),
              SizedBox(height: 16),
              Text(
                'No se encontró ninguna clase',
                style: TextStyle(color: Colors.grey, fontSize: 16),
              ),
            ],
          ),
        ),
      );
    }

    return SliverList(
        delegate: SliverChildBuilderDelegate(
              (context, index) {
            final content = widget.codes[index];
            return MenuClassCard(
              onTap: () {
              },
              titleCard: content.code,
              subtitleCard: content.date,
            );
          },
          childCount: widget.codes.length,
        )
    );
  }
}
