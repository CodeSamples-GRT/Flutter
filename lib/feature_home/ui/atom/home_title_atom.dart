import 'package:flutter/cupertino.dart';
import 'package:localization/l10n/localizable_strings.dart';

class HomeTitleAtom extends StatelessWidget {
  const HomeTitleAtom({super.key});

  @override
  Widget build(BuildContext context) =>
      Text(AppLocalizations.of(context).appName);
}
