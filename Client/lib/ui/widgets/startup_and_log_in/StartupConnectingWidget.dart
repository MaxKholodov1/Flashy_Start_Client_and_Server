import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flashy_start/cubits/login_and_signup/StartupCubit.dart';
import 'package:flashy_start/generated/l10n.dart';

class StartupConnectingWidget extends StatelessWidget {
  const StartupConnectingWidget({super.key});

  @override
  Widget build(BuildContext context) {
    final s = S.of(context);

    return Scaffold(
      backgroundColor: const Color(0xFFD9E5E3),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 32),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Text(
                s.check_internet_connection,
                textAlign: TextAlign.center,
                style: const TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.w600,
                  color: Colors.black87,
                ),
              ),
              const SizedBox(height: 24),
              ElevatedButton(
                onPressed: () {
                  context.read<StartupCubit>().init(context);
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: const Color(0xFFB5F37A),
                  foregroundColor: Colors.black,
                  padding: const EdgeInsets.symmetric(
                    horizontal: 24,
                    vertical: 12,
                  ),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                ),
                child: Text(s.try_again),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
