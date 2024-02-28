import 'package:calculator_riverpod/button_widget.dart';
import 'package:calculator_riverpod/colors.dart';
import 'package:calculator_riverpod/riverpod.dart';
import 'package:calculator_riverpod/states.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

Future main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
    DeviceOrientation.portraitDown,
  ]);

  runApp(ProviderScope(child: MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  static final String title = 'Calculator';

  Widget build(BuildContext) => MaterialApp(
        debugShowCheckedModeBanner: false,
        title: title,
        theme: ThemeData(
          scaffoldBackgroundColor: MyColors.background1,
          visualDensity: VisualDensity.adaptivePlatformDensity,
        ),
        home: MainPage(title: title),
      );
}

class MainPage extends ConsumerStatefulWidget {
  final String title;

  const MainPage({
    super.key,
    required this.title,
  });

  @override
  ConsumerState<MainPage> createState() => _MainPageState();
}

class _MainPageState extends ConsumerState<MainPage> {
  @override
  Widget build(BuildContext context) => Scaffold(
        appBar: AppBar(
          elevation: 0,
          backgroundColor: Colors.transparent,
          title: Container(
            margin: EdgeInsets.only(left: 8),
            child: Text(widget.title),
          ),
        ),
        body: SafeArea(
          child: Column(
            children: <Widget>[
              Expanded(child: SizedBox()),
              Expanded(flex: 2, child: buildButtons())
            ],
          ),
        ),
      );
}

class PageBody extends ConsumerWidget {
  const PageBody({super.key});
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    var state = ref.watch(calculatorProvider);
    return Container(
      padding: const EdgeInsets.all(24),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Text(
            (state as InputUpdatedState).inputText,
            overflow: TextOverflow.ellipsis,
            style: TextStyle(color: Colors.white, fontSize: 36, height: 1),
          ),
        ],
      ),
    );
  }
}

Widget buildButtons() => Container(
      padding: EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: MyColors.background2,
        borderRadius: BorderRadius.vertical(top: Radius.circular(32)),
      ),
      child: const Column(
        children: <Widget>[
          ButtonRow(
              first: 'AC', '<', '', '÷',
              second: '7', '8', '9', 'x',
              third: '4', '5', '6', '-',
              fourth: '0', '.', '', '=',),
        ],
      ),
    );

class ButtonRow extends ConsumerWidget {
  final String first;
  final String second;
  final String third;
  final String fourth;
  const ButtonRow(
      {super.key,
      required this.first,
      required this.second,
      required this.third,
      required this.fourth});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final row = [first, second, third, fourth];

    return Expanded(
      child: Row(
        children: row
            .map((text) => ButtonWidget(
                  text: text,
                  onClicked: () => onClickedButton(text, ref),
                  onClickedLong: () => onLongClickedButton(text, ref),
                ))
            .toList(),
      ),
    );
  }
}

void onClickedButton(String buttonText, WidgetRef ref) {
  final calculator = ref.read(calculatorProvider.notifier);
}

void onLongClickedButton(String text, WidgetRef ref) {
  final calculator = ref.read(calculatorProvider.notifier);

 
}
