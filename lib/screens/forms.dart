import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:form_builder_validators/form_builder_validators.dart';
import 'package:get/get.dart';

class FormPage extends StatefulWidget {
  const FormPage({super.key});

  @override
  State<FormPage> createState() => _FormPageState();
}

class _FormPageState extends State<FormPage>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;

  var form = GlobalKey<FormBuilderState>();


  @override
  void initState() {
    super.initState();
    _controller = AnimationController(vsync: this);
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        image: DecorationImage(
          fit: BoxFit.cover,
          image: AssetImage(
            "assets/images/bg.jpg"
          )
        )
      ),
      child: Scaffold(
        // backgroundColor: Colors.black.withOpacity(0.6),
      appBar: AppBar(
        title: const Text("Formulaires"),
        backgroundColor: Colors.transparent,
      ),
      body: SafeArea(
        child: FormBuilder(
          key: form,
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.all(10),
                child: FormBuilderCheckbox(
                  name: "rester_connecter",
                  title: const Text("Rester connecter"),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(10),
                child: FormBuilderRadioGroup(
                  name: "genre", 
                  options: const [
                    FormBuilderFieldOption(
                      value: "homme",
                      child: Text("Homme"),
                    ),
                    FormBuilderFieldOption(
                      value: "femme",
                      child: Text("Femme"),
                    )
                  ]
                ),
              ),
              Padding(
                padding: EdgeInsets.all(10),
                child: FormBuilderDropdown(
                  name: "competences",
                  items: [
                    DropdownMenuItem(
                      child: Text("HTML"),
                      value: "html",
                    ),
                    DropdownMenuItem(
                      child: Text("JAVA"),
                      value: "java",
                    )
                  ]
                ),
              ),
              Padding(
                padding: EdgeInsets.all(10),
                child: FormBuilderSwitch(
                  name: "status", 
                  initialValue: false,
                  title: Text("ON")
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(10),
                child: FormBuilderTextField(
                  validator: FormBuilderValidators.compose([
                    FormBuilderValidators.required(
                      errorText: "Le champ est obligatoire"
                    ),
                    FormBuilderValidators.email(
                      errorText: "Email invalide"
                    ),
                  ]),
                  name: "prenom",
                  // obscureText: true,@gmail.com
                  decoration: const InputDecoration(
                    prefixIcon: Icon(Icons.lock),
                    suffixIcon: Icon(Icons.visibility_off_sharp),
                    labelText: "Mot de passe",
                    hintText: "Entre votre prenom ici",
                    labelStyle: TextStyle(
                      color: Colors.white
                    ),
                    hintStyle: TextStyle(
                      color: Colors.white
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(
                        color: Colors.white
                      )
                    ),
                    border: OutlineInputBorder(
                      borderSide: BorderSide(
                        color: Colors.red
                      )
                    )
                  ),
                ),
              ),

              Padding(
                padding: EdgeInsets.all(10),
                child: ElevatedButton(
                  child: Text("Sauvegarder"),
                  onPressed: () {

                    if(form.currentState!.saveAndValidate()) {
                      print("BON");
                      var data = Map.from(form.currentState!.value);

                      data['nom'] = "Donzo";
                      print(data);
                      form.currentState!.reset();
                    } else {
                      print("Erreur");
                    }

                    
                    // formKey.currentState.reset();

                  },
                ),
              )

            ],
          ),
        ),
      ),
    )
    );
  }
}