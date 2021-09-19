import 'package:flutter/material.dart';
import 'package:saegisfire/shared_pref.dart';

class SaveSharedPref extends StatelessWidget {
  const SaveSharedPref({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(
              child: Text('Save Values'),
              onPressed: () async {
                await SharedPreferencesHelper.saveValue(key: 'INT', value: 2, dataType: DataTypeEnum.Integer);
                await SharedPreferencesHelper.saveValue(key: 'STRING', value: 'SAEGIS', dataType: DataTypeEnum.String);
              },
            ),
            ElevatedButton(
              child: Text('Show Values'),
              onPressed: () async {
                var intValue = await SharedPreferencesHelper.getValue(key: 'INT', dataType: DataTypeEnum.Integer);
                print(intValue.toString());
                var strValue = await SharedPreferencesHelper.getValue(key: 'STRING', dataType: DataTypeEnum.String);
                print(strValue);
              },
            )
          ],
        ),
      ),
    );
  }
}
