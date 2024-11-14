import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class FormPage extends StatefulWidget {
  const FormPage({ super.key });

  @override
  State<FormPage> createState() => FormPageState();
}

class FormPageState extends State<FormPage> {

  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
      child: Form(
        key: _formKey,
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                children: <Widget>[
                Expanded(child: TextFormField(
                  decoration: const InputDecoration(hintText: 'Логин'),
                validator: (value) {
                  if(value == null || value.isEmpty){
                    return 'Please eneter value';
                    }
                  return null;
                },
              ))
              
                        ],
              
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                children: <Widget>[
                Expanded(child: TextFormField(
                  decoration: const InputDecoration(hintText: 'Пароль'),
                  inputFormatters: [FilteringTextInputFormatter.allow(RegExp(r'[0-9]'))],
                validator: (value) {
                  if(value == null || value.isEmpty){
                    return 'Please eneter value';
                    }
                  return null;
                },
              ))
              
                        ],
              
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                children: <Widget>[
                ElevatedButton(onPressed: ()
                {
                  if(_formKey.currentState!.validate()){
                    ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text('Processing data')));
                  }
              
                }, child: Text('Войти'))
              
                        ],
              
              ),
            ),
            Row(
              children: [
                DropdownItem()
                ],
            )
          ]
          
        )

      )
    )
    );
  }
  

}

class DropdownItem  extends StatefulWidget {
  const DropdownItem ({ Key? key }) : super(key: key);

  @override
  State<DropdownItem> createState() => _DropdownItemState();
}

class _DropdownItemState extends State<DropdownItem> {
  String selectedValue = "USA";
  @override
  Widget build(BuildContext context) {
    return DropdownButton(
      value: selectedValue,
      items: dropdownItems, onChanged: (String? value) { setState(() {
        selectedValue = value!;
      }); },
      );
  }
  List<DropdownMenuItem<String>> get dropdownItems{
  List<DropdownMenuItem<String>> menuItems = [
    DropdownMenuItem(child: Text("USA"),value: "USA"),
    DropdownMenuItem(child: Text("Canada"),value: "Canada"),
    DropdownMenuItem(child: Text("Brazil"),value: "Brazil"),
    DropdownMenuItem(child: Text("England"),value: "England"),
  ];
  return menuItems;
}
}