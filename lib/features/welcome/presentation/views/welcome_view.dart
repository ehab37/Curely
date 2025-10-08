import 'package:curely/constants.dart';
import 'package:curely/core/utils/app_router.dart';
import 'package:curely/core/utils/assets.dart';
import 'package:curely/core/widgets/custom_button.dart';
import 'package:curely/core/widgets/custom_container.dart';
import 'package:curely/generated/l10n.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class WelcomeView extends StatelessWidget {
  const WelcomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          children: [
            SizedBox(height: MediaQuery.of(context).size.height / 7),
            Text(
              S.of(context).welcome,
              style: TextStyle(
                color: Color.fromRGBO(0, 174, 240, 1),
                fontSize: 25,
                fontWeight: FontWeight.bold,
              ),
            ),
            Text(
              S.of(context).to,
              style: TextStyle(
                color: Color.fromRGBO(0, 174, 240, 1),
                fontSize: 25,
              ),
            ),
            const SizedBox(height: 10),
            Text(
              S.of(context).title,
              style: TextStyle(
                color: Color.fromRGBO(0, 174, 240, 1),
                fontSize: 33,
                fontWeight: FontWeight.w900,
                letterSpacing: 1.5,
              ),
            ),
            const SizedBox(height: 30),
            const SizedBox(
              width: 170,
              height: 170,
              child: ClipRRect(
                child: Image(
                  image: AssetImage(AssetsData.kLogo),
                  fit: BoxFit.cover,
                ),
              ),
            ),
            const Spacer(),
            CustomContainer(
              border: const BorderRadius.only(
                topLeft: Radius.circular(80),
                topRight: Radius.circular(80),
              ),
              child: Column(
                children: [
                  const SizedBox(height: 80),
                  CustomButton(
                    backgroundColor: kBlueColor,
                    child: Text(
                      S.of(context).login,
                      style: TextStyle(fontSize: 20),
                    ),
                    onPressed: () {
                      GoRouter.of(
                        context,
                      ).pushReplacement(AppRouter.kLoginView);
                    },
                  ),
                  CustomButton(
                    backgroundColor: kBlueColor,
                    child: Text(
                      S.of(context).register,
                      style: TextStyle(fontSize: 20),
                    ),
                    onPressed: () {
                      GoRouter.of(
                        context,
                      ).pushReplacement(AppRouter.kRegisterView);
                    },
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
