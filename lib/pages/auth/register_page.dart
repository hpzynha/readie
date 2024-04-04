import 'package:easy_localization/easy_localization.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg_image/flutter_svg_image.dart';
import 'package:readie/style.dart';
import 'package:readie/widgets/buttons.dart';
import 'package:readie/widgets/text_form_field.dart';
import 'package:readie/widgets/text_widgets.dart';

import '../../auth.dart';

class RegisterPage extends StatefulWidget {
  const RegisterPage({super.key});

  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  String? errorMessage = '';
  bool isLogin = true;

  final TextEditingController _controllerEmail = TextEditingController();
  final TextEditingController _controllerPassword = TextEditingController();

  Future<void> signInWithEmailAndPassword() async {
    try {
      await Auth().signInWithEmailAndPassword(
        email: _controllerEmail.text,
        password: _controllerPassword.text,
      );
    } on FirebaseAuthException catch (e) {
      setState(() {
        errorMessage = e.message;
      });
    }
  }

  Future<void> createUserWithEmailAndPassword() async {
    try {
      await Auth().createUserWithEmailAndPassword(
        email: _controllerEmail.text,
        password: _controllerPassword.text,
      );
    } on FirebaseAuthException catch (e) {
      setState(() {
        errorMessage = e.message;
      });
    }
  }

  Widget _title() {
    return const Text('Firebase Login');
  }

  Widget _entryField(
    String title,
    TextEditingController controller,
  ) {
    return TextField(
      controller: controller,
      decoration: InputDecoration(labelText: title),
    );
  }

  Widget _errorMessage() {
    return Text(errorMessage == '' ? '' : 'humm ? $errorMessage');
  }

  Widget _submitButton() {
    return ElevatedButton(
      onPressed: () async {
        if (isLogin) {
          await signInWithEmailAndPassword();
        } else {
          await createUserWithEmailAndPassword();
        }
        Navigator.pushNamed(context, '/home');
      },
      // isLogin ? signInWithEmailAndPassword : createUserWithEmailAndPassword,
      child: Text(isLogin ? 'Login' : 'Register'),
    );
  }

  Widget _loginOrRegisterButton() {
    return TextButton(
      onPressed: () {
        setState(() {
          isLogin = !isLogin;
        });
      },
      child: Text(
        isLogin ? 'Register instead' : 'Login instead',
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: _title(),
      ),
      body: Container(
        height: double.infinity,
        width: double.infinity,
        padding: const EdgeInsets.all(20),
        child: Column(
          children: [
            _entryField(
              'email',
              _controllerEmail,
            ),
            _entryField(
              'password',
              _controllerPassword,
            ),
            _errorMessage(),
            _submitButton(),
            _loginOrRegisterButton(),
          ],
        ),
      ),
    );
  }
}

// Scaffold(
//       appBar: AppBar(
//         leading: IconButton(
//           icon: Icon(
//             Icons.arrow_back_ios_new,
//             color: rPrimaryColor,
//           ),
//           onPressed: () {
//             Navigator.pop(context);
//           },
//         ),
//       ),
//       body: Column(
//         children: [
//           Image(image: SvgImage.asset('assets/images/PrimaryLogo.svg')),
//           Padding(
//             padding: const EdgeInsets.only(left: 40, right: 60),
//             child: Column(
//               children: [
//                 textTitle(
//                   title: 'register.register'.tr(),
//                   text: 'register.personalInformation'.tr(),
//                 ),
//                 const SizedBox(height: 29),
//                 LoginTextFormField(
//                     title: 'register.name'.tr(),
//                     hintText: 'register.enterName'.tr()),
//                 const SizedBox(height: 12),
//                 LoginTextFormField(
//                     title: 'register.email'.tr(),
//                     hintText: 'register.enterEmail'.tr()),
//                 const SizedBox(height: 12),
//                 LoginTextFormField(
//                   title: 'register.password'.tr(),
//                   hintText: 'register.enterPassword'.tr(),
//                 ),
//                 const SizedBox(height: 12),
//                 LoginTextFormField(
//                   title: 'register.comfirmPassword'.tr(),
//                   hintText: 'register.enterComfirmPassword'.tr(),
//                 ),
//                 const SizedBox(height: 32),
//                 PrimaryButton(
//                   title: 'register.register'.tr(),
//                   onPressed: () {
//                     Navigator.pushNamed(context, '/home');
//                   },
//                 ),
//               ],
//             ),
//           )
//         ],
//       ),
//     );