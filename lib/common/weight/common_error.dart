import 'package:flutter/material.dart';

typedef Retry = void Function();

class CommonError extends StatelessWidget {
  final String tip;
  final IconData iconData;
  final String retryTip;
  final Retry retry;

  const CommonError({
    super.key,
    required this.tip,
    required this.iconData,
    required this.retryTip,
    required this.retry,
  });

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(
            iconData,
            color: Theme.of(context).colorScheme.onErrorContainer,
            size: 120,
          ),
          const SizedBox(
            height: 32,
          ),
          Text(
            tip,
            style: const TextStyle(
              fontSize: 18,
            ),
          ),
          const SizedBox(
            height: 32,
          ),
          TextButton(
              onPressed: () {
                retry();
              },
              child: Text(retryTip,
                  style: TextStyle(
                    color: Theme.of(context).colorScheme.onErrorContainer,
                  )))
        ],
      ),
    );
  }
}
