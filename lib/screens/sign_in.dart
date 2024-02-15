import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:nexaya/logic/login_request.dart';
import 'package:nexaya/screens/widgets.dart/textfield.dart';

class SignIn extends StatelessWidget {
  SignIn({super.key});
  final LoginViewModel viewModel = LoginViewModel();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xff51024E),
      body: LoaderOverlay(
        valueListenable: viewModel.isLoading,
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 17, vertical: 32),
          child: ListView(
            children: [
              Center(child: Image.asset("assets/images/logo.png")),
              const SizedBox(
                height: 42,
              ),
              const Center(
                child: Text("Sign In",
                    style: TextStyle(
                        color: Color(0xffF8FC3A),
                        fontSize: 30,
                        fontWeight: FontWeight.w700)),
              ),
              const SizedBox(
                height: 12,
              ),
              const Center(
                child: Text("Hi there! Nice to see you again.",
                    style: TextStyle(
                        color: Color(0xffB8A8B7),
                        fontSize: 16,
                        fontWeight: FontWeight.w400)),
              ),
              const SizedBox(
                height: 32,
              ),
              const AppTextField(hintText: "test@nexaya.com", label: "Email"),
              const AppTextField(hintText: "---------", label: "Password"),
              const SizedBox(
                height: 32,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 120),
                child: GestureDetector(
                  onTap: () async {
                    viewModel.login(context);
                  },
                  child: Container(
                    height: 40,
                    decoration: BoxDecoration(
                        border: Border.all(color: Colors.white, width: 1),
                        shape: BoxShape.rectangle,
                        color: const Color(0xffE71FA3)),
                    child: Center(
                      child: viewModel.isLoading == true
                          ? const CircularProgressIndicator()
                          : const Text(
                              "Sign In",
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                  fontWeight: FontWeight.w400,
                                  fontSize: 14,
                                  color: Colors.white),
                            ),
                    ),
                  ),
                ),
              ),
              const SizedBox(
                height: 15,
              ),
              const Center(
                  child: Text(
                "or",
                style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w400,
                    color: Colors.white),
              )),
              const SizedBox(
                height: 22,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Image.asset("assets/images/ig.png"),
                  const SizedBox(
                    width: 12,
                  ),
                  Image.asset("assets/images/fb.png"),
                  const SizedBox(
                    width: 12,
                  ),
                  Image.asset("assets/images/x.png"),
                  const SizedBox(
                    width: 12,
                  ),
                  Image.asset("assets/images/mail.png"),
                ],
              ),
              const SizedBox(
                height: 100,
              ),
              const Row(
                children: [
                  Text(
                    "Forgot Password",
                    style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w500,
                        color: Color(0xff948CEF)),
                  ),
                  Spacer(),
                  Text(
                    "Sign Up",
                    style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w500,
                        color: Color(0xffF3F804)),
                  ),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}

class LoaderOverlay extends StatelessWidget {
  final ValueListenable<bool> valueListenable;
  final Widget child;

  const LoaderOverlay(
      {super.key, required this.valueListenable, required this.child});

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        child,
        ValueListenableBuilder<bool>(
            valueListenable: valueListenable,
            builder: (context, loading, child) {
              return loading
                  ? Container(
                      color: Colors.black.withOpacity(0.5),
                      child: const Center(
                        child: CircularProgressIndicator(
                          color: Colors.green,
                        ),
                      ),
                    )
                  : Container();
            })
      ],
    );
  }
}
