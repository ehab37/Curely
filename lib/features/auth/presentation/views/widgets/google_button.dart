import 'package:curely/core/constants/assets_constants.dart';
import 'package:curely/core/helpers/extensions.dart';
import 'package:curely/core/widgets/custom_button.dart';
import 'package:curely/features/auth/presentation/cubits/login_cubit/login_cubit.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class GoogleButton extends StatelessWidget {
  const GoogleButton({super.key});

  @override
  Widget build(BuildContext context) {
    return CustomButton(
      backgroundColor: Theme.of(context).colorScheme.onPrimary,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Image.asset(AssetsConstants.kGoogleLogo, width: 25),
          8.horizontalSpacing,
          Flexible(
            child: FittedBox(
              fit: BoxFit.scaleDown,
              child: Text(
                context.tr("google_sign_in"),
                style: Theme.of(context).textTheme.titleSmall,
              ),
            ),
          ),
        ],
      ),
      onPressed: () {
        context.read<LoginCubit>().loginUserWithGoogle();
        FocusScope.of(context).unfocus();
      },
    );
  }
}
