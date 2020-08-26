class Validation {
  // FUNGSI validatePassword > NAMA FUNGSI BEBAS

  String validatePassword(String value) {
    //MENERIMA VALUE DENGAN TYPE STRING

    if (value.length < 4) {
      //VALUE TERSEBUT DI CEK APABILA KURANG DARI 4 KARAKTER
      return 'Password minimal 4 karakter'; // MAKA ERROR AKAN DITAMPILKAN
    }

    return null; // selain itu lolos validasi
  }

  String validateEmail(String value) {
    // Jika value tidak mengandung @

    if (!value.contains('@')) {
      return 'Email tidak valid'; // Maka pesan ini akan di tampilkan
    }

    return null; // lolos
  }

  String validateName(String value) {
    // Jika value kosong

    if (value.isEmpty) {
      return 'Nama harus di isi'; // tampilkan pesan ini
    }

    return null; // lolos
  }
}
