String? emailValidation(String email) {

  if(email == ''){
    return null;
  }

  List<String> emailArr = email.split('@');

  String validEmailError = 'Please enter a valid email';

  if (emailArr.length == 1) {
    return validEmailError;
  }

  if (emailArr[0] == '' || emailArr[1] == '') {
    return validEmailError;
  }

  emailArr = emailArr[1].split('.');

  if (emailArr.length == 1) {
    return validEmailError;
  }

  if (emailArr[0] == '' || emailArr[1] == '') {
    return validEmailError;
  }

  return null;
}

String? numberValidation(String str) {
  try{
    var value = int.parse(str);

    if(str.length != 10){
      return 'Please enter a 10 digit phone number';
    }

    return null;
  } on FormatException {
    return 'Please enter valid phone number';
  } 
}