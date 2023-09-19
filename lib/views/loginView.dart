import 'package:fluentui_icons/fluentui_icons.dart';
import 'package:flutter/material.dart';
import 'package:kgiantinsight/controllers/loginController.dart';
import 'package:kgiantinsight/models/loginUserModel.dart';
import 'package:kgiantinsight/resources/app_colors.dart';
import 'package:kgiantinsight/views/menuView.dart';

class LoginView extends StatefulWidget {
  const LoginView({super.key});

  @override
  State<LoginView> createState() => _LoginViewState();
}

class _LoginViewState extends State<LoginView> {
  Future<LoginUser>? _loginUser;
  TextEditingController _idController = TextEditingController();
  TextEditingController _pwController = TextEditingController();

  void login() {
    if (_idController.text == "") {
      const snackBar = SnackBar(
        content: Text('아이디를 입력하세요.'),
      );

      ScaffoldMessenger.of(context).showSnackBar(snackBar);
      return;
    }

    if (_pwController.text == "") {
      const snackBar = SnackBar(
        content: Text('비밀번호를 입력하세요.'),
      );

      ScaffoldMessenger.of(context).showSnackBar(snackBar);
      return;
    }

    setState(() {
      _loginUser =
          loginByIdWithPassword(_idController.text, _pwController.text);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.pageBackground,
      body: SafeArea(
        child: Container(
          padding: const EdgeInsets.all(25),
          child: _loginUser == null ? LoginForm() : buildLoginAccess(),
        ),
      ),
    );
  }

  SizedBox LoginForm() {
    return SizedBox(
      width: MediaQuery.of(context).size.width,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          const Spacer(),
          const Center(
            child: Text(
              'K-GIANT',
              style: TextStyle(
                color: AppColors.contentColorOrange,
                fontSize: 50,
              ),
            ),
          ),
          const Spacer(),
          TextField(
            style: const TextStyle(
              color: AppColors.mainTextColor1,
            ),
            controller: _idController,
            decoration: const InputDecoration(
              icon: Icon(
                FluentSystemIcons.ic_fluent_person_accounts_regular,
                size: 40,
              ),
              iconColor: Colors.white,
              hintText: '아이디를 입력하세요.',
              hintStyle: TextStyle(color: AppColors.mainTextColor2),
            ),
          ),
          TextField(
            style: const TextStyle(
              color: AppColors.mainTextColor1,
            ),
            onSubmitted: (value) => login,
            controller: _pwController,
            decoration: const InputDecoration(
              icon: Icon(
                FluentSystemIcons.ic_fluent_lock_regular,
                size: 40,
              ),
              iconColor: Colors.white,
              hintText: '비밀번호를 입력하세요.',
              hintStyle: TextStyle(color: AppColors.mainTextColor2),
            ),
            obscureText: true,
          ),
          const Spacer(),
          ElevatedButton(onPressed: login, child: const Text('로그인')),
        ],
      ),
    );
  }

  FutureBuilder<LoginUser> buildLoginAccess() {
    return FutureBuilder<LoginUser>(
      future: _loginUser,
      builder: (ctx, snapshot) {
        if (snapshot.hasData) {
          //Successed
          return MenuView(loginUser: snapshot.data);
        } else if (snapshot.hasError) {
          _pwController.text = "";
          return LoginForm();
        }
        return const Center(child: CircularProgressIndicator());
      },
    );
  }
}
