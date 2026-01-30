import 'package:flutter/material.dart';
import 'package:mingo/presentation/components/organisms/contents/content_list.dart';
import 'package:mingo/presentation/components/organisms/toll_bar.dart';
import 'package:mingo/presentation/viewmodels/content_beginner_viewmodel.dart';
import 'package:provider/provider.dart';

class ContentBeginnerTemplate extends StatefulWidget {
  const ContentBeginnerTemplate({super.key});

  @override
  State<ContentBeginnerTemplate> createState() => _ContentBeginnerTemplateState();
}

class _ContentBeginnerTemplateState extends State<ContentBeginnerTemplate> {

  final TextEditingController _searchController = TextEditingController();

  @override
  void dispose() {
    _searchController.dispose();
    super.dispose();
  }

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      context.read<ContentBeginnerViewModel>().loadContenetBeginner();
    });
  }


  @override
  Widget build(BuildContext context) {

    final vm = context.watch<ContentBeginnerViewModel>();

    return Scaffold(
      appBar: AppBar(
        title: TollBar(titlePage: 'Contenido Principiante', reverse: true,),
      ),
      backgroundColor: Color.fromRGBO(192, 223, 254, 1.0),
      body: CustomScrollView(
        slivers: [
          SliverAppBar(
            backgroundColor: Colors.white,
            automaticallyImplyLeading: false,
            floating: false,
            pinned: true,
            toolbarHeight: 75,
            title: Container(
              height: 45,
              decoration: BoxDecoration(
                color: Colors.grey[200],
                borderRadius: BorderRadius.circular(15),
              ),
              child: TextField(
                controller: _searchController,
                onChanged: (value) {
                  if (value.trim().isNotEmpty) {
                    // Usamos read aquí para no reconstruir todo al escribir
                    // context.read<SongsViewModel>().searchOnline(value);
                  }
                },
                style: const TextStyle(color: Colors.black),
                decoration: const InputDecoration(
                  hintText: "Buscar contenido...",
                  hintStyle: TextStyle(color: Colors.black54, fontSize: 16),
                  prefixIcon: Icon(Icons.search, color: Colors.black54),
                  border: InputBorder.none,
                  contentPadding: EdgeInsets.symmetric(vertical: 10),
                ),
              ),
            )
          ),

          if (vm.loading)
            const SliverFillRemaining(
              child: Center(child: CircularProgressIndicator(color: Colors.black)),
            ),
          if (!vm.loading)
            SliverPadding(
              padding: const EdgeInsets.all(16.0),
              sliver: ContentList(contents: vm.beginner),
            ),
        ]
      ),

    );
  }
}
