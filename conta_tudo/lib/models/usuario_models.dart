class UsuarioModels {
  final String id;
  final String nome;
  final String email;
  final String sobrenome;
  final String? fotoPerfil;
  final DateTime dataCriacao;
  bool isGoogle;

  UsuarioModels({
    required this.id,
    required this.nome,
    required this.sobrenome,
    this.fotoPerfil,
    this.isGoogle = false,
    required this.email,
    required this.dataCriacao,
  });

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'nome': nome,
      'sobrenome': sobrenome,
      'foto_perfil': fotoPerfil,
      'is_google': isGoogle,
      'email': email,
      'data_criacao': dataCriacao,
    };
  }

  factory UsuarioModels.fromMap(Map<String, dynamic> map) {
    return UsuarioModels(
      id: map['id'] ?? '',
      nome: map['nome'] ?? 'Fulano',
      sobrenome: map['sobrenome'] ?? 'Desconhecido',
      fotoPerfil: map['foto_perfil'],
      isGoogle: map['is_google'] ?? false,
      email: map['email'] ?? '',
      dataCriacao: map['data_criacao'] ?? '',
    );
  }

  UsuarioModels copyWith({
    String? nome,
    String? sobrenome,
    String? fotoPerfil,
    String? email,
    DateTime? dataCriacao,
  }) {
    return UsuarioModels(
      id: id,
      nome: nome ?? this.nome,
      sobrenome: sobrenome ?? this.sobrenome,
      email: email ?? this.email,
      dataCriacao: dataCriacao ?? this.dataCriacao,
    );
  }

  @override
  String toString() {
    return 'UsuarioModels(id: $id, nome: $nome, email $email)';
  }
}
