import 'package:flutter/material.dart';
import 'package:mingo/views/components/molecules/tollbar.dart';
import 'package:mingo/views/components/organisms/download_content_form.dart';
import 'package:mingo/views/components/organisms/list_download_content.dart';

class DownloadContentTemplate extends StatefulWidget {
  const DownloadContentTemplate({super.key});

  @override
  State<DownloadContentTemplate> createState() => _DownloadContentTemplateState();
}

class _DownloadContentTemplateState extends State<DownloadContentTemplate> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: Tollbar(titlePage: 'Módulos de Aprendizaje', reverse: true,),
      body: Column(
        children: [
          ListDownloadContent(),
          DownloadContentForm()
        ],
      )
    );
  }
}
