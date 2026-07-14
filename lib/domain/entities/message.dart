enum FromWho { me, hers }

class Message {
  final String text;
  final String? imageUrl;
  final FromWho fromWho;
  //se puede agrega r hora, si fue leido o no

  Message({required this.text, this.imageUrl, required this.fromWho});
}
