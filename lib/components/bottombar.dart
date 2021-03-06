import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

import 'package:provider/provider.dart';
import 'package:url_launcher/url_launcher.dart' as url_launcher;

import 'package:markeymap/components/action_card.dart';
import 'package:markeymap/components/welcome.dart';
import 'package:markeymap/models/county.dart';
import 'package:markeymap/models/town.dart';
import 'package:markeymap/data/database.dart';
import 'package:markeymap/popup.dart';
import 'package:markeymap/localization.dart';
import 'package:markeymap/theme.dart';

class BottomBar extends StatelessWidget {
  const BottomBar({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) => Container(
        width: double.infinity,
        color: Colors.transparent,
        child: Wrap(
          runAlignment: WrapAlignment.center,
          alignment: WrapAlignment.center,
          spacing: 16,
          children: <Widget>[
            _BottomButton(
              text: MarkeyMapLocalizations.of(context).navigate,
              color: Theme.of(context).primaryColor,
              onTap: () => showPopup(context, body: const WelcomeScreen()),
            ),
            _BottomButton(
              text: MarkeyMapLocalizations.of(context).statewideAccomplishments,
              color: Theme.of(context).primaryColor,
              onTap: () async {
                const County statewideCounty = County.other;
                final Town statewide =
                    (await Provider.of<Database>(context, listen: false)
                            .getTowns(statewideCounty))
                        .firstWhere(
                  (Town town) => town.name.toLowerCase() == 'statewide',
                );
                showPopup(
                  context,
                  scaffoldColor: Theme.of(context).primaryColor,
                  body: ActionCard(
                    town: statewide,
                    county: statewideCounty,
                  ),
                );
              },
            ),
            _BottomButton(
              text: MarkeyMapLocalizations.of(context).donate,
              color: Theme.of(context).accentColor,
              onTap: () => url_launcher
                  .launch('https://secure.actblue.com/donate/markeymap'),
            ),
            _BottomButton(
              text: MarkeyMapLocalizations.of(context).getInvolved,
              color: Theme.of(context).accentColor,
              onTap: () =>
                  url_launcher.launch('https://www.edmarkey.com/volunteer/'),
            ),
          ],
        ),
      );
}

class _BottomButton extends StatelessWidget {
  const _BottomButton(
      {@required this.text, @required this.onTap, this.color, Key key})
      : super(key: key);

  final String text;
  final VoidCallback onTap;
  final Color color;

  @override
  Widget build(BuildContext context) => RaisedButton(
        color: color,
        onPressed: onTap,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(8),
        ),
        child: Padding(
          padding: const EdgeInsets.all(4),
          child: Text(
            text.toUpperCase(),
            style: MarkeyMapTheme.buttonStyle,
          ),
        ),
      );

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    properties
      ..add(StringProperty('text', text))
      ..add(ObjectFlagProperty<VoidCallback>(
        'onTap',
        onTap,
        ifPresent: 'present',
      ))
      ..add(ColorProperty('color', color));
    super.debugFillProperties(properties);
  }
}
