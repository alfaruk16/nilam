import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:nilam/core/ioc/global.dart';
import 'package:nilam/core/navigator/iflutter_navigator.dart';
import 'package:nilam/core/widgets/body.dart';
import 'package:nilam/features/presentation/online_payment/bloc/online_payment_bloc.dart';
import 'package:webview_flutter/webview_flutter.dart';

class OnlinePaymentScreen extends StatelessWidget {
  const OnlinePaymentScreen({super.key, required this.url});

  final String url;

  static Route<dynamic> route({required String url}) =>
      MaterialPageRoute<dynamic>(
        builder: (_) => OnlinePaymentScreen(url: url),
      );

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
        create: (context) => OnlinePaymentBloc(getIt<IFlutterNavigator>()),
        child: OnlinePaymentView(paymentUrl: url));
  }
}

class OnlinePaymentView extends StatelessWidget {
  OnlinePaymentView({super.key, required this.paymentUrl});

  final otpController = TextEditingController();
  final otpFocusNode = FocusNode();
  final String paymentUrl;

  @override
  Widget build(BuildContext context) {
    //final size = MediaQuery.of(context).size;
    final bloc = context.read<OnlinePaymentBloc>();

    final controller = WebViewController()
      ..setJavaScriptMode(JavaScriptMode.unrestricted)
      ..setNavigationDelegate(
        NavigationDelegate(
          onProgress: (int progress) {
            // Update loading bar.
          },
          onPageStarted: (String url) {},
          onPageFinished: (String url) {},
          onWebResourceError: (WebResourceError error) {},
          onNavigationRequest: (NavigationRequest request) {
            if (request.url.contains("payment-success")) {
              int l = request.url.length;
              String id = "";
              for (int i = l - 1; i < l; i--) {
                if (request.url.substring(i, i + 1) != "=") {
                  id = request.url.substring(i, i + 1) + id;
                } else {
                  break;
                }
              }
              bloc.add(PopToCart(id: id));
              // paymentController.paymentStatus(id);

              //paymentController.goToOrderDetailsViewPage(paymentController.orderId);
            }
            return NavigationDecision.navigate;
          },
        ),
      )
      ..loadRequest(Uri.parse(paymentUrl));

    return BlocBuilder<OnlinePaymentBloc, OnlinePaymentState>(
      builder: (context, state) {
        return Body(
            horizontalPadding: 0,
            child: Container(
              color: Colors.black87,
              child: WebViewWidget(controller: controller),
            ));
      },
    );
  }
}
