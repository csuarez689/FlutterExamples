import 'package:flutter/material.dart';
import 'package:qrapp/src/bloc/scans_bloc.dart';
import 'package:qrapp/src/models/scan_model.dart';
import 'package:qrapp/src/utils/utils.dart' as utils;

class TabPage extends StatelessWidget {
  final _scansBloc = new ScansBloc();
  final String type;

  TabPage({@required this.type});

  @override
  Widget build(BuildContext context) {
    _scansBloc.getScans();
    return StreamBuilder<List<ScanModel>>(
      stream:
          (type == 'web') ? _scansBloc.scansSreamWeb : _scansBloc.scansSreamGeo,
      builder: (BuildContext context, AsyncSnapshot<List<ScanModel>> snapshot) {
        print(snapshot);
        if (!snapshot.hasData) {
          return Center(child: CircularProgressIndicator());
        }
        final scans = snapshot.data;

        if (scans.length == 0) {
          return Center(child: Text('No hay registros cargados.'));
        }

        return ListView.builder(
          itemCount: scans.length,
          itemBuilder: (context, i) => Dismissible(
            direction: DismissDirection.endToStart,
            key: UniqueKey(),
            background: Container(
              padding: EdgeInsets.only(right: 20),
              alignment: Alignment.centerRight,
              color: Colors.red,
              child: Icon(
                Icons.delete,
                color: Colors.white,
                size: 30,
              ),
            ),
            onDismissed: (direction) => _scansBloc.deleteScan(scans[i].id),
            child: ListTile(
              onTap: () => utils.openLink(context, scans[i]),
              leading: Icon(
                  type == 'web' ? Icons.cloud_queue : Icons.map_outlined,
                  color: Theme.of(context).primaryColor),
              title: Text(scans[i].value),
              subtitle: Text('ID: ${scans[i].id}'),
              trailing: Icon(Icons.keyboard_arrow_right,
                  color: Theme.of(context).primaryColor),
            ),
          ),
        );
      },
    );
  }
}
