import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:kgiantinsight/models/loginUserModel.dart';
import 'package:kgiantinsight/resources/app_colors.dart';

class MenuView extends StatefulWidget {
  final LoginUser? loginUser;

  const MenuView({
    super.key,
    required this.loginUser,
  });

  @override
  State<MenuView> createState() => _MenuViewState();
}

class _MenuViewState extends State<MenuView> {
  List<String> menuList = ["chart", "grid", "sales"];

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(8),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Text(
                '${widget.loginUser!.empName} 님 환영합니다.',
                style: const TextStyle(
                  color: AppColors.mainTextColor2,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ],
          ),
          const Gap(15),
          Expanded(
            child: GridView.count(
              primary: false,
              padding: EdgeInsets.all(15),
              crossAxisSpacing: 1,
              mainAxisSpacing: 1,
              crossAxisCount: 3,
              children: menuList.map((e) => MenuIcon(e.toString())).toList(),
            ),
          ),
          ElevatedButton(
              onPressed: () {
                Navigator.pushNamedAndRemoveUntil(
                  context,
                  '/',
                  (route) => false,
                );
              },
              child: const Text('로그아웃')),
        ],
      ),
    );
  }

  Widget MenuIcon(String MenuName) {
    return Container(
      padding: EdgeInsets.all(4),
      child: InkWell(
        onTap: () {
          try {
            Navigator.pushNamed(context, '/$MenuName');
          } catch (e) {
            final snackBar = SnackBar(
              content: const Text('메뉴의 권한이 없습니다.'),
              action: SnackBarAction(label: 'OK', onPressed: () {}),
            );

            ScaffoldMessenger.of(context).showSnackBar(snackBar);
          }
        },
        child: SizedBox(
          width: MediaQuery.of(context).size.width * 0.25,
          height: MediaQuery.of(context).size.width * 0.25,
          child: DecoratedBox(
            decoration: BoxDecoration(
              color: AppColors.contentColorOrange.withOpacity(0.8),
              borderRadius: BorderRadius.circular(8),
            ),
            child: Center(
              child: Text(
                MenuName.toUpperCase(),
                style: const TextStyle(
                  color: AppColors.mainTextColor1,
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
