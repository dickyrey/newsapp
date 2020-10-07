import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';

class NewsWebViewPage extends StatefulWidget {
  final String url;

  const NewsWebViewPage({Key key, this.url}) : super(key: key);
  @override
  _NewsWebViewPageState createState() => _NewsWebViewPageState();
}

class _NewsWebViewPageState extends State<NewsWebViewPage> {
  bool showLoading = false;
//  WebViewController _webViewController;

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body:  Container(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: <Widget>[
            Flexible(
              flex: 1,
              child:AppBar(
                backgroundColor: Colors.white,
                leading: IconButton(
                  icon: Icon(Icons.arrow_back),
                  onPressed: (){
                    Navigator.pop(context);
                  },
                  color: Colors.black,
                ),
              )
            )
            ,Flexible(
                flex: 9,
                child: Stack(
                  children: <Widget>[
                    WebView(
                      initialUrl: widget.url,
                      onPageFinished: (data){
                        updateLoading(false);
                      },
                      onPageStarted: (url) {
                        updateLoading(true);
                      },

                      javascriptMode: JavascriptMode.unrestricted,
                      onWebViewCreated: (webViewController){
                      },
                    ),
                    (showLoading)?Center(child: CircularProgressIndicator(),):Center()
                  ],
                )
            ),
          ],
        ),
      ),
    );
  }

  void updateLoading(bool value) {
    this.setState(() {
      showLoading = value;
    });
  }
}
