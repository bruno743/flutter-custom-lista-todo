import 'package:device_preview/device_preview.dart';
//import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:lista_todo/screens/all_lists.dart';
import 'package:lista_todo/screens/list.dart';
import 'package:lista_todo/providers/task.dart';

// rgb(25, 67, 80) dark green
// rgb(255, 136, 130) pink orange
// rgb(255, 194, 180) light pink
// rgb(157, 190, 185) light green

/*void main() {
  runApp(DevicePreview(
    enabled: kReleaseMode,
    builder: (context) => const ProviderScope(child: MyApp()),
  ));
}*/

void main() {
  runApp(
    const ProviderScope(child: MyApp()),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
          scaffoldBackgroundColor: const Color.fromARGB(255, 255, 194, 180),
          iconTheme:
              const IconThemeData(color: Color.fromARGB(255, 25, 67, 80))),
      //DevicePreview
      locale: DevicePreview.locale(context),
      builder: DevicePreview.appBuilder,
      debugShowCheckedModeBanner: false,
      //DevicePreview

      initialRoute: '/pre',
      routes: {
        '/': (contex) => const AllLists(),
        '/list': (context) => const List(),
        '/pre': (context) => const Preview(),
      },
    );
  }
}

class Preview extends ConsumerStatefulWidget {
  const Preview({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _PreviewState();
}

class _PreviewState extends ConsumerState<Preview> {
  @override
  void initState() {
    super.initState();
    _navigateToMain();
  }

  _navigateToMain() async {
    ref
        .read(tasksProvider.notifier)
        .loadAll()
        .then((_) => Navigator.pushNamed(context, '/'));
  }

  @override
  Widget build(BuildContext context) {
    return Container();
  }
}
