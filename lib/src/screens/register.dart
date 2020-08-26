import 'package:flutter/material.dart';
import '../mixins/validation.dart';

class RegisterScreen extends StatefulWidget {
  createState() {
    return RegisterScreenState();
  }
}

class RegisterScreenState extends State<RegisterScreen> with Validation {
  final formKey = GlobalKey<FormState>(); // MEMBUAT GLOBAL KEY UNTUK VALIDASI

  // Define Variable
  String name = '';
  String email = '';
  String password = '';

  Widget build(context) {
    return Container(
      margin: EdgeInsets.all(20.0), // set margin container
      child: Form(
          key: formKey, // menggunakan global key
          child: Column(
            //CHILDREN DARI COLUMN BERISI 4 BUAH OBJECT YANG AKAN DI-RENDER, YAKNI
            // TextInput UNTUK NAME, EMAIL, PASSWORD DAN TOMBOL DAFTAR
            children: [
              // helper ini berisi widget sesuai dengan peruntukan nya
              nameField(),
              emailField(),
              passwordField(),
              registerButton()
            ],
          )),
    );
  }

  Widget nameField() {
    // Membuat TEXT INPUT
    return TextFormField(
      decoration: InputDecoration(labelText: 'Nama Lengkap'),
      validator: validateName,
      //validateName adalah nama function pada file validation.dart
      onSaved: (String value) {
        // ketika lolos validasi
        name = value;
        //MAKA VARIABLE name AKAN DIISI DENGAN TEXT YANG TELAH DI-INPUT
      },
    );
  }

  Widget emailField() {
    return TextFormField(
      keyboardType: TextInputType.emailAddress,
      // KEYBOARD TYPENYA ADALAH EMAIL ADDRESS
      //AGAR SYMBOL @ DILETAKKAN DIDEPAN KETIKA KEYBOARD DI TAMPILKAN
      decoration:
          InputDecoration(labelText: 'Email', hintText: 'email@example.com'),
      validator: validateEmail, //BERLAKU SAMA DENGAN HELPERS SEBELUMNYA
      onSaved: (String value) {
        email = value;
      },
    );
  }

  Widget passwordField() {
    return TextFormField(
      obscureText: true, // KETIKA obsecureText bernilai TRUE
      //MAKA SAMA DENGAN TYPE PASSWORD PADA HTML
      decoration:
          InputDecoration(labelText: 'Password', hintText: 'Enter Password'),
      validator: validatePassword,
      onSaved: (String value) {
        password = value;
      },
    );
  }

  Widget registerButton() {
    // Membuat tombol
    return RaisedButton(
      color: Colors.blueAccent,
      //PERINTAH YANG AKAN DIEKSEKUSI KETIKA TOMBOL DITEKAN onPressed
      onPressed: () {
        //formKey ADALAH GLOBAL KEY, KEMUDIAN DIIKUTI DENGAN currentState

        //LALU METHOD validate(), NILAINYA ADALAH FALSE / TRUE
        if (formKey.currentState.validate()) {
          // JIKA TRUE
          formKey.currentState.save(); // maka fungsi save akan di jalankan

          //DISINI KAMU BISA MENGHANDLE DATA YANG SDH DITAMPUNG PADA MASING-MASING VARIABLE
          //KAMU DAPAT MENGIRIMNYA KE API ATAU APAPUN
          //NAMUN UNTUK SEMENTARA KITA PRINT KE CONSOLE SAJA
          //KARENA BELUM MEMBAHAS TENTANG HTTP REQUEST

          print('Nama Lengkap: $name');
          print('Email: $email');
          print('Passwor: $password');
        }
      },
      child:
          Text('Daftar'), // Text yang akan di tampilkan ketika tombol di tekan
    );
  }
}
