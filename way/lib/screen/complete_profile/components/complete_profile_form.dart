import 'package:flutter/material.dart';
import 'package:way/components/custom_surffix_icon.dart';
import 'package:way/components/default_button.dart';
import 'package:way/components/form_error.dart';
import 'package:way/constants.dart';
import 'package:way/screen/otp/otp_screen.dart';
import 'package:way/size_config.dart';

class CompleteProfileForm extends StatefulWidget {
  final String emailHolder;
  final String passwordHolder;
  final String passwordConfirmHolder;

  CompleteProfileForm({
    Key key,
    @required
    this.emailHolder,
    this.passwordHolder,
    this.passwordConfirmHolder}) : super(key: key);

  @override
  _CompleteProfileFormState createState() => _CompleteProfileFormState(emailHolder,passwordHolder,passwordConfirmHolder);
}

class _CompleteProfileFormState extends State<CompleteProfileForm> {

  final firstNameController = TextEditingController();
  final lastNameController = TextEditingController();
  final phoneNumberController = TextEditingController();
  final addressController = TextEditingController();

  getItemAndNavigate(BuildContext context){
    Navigator.push(
        context,
        MaterialPageRoute(
            builder: (context) => OtpScreen(
              firstNameHolder : firstNameController.text,
              lastNameHolder : lastNameController.text,
              phoneNumberHolder : phoneNumberController.text,
              addressHolder : addressController.text,
            )
        )
    );
  }

  final emailHolder;
  final passwordHolder;
  final passwordConfirmHolder;

  _CompleteProfileFormState(this.emailHolder,this.passwordHolder,this.passwordConfirmHolder);



  final _formkey = GlobalKey<FormState>();
  final List<String> errors = [];
  String firstName;
  String lastName;
  String phoneNumber;
  String address;



  void addError({String error}){
    if (!errors.contains(error))
      setState(() {
        errors.add(error);
      });
  }

  void removeError({String error}){
    if (errors.contains(error))
      setState(() {
        errors.remove(error);
      });
  }

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formkey,
      child: Column(
        children: [
          buildFirstNameFormField(),
          SizedBox(height: getProportionateScreenHeight(30)),
          buildLastNameFormField(),
          SizedBox(height: getProportionateScreenHeight(30)),
          buildPhoneNumberFormField(),
          SizedBox(height: getProportionateScreenHeight(30)),
          buildAddressFormField(),
          FormError(errors: errors),
          SizedBox(height: getProportionateScreenHeight(40)),
          DefaultButton(
            text: "Continue",
            press: (){
              if(_formkey.currentState.validate()){
                //Go to OTP screen
                getItemAndNavigate(context);
              }
            },
          )
        ],
      ),
    );
  }

  TextFormField buildAddressFormField() {
    return TextFormField(
      controller: addressController,
      onSaved: (newValue) => address=newValue,
      onChanged: (value){
        if(value.isNotEmpty){
          removeError(error: kAddressNullError);
        }
      },
      validator: (value){
        if(value.isEmpty){
          addError(error: kAddressNullError);
          return "";
        }
        return null;
      },
      decoration: InputDecoration(
        labelText: 'Address',
        hintText: "Enter your Address",
        floatingLabelBehavior: FloatingLabelBehavior.always,
        suffixIcon: CustomSurffixIcon(
          svgIcon: 'assets/icons/pin.svg',
        ),
      ),
    );
  }

  TextFormField buildPhoneNumberFormField() {
    return TextFormField(
      controller: phoneNumberController,
      keyboardType: TextInputType.number,
      onSaved: (newValue) => phoneNumber=newValue,
      onChanged: (value){
        if(value.isNotEmpty){
          removeError(error: kPhoneNumberNullError);
        }
      },
      validator: (value){
        if(value.isEmpty){
          addError(error: kPhoneNumberNullError);
          return "";
        }
        return null;
      },
      decoration: InputDecoration(
        labelText: 'Phone Number',
        hintText: "Enter your Phone Number",
        floatingLabelBehavior: FloatingLabelBehavior.always,
        suffixIcon: CustomSurffixIcon(
          svgIcon: 'assets/icons/smartphone.svg',
        ),
      ),
    );
  }

  TextFormField buildLastNameFormField() {
    return TextFormField(
      controller: lastNameController,
      onSaved: (newValue) => lastName=newValue,
      decoration: InputDecoration(
        labelText: 'Last Name',
        hintText: "Enter your Last Name",
        floatingLabelBehavior: FloatingLabelBehavior.always,
        suffixIcon: CustomSurffixIcon(
          svgIcon: 'assets/icons/user.svg',
        ),
      ),
    );
  }

  TextFormField buildFirstNameFormField() {
    return TextFormField(
      controller: firstNameController,
      onSaved: (newValue) => firstName=newValue,
      onChanged: (value){
        if(value.isNotEmpty){
          removeError(error: kNamelNullError);
        }
      },
      validator: (value){
        if(value.isEmpty){
          addError(error: kNamelNullError);
          return "";
        }
        return null;
      },
      decoration: InputDecoration(
        labelText: 'First Name',
        hintText: "Enter your First Name",
        floatingLabelBehavior: FloatingLabelBehavior.always,
        suffixIcon: CustomSurffixIcon(
          svgIcon: 'assets/icons/user.svg',
        ),
      ),
    );
  }
}