import 'package:flutter/material.dart';
<<<<<<< HEAD
import '../controle/usuarioController.dart';
import '../modelo/classes/usuario.dart';

class Perfil extends StatefulWidget  {
  const Perfil({super.key});

  @override
  State<Perfil>createState()=>_PerfilState();
  }
  class _PerfilState extends State<Perfil> {
  Usuario? _usuario;
  @override
  void initState() {
    super.initState();
    carregarUsuario();  
  }
  Future<void>carregarUsuario() async{
    final usuario = await UsuarioController.usuarioLogado();
    setState(() {
      _usuario=usuario;
    });
  }
  void _logout() async{
    await UsuarioController.logout();
    Navigator.pushReplacementNamed(context, '/login');
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Meu Perfil")),
      body: _usuario == null
          ? const Center(child: CircularProgressIndicator())
          : Padding(
              padding: const EdgeInsets.all(25),
              child: Column(
                children: [
                  const SizedBox(height: 40),
=======
import 'login.dart';

class Perfil extends StatelessWidget {
  const Perfil({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Meu Perfil")),

      body: Padding(
        padding: const EdgeInsets.all(25),

        child: Column(
          children: [
            const SizedBox(height: 40),
>>>>>>> f053e02052f7b5fdeb3393a41ad71d0efe96d857

            // foto
            CircleAvatar(
              radius: 45,
              backgroundColor: Colors.deepPurple.shade100,
              child: const Icon(
                Icons.person,
                size: 50,
                color: Colors.deepPurple,
              ),
            ),

            const SizedBox(height: 20),

            // nome
<<<<<<< HEAD
            Text(
              _usuario!.nome,
=======
            const Text(
              "Augusto Cesar",
>>>>>>> f053e02052f7b5fdeb3393a41ad71d0efe96d857
              style: TextStyle(fontSize: 26, fontWeight: FontWeight.bold),
            ),

            const SizedBox(height: 8),

            // email
<<<<<<< HEAD
            Text(
              _usuario!.email,
=======
            const Text(
              "gutosousa002@gmail.com",
>>>>>>> f053e02052f7b5fdeb3393a41ad71d0efe96d857
              style: TextStyle(fontSize: 16, color: Colors.grey),
            ),
            const SizedBox(height: 15),
            // botao de sair
            SizedBox(
              width: double.infinity,
              height: 55,
              child: OutlinedButton(
<<<<<<< HEAD
                onPressed: _logout, 
=======
                onPressed: () {
                  Navigator.pushReplacementNamed(context, '/login');
                },
>>>>>>> f053e02052f7b5fdeb3393a41ad71d0efe96d857
                style: OutlinedButton.styleFrom(
                  side: const BorderSide(color: Colors.red, width: 1.5),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(30),
<<<<<<< HEAD
                   ),
                      ),
                      child: const Text(
                        "Sair da Conta",
                        style: TextStyle(color: Colors.red, fontSize: 18),
                      ),
                    ),
                  ),
                ],
              ),
            ),
=======
                  ),
                ),
                child: const Text(
                  "Sair da Conta",
                  style: TextStyle(color: Colors.red, fontSize: 18),
                ),
              ),
            ),
          ],
        ),
      ),
>>>>>>> f053e02052f7b5fdeb3393a41ad71d0efe96d857
    );
  }
}
