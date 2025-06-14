import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:nilam/core/ioc/global.dart';
import 'package:nilam/core/navigator/iflutter_navigator.dart';
import 'package:nilam/core/utils/enums.dart';
import 'package:nilam/core/widgets/body.dart';
import 'package:nilam/core/widgets/button.dart';
import 'package:nilam/core/widgets/text.dart';
import 'package:nilam/core/widgets/text_field.dart';
import 'package:nilam/features/domain/repositories/api_repo.dart';
import 'package:nilam/features/domain/repositories/local_storage_repo.dart';
import 'package:nilam/features/presentation/otp/bloc/otp_bloc.dart';

class OtpScreen extends StatelessWidget {
  const OtpScreen({super.key, required this.requestOtp});

  final bool requestOtp;

  static Route<dynamic> route({required bool requestOtp}) =>
      MaterialPageRoute<dynamic>(
        builder: (_) => OtpScreen(requestOtp: requestOtp),
      );

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
        create: (context) => OtpBloc(getIt<ApiRepo>(),
            getIt<IFlutterNavigator>(), getIt<LocalStorageRepo>())
          ..add(GetProfile(requestOtp: requestOtp)),
        child: OtpView());
  }
}

class OtpView extends StatelessWidget {
  OtpView({super.key});

  final otpController = TextEditingController();
  final otpFocusNode = FocusNode();

  @override
  Widget build(BuildContext context) {
    //final size = MediaQuery.of(context).size;
    final bloc = context.read<OtpBloc>();

    return BlocBuilder<OtpBloc, OtpState>(
      builder: (context, state) {
        return Body(
          horizontalPadding: 0,
          child: Container(
            color: Colors.black87,
            child: Column(
              children: [
                SizedBox(
                  height: 50,
                  child: Row(
                    children: [
                      const SizedBox(width: 15),
                      GestureDetector(
                        onTap: () {
                          Navigator.pop(context);
                        },
                        child: const Icon(Icons.arrow_back_ios,
                            color: Colors.white),
                      ),
                      const SizedBox(width: 15),
                    ],
                  ),
                ),
                const TextB(
                    text: "Enter Code", fontSize: 36, fontColor: Colors.white),
                const SizedBox(height: 20),
                Container(
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  child: TextB(
                      text:
                          "Please check your username( ${state.profile.mobile ?? ''} ), we have sent an OTP for you",
                      fontSize: 16,
                      fontColor: Colors.white),
                ),
                const SizedBox(height: 30),
                Expanded(
                    child: Container(
                  color: Colors.white,
                  padding: const EdgeInsets.all(20),
                  child: ListView(
                    padding: EdgeInsets.zero,
                    children: [
                      const SizedBox(height: 10),
                      TextFieldB(
                        focusNode: otpFocusNode,
                        labelText: "OTP",
                        onChanged: (text) {
                          bloc.add(OtpChanged(email: text));
                        },
                        errorText: state.forms == Forms.invalid &&
                                state.password.isEmpty
                            ? "Enter OTP"
                            : "",
                      ),
                      const SizedBox(height: 10),
                      ButtonB(
                        text: "Submit OTP",
                        loading: state.loading,
                        press: () {
                          bloc.add(SubmitOtp(otpFocusNode: otpFocusNode));
                        },
                      ),
                      const SizedBox(height: 10),
                    ],
                  ),
                ))
              ],
            ),
          ),
        );
      },
    );
  }
}
