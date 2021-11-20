import 'package:ar_portal/screens/homes/home_page.dart';
import 'package:ar_portal/utils/app_assets.dart';
import 'package:ar_portal/utils/app_routes.dart';
import 'package:ar_portal/utils/app_styles.dart';
import 'package:ar_portal/widgets/custom_textfield.dart';
import 'package:flutter/material.dart';

class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Image.asset(
            AppAssets.backgroundApp,
            width: MediaQuery.of(context).size.width,
            height: MediaQuery.of(context).size.height,
            fit: BoxFit.cover,
          ),
          Center(
            child: Container(
              width: 400,
              padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 30),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(10),
              ),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    "Welcome Back!",
                    style: AppStyles.textSizeCustom(size: 30),
                  ),
                  const SizedBox(
                    height: 30,
                  ),
                  CustomTextField(
                    enabled: true,
                    controller: _emailController,
                    onValid: (valid) {},
                    hintText: 'Enter Email',
                    validType: ValidType.email,
                  ),
                  const SizedBox(
                    height: 30,
                  ),
                  CustomTextField(
                    enabled: true,
                    controller: _passwordController,
                    onValid: (valid) {},
                    hintText: 'Password',
                    validType: ValidType.password,
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  GestureDetector(
                    onTap: () {
                      AppRoutes.push(context, HomePage());
                    },
                    child: Container(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 20, vertical: 20),
                      decoration: BoxDecoration(
                        color: const Color(0xff5D4CCA),
                        borderRadius: BorderRadius.circular(15),
                      ),
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Center(
                            child: Text(
                              "Login",
                              style: AppStyles.textSize16(
                                color: Colors.white,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        "Don't have an account?",
                        style: AppStyles.textSize14(
                          color: Colors.black,
                        ),
                      ),
                      const SizedBox(
                        width: 6,
                      ),
                      Text(
                        "Create an account",
                        style: AppStyles.textSize14(
                          fontWeight: FontWeight.w700,
                        ),
                      )
                    ],
                  )
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
