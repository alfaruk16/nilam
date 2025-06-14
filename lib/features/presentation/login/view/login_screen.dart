import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:nilam/core/ioc/global.dart';
import 'package:nilam/core/navigator/iflutter_navigator.dart';
import 'package:nilam/core/utils/colors.dart';
import 'package:nilam/core/utils/enums.dart';
import 'package:nilam/core/widgets/body.dart';
import 'package:nilam/core/widgets/button.dart';
import 'package:nilam/core/widgets/text.dart';
import 'package:nilam/core/widgets/text_field.dart';
import 'package:nilam/features/domain/repositories/api_repo.dart';
import 'package:nilam/features/domain/repositories/local_storage_repo.dart';
import 'package:nilam/features/presentation/login/bloc/login_bloc.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  static Route<dynamic> route() => MaterialPageRoute<dynamic>(
        builder: (_) => const LoginScreen(),
      );

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(providers: [
      BlocProvider(
          create: (context) => LoginBloc(getIt<ApiRepo>(),
              getIt<IFlutterNavigator>(), getIt<LocalStorageRepo>()))
    ], child: LoginView());
  }
}

class LoginView extends StatelessWidget {
  LoginView({super.key});

  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  final emailFocusNode = FocusNode();
  final passwordFocusNode = FocusNode();

  @override
  Widget build(BuildContext context) {
    //final size = MediaQuery.of(context).size;
    final bloc = context.read<LoginBloc>();

    return BlocBuilder<LoginBloc, LoginState>(
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
                    text: "Welcome", fontSize: 36, fontColor: Colors.white),
                const SizedBox(height: 20),
                const TextB(
                    text: "Sign in to your account",
                    fontSize: 20,
                    fontColor: Colors.white),
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
                        focusNode: emailFocusNode,
                        labelText: "Email or Phone",
                        onChanged: (text) {
                          bloc.add(EmailChanged(email: text));
                        },
                        errorText:
                            state.forms == Forms.invalid && state.email.isEmpty
                                ? "Enter Email or Phone"
                                : "",
                      ),
                      const SizedBox(height: 10),
                      TextFieldB(
                          focusNode: passwordFocusNode,
                          labelText: "Password",
                          obscureText: true,
                          onChanged: (text) {
                            bloc.add(PasswordChanged(password: text));
                          },
                          errorText: state.forms == Forms.invalid &&
                                  state.password.isEmpty
                              ? "Enter Password"
                              : ""),
                      const SizedBox(height: 20),
                      ButtonB(
                        text: "Sign In",
                        loading: state.loading,
                        press: () {
                          bloc.add(SignIn(
                              emailFocusNode: emailFocusNode,
                              passwordFocusNode: passwordFocusNode));
                        },
                      ),
                      const SizedBox(height: 10),
                      Container(
                        alignment: Alignment.centerRight,
                        child: const Text(
                          "Forgot Password?",
                          style: TextStyle(fontWeight: FontWeight.bold),
                        ),
                      ),
                      const SizedBox(height: 50),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          const Text(
                            "Don't Have an Account Yet?",
                            style: TextStyle(
                                fontWeight: FontWeight.bold, fontSize: 16),
                          ),
                          const SizedBox(width: 10),
                          GestureDetector(
                            onTap: () {
                              bloc.add(GoToSignUp());
                            },
                            child: const Text(
                              "Sign Up",
                              style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  color: buttonColor,
                                  fontSize: 16),
                            ),
                          ),
                        ],
                      )
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
