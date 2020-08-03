import 'package:flutter/material.dart';

import 'package:provider/provider.dart';

import 'package:markeymap/components/action_card.dart';
import 'package:markeymap/components/loading.dart';
import 'package:markeymap/data/database.dart';
import 'package:markeymap/localization.dart';
import 'package:markeymap/models/county.dart';
import 'package:markeymap/models/town.dart';
import 'package:markeymap/popup.dart';
import 'package:markeymap/utils/string.dart';

class TownList extends StatelessWidget {
  final County county;
  const TownList({@required this.county, Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) => Title(
        title: MarkeyMapLocalizations.of(context)
            .countyName(county.name.toCapitalize()),
        color: Theme.of(context).primaryColor,
        child: FutureLoader<List<Town>, Scrollbar>(
            future: Provider.of<Database>(context).getTowns(county),
            builder: (BuildContext context, List<Town> towns) {
              final ScrollController scrollController = ScrollController();
              return Scrollbar(
                controller: scrollController,
                child: ListView.builder(
                  itemExtent: 50,
                  itemCount: towns.length,
                  controller: scrollController,
                  itemBuilder: (BuildContext context, final int index) =>
                      ListTile(
                    title: Text(
                      towns[index].name,
                      style: const TextStyle(
                        color: Colors.white,
                      ),
                    ),
                    onTap: () => showPopup(
                      context,
                      scaffoldColor: Theme.of(context).primaryColor,
                      body: ActionCard(
                        town: towns[index],
                        county: county,
                      ),
                    ),
                  ),
                ),
              );
            }),
      );
}
