class ContatoModel {
  final String id;
  final String nome;
  final String sobrenome;
  final DateTime dataAniversario;
  final bool? isFavorito;
  final DateTime dataCriacao;
  final List<String> emails;
  final List<String> numeros;

  ContatoModel({
    required this.id,
    required this.nome,
    required this.sobrenome,
    required this.dataAniversario,
    this.isFavorito = false,
    this.emails = const [],
    this.numeros = const [],
    required this.dataCriacao,
  });

  factory ContatoModel.fromMap(Map<String, dynamic> map, String docId) {
    return ContatoModel(
      id: docId,
      nome: map['nome'] ?? '',
      sobrenome: map['sobrenome'] ?? '',
      dataAniversario: map['data_aniversario'] != null
          ? (map['data_aniversario'] as dynamic).toDate()
          : null,
      isFavorito: map['is_favorito'] ?? false,
      emails: List<String>.from(map['emails'] ?? []),
      numeros: List<String>.from(map['numeros'] ?? []),
      dataCriacao: map['data_criacao'] ?? '',
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'nome': nome,
      'sobrenome': sobrenome,
      'data_aniversario': dataAniversario,
      'is_favorito': isFavorito,
      'emails': emails,
      'numeros': numeros,
      'data_criacao': dataCriacao,
    };
  }
}
