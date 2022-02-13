import 'package:flutter/material.dart';
import 'package:video_downloader/services/downloader.dart';
import 'package:webview_flutter/webview_flutter.dart';

class BrowserScreen extends StatefulWidget {
  const BrowserScreen({Key? key}) : super(key: key);

  @override
  State<BrowserScreen> createState() => _BrowserScreenState();
}

class _BrowserScreenState extends State<BrowserScreen> {
  final link = "https://www.youtube.com";
  WebViewController? _webviewController;
  bool _showDownloadButton = false;

  @override
  Widget build(BuildContext context) {
    checkUrl();
    return WillPopScope(
      onWillPop: () async {
        if (await _webviewController!.canGoBack()) {
          _webviewController!.goBack();
        }
        return false;
      },
      child: Scaffold(
        backgroundColor: Colors.white,
        body: WebView(
          initialUrl: link,
          javascriptMode: JavascriptMode.unrestricted,
          onWebViewCreated: (controller) {
            setState(() {
              _webviewController = controller;
            });
          },
        ),
        floatingActionButton: _showDownloadButton == false
            ? Container()
            : FloatingActionButton(
                backgroundColor: Colors.red,
                onPressed: () async {
                  // ignore: avoid_print
                  print(await _webviewController!.currentUrl());
                  final _url = await _webviewController!.currentUrl();
                  final title = await _webviewController!.getTitle();
                  // ignore: avoid_print
                  print(title);
                  Download().downloadVideo(_url!, title!);
                },
                child: const Icon(Icons.download),
              ),
      ),
    );
  }

  // İndirilcek olan videonun linkini kontrol etme
  void checkUrl() async {
    if (await _webviewController!.currentUrl() == "https://m.youtube.com/" ||
        // ignore: unrelated_type_equality_checks
        _webviewController!.currentUrl() == "https://www.youtube.com/") {
      setState(() {
        _showDownloadButton = false;
      });
    } else {
      setState(() {
        _showDownloadButton = true;
      });
    }
  }
}
