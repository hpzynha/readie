// DO NOT EDIT. This is code generated via package:easy_localization/generate.dart

// ignore_for_file: prefer_single_quotes, avoid_renaming_method_parameters, constant_identifier_names

import 'dart:ui';

import 'package:easy_localization/easy_localization.dart' show AssetLoader;

class CodegenLoader extends AssetLoader{
  const CodegenLoader();

  @override
  Future<Map<String, dynamic>?> load(String path, Locale locale) {
    return Future.value(mapLocales[locale.toString()]);
  }

  static const Map<String,dynamic> _pt_BR = {
  "login": {
    "welcome": "Bem vindo ao Readie",
    "forgotMyPassword": "Esqueci minha senha",
    "subTextWelcome": "Entre agora e mergulhe numa comunidade feita para quem ama livros!",
    "email": "Email",
    "password": "Password",
    "login": "Login",
    "loginToUseTheApp": "Entre para usar o app",
    "enterEmail": "",
    "enterPassword": "",
    "fieldCannotBeEmpty": "Campo obrigatório",
    "subtitleForgotPassword": "Don’t worry! It occurs. Please enter the email address linked with your account.",
    "logo": "readie",
    "subLogo": "Leia, resenhe, inspire-se."
  },
  "createAccount": {
    "createAccount": "Criar uma conta",
    "register": "Cadastro",
    "typeYourData": "Digite seus Dados",
    "name": "Nome",
    "lastName": "Sobrenome",
    "email": "E-mail",
    "phoneNumber": "Melhor número para contato",
    "choosePassword": "Escolha uma senha",
    "minimumCharacters": "Mínimo de 8 caracteres",
    "password": "Senha",
    "repeatPassword": "Repita a senha",
    "number": "(00) 00000-0000",
    "create": "Criar conta",
    "successCreatedAccount": "Sua conta foi criada com sucesso verifique seu e-mail.",
    "backToLogin": "Voltar para a tela de login",
    "passwordNotMacth": "As senhas devem ser iguais",
    "fieldCannotBeEmpty": "Campo obrigatório"
  },
  "splash": {
    "logo": "readie",
    "subLogo": "Leia, resenhe, inspire-se."
  }
};
static const Map<String,dynamic> _en_US = {
  "login": {
    "welcome": "Welcome to Readie",
    "subTextWelcome": "Log in to explore and connect with fellow book lovers",
    "forgotPassword": "Forgot password?",
    "email": "Email",
    "password": "Password",
    "login": "Login",
    "loginToUseTheApp": "Login to use the App",
    "enterEmail": "Enter your email",
    "enterPassword": "Enter your password",
    "fieldCannotBeEmpty": "Field cannot be empty",
    "orLoginWith": "Or login with",
    "register": "Register"
  },
  "register": {
    "register": "Register",
    "personalInformation": "Enter your personal information",
    "name": "Name",
    "enterName": "Enter your name",
    "email": "Email",
    "password": "Password",
    "enterEmail": "Enter your email",
    "enterPassword": "Enter your password",
    "comfirmPassword": "Comfirm Password",
    "enterComfirmPassword": "Enter comfirm Password",
    "minimumCharacters": "Mínimo de 8 caracteres",
    "successCreatedAccount": "Sua conta foi criada com sucesso verifique seu e-mail.",
    "backToLogin": "Voltar para a tela de login",
    "passwordNotMacth": "As senhas devem ser iguais",
    "fieldCannotBeEmpty": "Field cannot be empty",
    "orRegisterWith": "Or register with"
  },
  "splash": {
    "logo": "readie",
    "subLogo": "Leia, resenhe, inspire-se."
  },
  "errorMessageDialog": {
    "titleDialog": "Login Failed",
    "buttonDialog": "OK",
    "errorMessageLogin": "Wrong username or password. Please try again!",
    "errorMessagePassword": "Passwords do not match. Please try again!"
  },
  "forgotPassword": {
    "forgotPassword": "Forgot password?",
    "subtitleForgotPassword": "Don’t worry! It occurs. Please enter the email address linked with your account.",
    "email": "Email",
    "enterEmail": "Enter your email",
    "sendCode": "Send Code"
  },
  "errorMessage": {
    "emailRequired": "Email is required",
    "passwordRequired": "Password is required"
  }
};
static const Map<String, Map<String,dynamic>> mapLocales = {"pt_BR": _pt_BR, "en_US": _en_US};
}
