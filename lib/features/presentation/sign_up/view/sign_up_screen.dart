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

import 'package:nilam/features/presentation/sign_up/bloc/sign_up_bloc.dart';

class SignUpScreen extends StatelessWidget {
  const SignUpScreen({super.key});

  static Route<dynamic> route() => MaterialPageRoute<dynamic>(
        builder: (_) => const SignUpScreen(),
      );

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
        create: (context) => SignUpBloc(getIt<ApiRepo>(),
            getIt<IFlutterNavigator>(), getIt<LocalStorageRepo>()),
        child: SignUpView());
  }
}

class SignUpView extends StatelessWidget {
  SignUpView({super.key});

  final firstNameController = TextEditingController();
  final lastNameController = TextEditingController();
  final phoneController = TextEditingController();
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  final confirmPasswordController = TextEditingController();
  final firstNameFocusNode = FocusNode();
  final lastNameFocusNode = FocusNode();
  final phoneFocusNode = FocusNode();
  final emailFocusNode = FocusNode();
  final passwordFocusNode = FocusNode();
  final confirmPasswordFocusNode = FocusNode();

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final bloc = context.read<SignUpBloc>();

    return BlocBuilder<SignUpBloc, SignUpState>(
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
                const SizedBox(height: 10),
                const TextB(
                    text: "Sign up an account",
                    fontSize: 20,
                    fontColor: Colors.white),
                const SizedBox(height: 20),
                Expanded(
                    child: Container(
                  color: Colors.white,
                  padding: const EdgeInsets.all(20),
                  child: ListView(
                    padding: EdgeInsets.zero,
                    children: [
                      const SizedBox(height: 10),
                      Row(
                        children: [
                          SizedBox(
                            width: size.width / 2 - 30,
                            child: TextFieldB(
                              focusNode: firstNameFocusNode,
                              labelText: "First Name",
                              onChanged: (text) {
                                bloc.add(FirstNameChanged(firstName: text));
                              },
                              errorText: state.forms == Forms.invalid &&
                                      state.firstName.isEmpty
                                  ? "Enter First Name"
                                  : "",
                            ),
                          ),
                          const SizedBox(width: 20),
                          SizedBox(
                            width: size.width / 2 - 30,
                            child: TextFieldB(
                              focusNode: lastNameFocusNode,
                              labelText: "Last Name",
                              onChanged: (text) {
                                bloc.add(LastNameChanged(lastName: text));
                              },
                              errorText: state.forms == Forms.invalid &&
                                      state.lastName.isEmpty
                                  ? "Enter Last Name"
                                  : "",
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(height: 10),
                      TextFieldB(
                        focusNode: phoneFocusNode,
                        labelText: "Phone",
                        textInputType: TextInputType.number,
                        onChanged: (text) {
                          bloc.add(PhoneChanged(phone: text));
                        },
                        errorText:
                            state.forms == Forms.invalid && state.phone.isEmpty
                                ? "Enter Phone Number"
                                : "",
                      ),
                      const SizedBox(height: 10),
                      TextFieldB(
                          focusNode: emailFocusNode,
                          labelText: "Email (optional)",
                          onChanged: (text) {
                            bloc.add(EmailChanged(email: text));
                          }),
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
                            : "",
                      ),
                      const SizedBox(height: 10),
                      TextFieldB(
                        focusNode: confirmPasswordFocusNode,
                        labelText: "Confirm Password",
                        obscureText: true,
                        onChanged: (text) {
                          bloc.add(ConfirmPasswordChanged(password: text));
                        },
                        errorText: state.forms == Forms.invalid &&
                                state.confirmPassword.isEmpty
                            ? "Enter Confirm Password"
                            : "",
                      ),
                      const SizedBox(height: 20),
                      ButtonB(
                        text: "Sign Up",
                        loading: state.loading,
                        press: () {
                          bloc.add(SignUp(
                              firstNameFocusNode: firstNameFocusNode,
                              lastNameFocusNode: lastNameFocusNode,
                              phoneFocusNode: phoneFocusNode,
                              passwordFocusNode: passwordFocusNode,
                              confirmPasswordFocusNode:
                                  confirmPasswordFocusNode));
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
