part of 'configuration.dart';

class AppStartWidget extends StatelessWidget {
  final Widget child;
  const AppStartWidget({super.key, required this.child});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<SplashCubit>(create: (_) => sl<SplashCubit>()),
      ],
      child: child,
    );
  }
}
