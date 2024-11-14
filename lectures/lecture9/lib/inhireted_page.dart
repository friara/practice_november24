import 'package:demo_state_manage/app_data_provider.dart';
import 'package:demo_state_manage/util.dart';
import 'package:flutter/material.dart';

class InhiretedPage extends StatefulWidget {
  const InhiretedPage({ Key? key }) : super(key: key);

  @override
  _InhiretedPageState createState() => _InhiretedPageState();
}

class _InhiretedPageState extends State<InhiretedPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Center(
          child: ListenableBuilder(
            
            listenable: AppDataProvider.of(context)!.appData,
            builder: (BuildContext context, Widget? child) { 
              return Container(
                    width: 200,
                    height: 200,
                    color: AppDataProvider.of(context)?.appData.backgroundColor,
                    child: Column(
            children: [
              Text(AppDataProvider.of(context)
                      ?.appData
                      .backgroundColor
                      .toString() ??
                  ''),
              ElevatedButton(
                  onPressed: () {
                    setState(() {
                      AppDataProvider.of(context)
                          ?.appData
                          .changeBackgroundColor(Util.randomColor());
                    });
                  },
                  child: const Text('Change color')),
              ElevatedButton(
                onPressed: () {
                  Navigator.of(context).pushNamed('/second');
              }, child: const Text('Second Page'))
            ],
                    ),
                  );
             },
            
          )),
    );
  }
}