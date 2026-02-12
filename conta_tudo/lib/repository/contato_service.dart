import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:conta_tudo/models/contato_model.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class ContatoService {
  final FirebaseFirestore _db = FirebaseFirestore.instance;
  final FirebaseAuth _auth = FirebaseAuth.instance;

  // Esta pegando o id logado
  String get _userId => _auth.currentUser!.uid;

  /// Adicionar novos contatos
  Future<void> addContato(ContatoModel contato) async {
    try {
      await _db
          .collection('users') // acessa a colecao usuario
          .doc(_userId) // entra no doc e pega o id logado
          .collection('contato') // entra na subcolecao
          .add(contato.toMap());
    } catch (e) {
      debugPrint('Erro ao salvar $e');
    }
  }

  ///Ler os contatos
  // Aqui estamos usando o Stream para atualizar em tempo real, ele funciona como uma transmissao ao vivo
  Stream<List<ContatoModel>> getContatos() {
    return _db
        .collection('users')
        .doc(_userId)
        .collection('contato')
        .orderBy('nome')
        .snapshots()
        .map(
          (snapshot) => snapshot.docs
              .map((doc) => ContatoModel.fromMap(doc.data(), doc.id))
              .toList(),
        );
  }
}
