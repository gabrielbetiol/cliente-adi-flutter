class Comment {
  int id;
  String descricao;
  String dataEnvio;

  Comment({this.id, this.descricao, this.dataEnvio});

  Comment.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    descricao = json['descricao'];
    dataEnvio = json['dataEnvio'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['descricao'] = this.descricao;
    data['dataEnvio'] = this.dataEnvio;
    return data;
  }
}
