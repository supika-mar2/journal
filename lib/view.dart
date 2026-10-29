import 'package:flutter/material.dart';
import 'controller.dart';

class JournalPage extends StatefulWidget {
  const JournalPage({super.key});

  @override 
  State<JournalPage> createState() => _JournalPageState();
}

class _JournalPageState extends State<JournalPage> {
  var controller = JournalController();
  String keyword = '';

  @override 
  void initState() {
    super.initState();
    load();
  }

  Future<void> load() async {
    await controller.load();
    if (mounted) setState(() {});
  }

  @override 
  Widget build(BuildContext context) => Scaffold(
    appBar: AppBar(
      title: const Text('つぶやき表示'),
      backgroundColor: Colors.white,
    ),
    backgroundColor: Colors.white,
    body: Column( 
      children: [
        TextField(
          decoration: const InputDecoration(hintText: '検索'),
          onChanged: (s) => setState(() => keyword = s),
        ),
        Expanded(
          child: ListView( 
            children: [
              for (var p in controller.search(keyword))
                Column( 
                  children: [
                    ListTile( 
                      leading: Text(p['emoji']),
                      title: Text(p['user']),
                      subtitle: Text(p['text']),
                    ),
                    const Divider( 
                      height: 10,
                      thickness: 1,
                      color: Colors.grey,
                    ),
                  ]
                ),
            ],
          ),
        ),
      ],
    ),
  );
}
