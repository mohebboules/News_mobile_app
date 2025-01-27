import 'package:flutter/material.dart';
import 'package:news_app/views/home_view.dart';
import 'package:news_app/widgets/app_bar_text.dart';
import 'package:webview_flutter/webview_flutter.dart';

class WebViewScreen extends StatefulWidget {
  const WebViewScreen({super.key, required this.url});
  final String url;

  @override
  State<WebViewScreen> createState() => _WebViewScreenState();
}

class _WebViewScreenState extends State<WebViewScreen> {
  late final WebViewController controller;
  bool isLoading = true;

  @override
  void initState() {
    super.initState();
    initializingWebView();
  }

  Future<void> initializingWebView() async {
    controller = WebViewController()
      ..setJavaScriptMode(JavaScriptMode.unrestricted)
      ..setNavigationDelegate(
        NavigationDelegate(onPageStarted: (url) {
          setState(() {
            isLoading = true;
          });
        }, onPageFinished: (url) {
          setState(() {
            isLoading = false;
          });
        }, onHttpError: (HttpResponseError error) {
          setState(() {
            isLoading = false;
          });
        }),
      );
    try {
      await controller.loadRequest(Uri.parse(widget.url));
    } catch (e) {
      setState(() {
        isLoading = false;
      });
      WidgetsBinding.instance.addPostFrameCallback((_) {
        _showErrorSnackBar();
      });
    }
  }

  void _showErrorSnackBar() {
    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(
        content: Text('Error displaying URL'),
        backgroundColor: Colors.red,
        duration: Duration(seconds: 2),
      ),
    );

    Future.delayed(const Duration(seconds: 2), () {
      if (mounted) {
        Navigator.pop(context);
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const AppBarText(),
        backgroundColor: Colors.transparent,
        elevation: 0,
        centerTitle: true,
        leading: IconButton(
          onPressed: (() {
            Navigator.pop(
              context,
              MaterialPageRoute(builder: (context) => const HomeView()),
            );
          }),
          icon: const Icon(Icons.arrow_back_ios),
        ),
      ),
      body: isLoading
          ? const Center(
              child: CircularProgressIndicator(),
            )
          : WebViewWidget(controller: controller),
    );
  }
}
