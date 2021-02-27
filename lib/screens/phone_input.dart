import 'package:flutter/material.dart';
import 'package:intl_phone_number_input/intl_phone_number_input.dart';

import 'index.dart';

class PhoneInputPage extends StatefulWidget {
  @override
  _PhoneInputPageState createState() => _PhoneInputPageState();
}

class _PhoneInputPageState extends State<PhoneInputPage> {
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();

  final TextEditingController controller = TextEditingController();
  String initialCountry = 'AE';

  PhoneNumber number = PhoneNumber(isoCode: 'AE');
  PhoneNumber num_;

  @override
  void dispose() {
    controller?.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          automaticallyImplyLeading: false,
          title: Text(
            'Phone validation',
          ),
        ),
        body: SingleChildScrollView(
          child: Column(
            children: [
              SizedBox(height: 30),
              Form(
                key: formKey,
                child: InternationalPhoneNumberInput(
                  onInputChanged: (PhoneNumber number) {
                    formKey.currentState.validate();
                  },
                  onInputValidated: (bool value) {
                    if (value) {
                      formKey.currentState.save();
                    }
                  },
                  selectorConfig: SelectorConfig(
                    selectorType: PhoneInputSelectorType.BOTTOM_SHEET,
                  ),
                  ignoreBlank: false,
                  errorMessage: 'Please enter a valid phone number',
                  autoValidateMode: AutovalidateMode.onUserInteraction,
                  selectorTextStyle: TextStyle(fontSize: 17),
                  initialValue: number,
                  textStyle: TextStyle(fontSize: 17),
                  textFieldController: controller,
                  keyboardType: TextInputType.numberWithOptions(
                    signed: true,
                    decimal: true,
                  ),
                  onSaved: (PhoneNumber snumber) {
                    setState(() {
                      num_ = snumber;
                    });
                  },
                ),
              ),
              SizedBox(height: MediaQuery.of(context).size.height * 0.4),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 60),
                child: FlatButton(
                  height: 50,
                  minWidth: double.infinity,
                  color: Colors.green,
                  onPressed: () {
                    formKey.currentState.save();

                    print('[INFO] Entered number: $num_');

                    if (num_ != null) {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (_) => PinCodeVerificationScreen(
                            phoneNumber: num_.phoneNumber,
                          ),
                        ),
                      );
                    }
                  },
                  child: Text(
                    'Confirm',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 17,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
