import 'package:flutter/material.dart';

import 'atom/home_title_atom.dart';
import 'organism/home_page_content_organism.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) => Scaffold(
        appBar: AppBar(
          title: const HomeTitleAtom(),
        ),
        body: const HomePageContentOrganism(),
      );
}
