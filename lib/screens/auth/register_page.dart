import 'package:flutter/material.dart';

class RegisterPage extends StatefulWidget {
  const RegisterPage({super.key});

  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  final _formKey = GlobalKey<FormState>();
  final _passwordController = TextEditingController();
  final _confirmPasswordController = TextEditingController();

  // Variabel status tampilan untuk kedua password
  bool _isPasswordObscured = true;
  bool _isConfirmPasswordObscured = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back_ios, color: Color(0xFF003366)),
          onPressed: () => Navigator.pop(context),
        ),
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.symmetric(horizontal: 24.0),
          child: Form(
            key: _formKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  'Daftar Akun',
                  style: TextStyle(
                    fontSize: 28,
                    fontWeight: FontWeight.bold,
                    color: Color(0xFF003366),
                  ),
                ),
                const SizedBox(height: 8),
                const Text(
                  'Buat akun baru untuk mengakses LaPak Bantul',
                  style: TextStyle(fontSize: 14, color: Colors.grey),
                ),
                const SizedBox(height: 32),

                // --- Nama Lengkap ---
                TextFormField(
                  decoration: _buildInputDecoration('Nama Lengkap', Icons.person_outline),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Nama tidak boleh kosong';
                    }
                    return null;
                  },
                ),
                const SizedBox(height: 20),

                // --- Email ---
                TextFormField(
                  decoration: _buildInputDecoration('Email', Icons.email_outlined),
                  validator: (value) {
                    if (value == null || !value.contains('@')) {
                      return 'Masukkan email yang valid';
                    }
                    return null;
                  },
                ),
                const SizedBox(height: 20),

                // --- Nomor Telepon ---
                TextFormField(
                  decoration: _buildInputDecoration('Nomor Telepon', Icons.phone_outlined),
                  keyboardType: TextInputType.phone,
                  validator: (value) {
                    if (value == null || value.length < 10) {
                      return 'Nomor telepon tidak valid';
                    }
                    return null;
                  },
                ),
                const SizedBox(height: 20),

                // --- Kata Sandi ---
                TextFormField(
                  controller: _passwordController,
                  // Gunakan variabel status pertama
                  obscureText: _isPasswordObscured, 
                  decoration: _buildInputDecoration(
                    'Kata Sandi',
                    Icons.lock_outline,
                    isPassword: true,
                    obscureTextStatus: _isPasswordObscured,
                    // Tambahkan fungsi untuk mengubah status input ini
                    onEyePressed: () {
                      setState(() {
                        _isPasswordObscured = !_isPasswordObscured;
                      });
                    },
                  ),
                  validator: (value) {
                    if (value == null || value.length < 6) {
                      return 'Kata sandi minimal 6 karakter';
                    }
                    return null;
                  },
                ),
                const SizedBox(height: 20),

                // --- Konfirmasi Kata Sandi ---
                TextFormField(
                  controller: _confirmPasswordController,
                  // Gunakan variabel status kedua
                  obscureText: _isConfirmPasswordObscured, 
                  decoration: _buildInputDecoration(
                    'Konfirmasi Kata Sandi',
                    Icons.lock_outline,
                    isPassword: true,
                    obscureTextStatus: _isConfirmPasswordObscured,
                    // Tambahkan fungsi untuk mengubah status input ini
                    onEyePressed: () {
                      setState(() {
                        _isConfirmPasswordObscured = !_isConfirmPasswordObscured;
                      });
                    },
                  ),
                  validator: (value) {
                    if (value != _passwordController.text) {
                      return 'Kata sandi tidak cocok';
                    }
                    if (value == null || value.isEmpty) {
                      return 'Konfirmasi sandi diperlukan';
                    }
                    return null;
                  },
                ),
                const SizedBox(height: 32),

                // --- Tombol Daftar ---
                SizedBox(
                  width: double.infinity,
                  height: 55,
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: const Color(0xFF003366),
                      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
                    ),
                    onPressed: () {
                      if (_formKey.currentState!.validate()) {
                        Navigator.pop(context, 'register_success');
                      }
                    },
                    child: const Text(
                      'Daftar',
                      style: TextStyle(color: Colors.white, fontSize: 18, fontWeight: FontWeight.bold),
                    ),
                  ),
                ),
                const SizedBox(height: 20),
                Center(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Text('Sudah punya akun? '),
                      GestureDetector(
                        onTap: () => Navigator.pop(context),
                        child: const Text(
                          'Masuk',
                          style: TextStyle(color: Color(0xFF003366), fontWeight: FontWeight.bold),
                        ),
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 40),
              ],
            ),
          ),
        ),
      ),
    );
  }

  // Update fungsi helper untuk menangani interaksi ikon mata
  InputDecoration _buildInputDecoration(
    String label,
    IconData icon, {
    bool isPassword = false,
    bool? obscureTextStatus, // Terima status terbaru
    VoidCallback? onEyePressed, // Terima fungsi klik
  }) {
    return InputDecoration(
      labelText: label,
      prefixIcon: Icon(icon, color: const Color(0xFF003366)),
      // Gunakan IconButton di sini
      suffixIcon: isPassword
          ? IconButton(
              icon: Icon(
                obscureTextStatus!
                    ? Icons.visibility_off_outlined
                    : Icons.visibility_outlined,
                color: Colors.grey,
              ),
              onPressed: onEyePressed, // Panggil fungsi saat dipencet
            )
          : null,
      border: OutlineInputBorder(borderRadius: BorderRadius.circular(12)),
      errorBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(12),
        borderSide: const BorderSide(color: Colors.red),
      ),
      focusedErrorBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(12),
        borderSide: const BorderSide(color: Colors.red, width: 2),
      ),
    );
  }
}