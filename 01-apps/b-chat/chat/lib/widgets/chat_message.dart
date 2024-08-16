import 'package:flutter/material.dart';

class ChatMessage extends StatelessWidget {

  final String texto;
  final String uid;

  const ChatMessage({
    super.key, 
    required this.texto, 
    required this.uid
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      child: this.uid == '123'
      ? _myMessage()
      : _notMyMessage(),
    );
  }
  
  Widget _myMessage() {
    return Align( // alinea todo el contenido al centido que se quiera
      alignment : Alignment.centerRight,
      child : Container(
        padding   : EdgeInsets.all(8.0),
        margin    : EdgeInsets.only(
          bottom: 5,
          left: 50
        ),
        child     : Text(this.texto, style: TextStyle(color: Colors.white)),
        decoration: BoxDecoration(
          color       : Color.fromARGB(255, 77, 159, 248),
          borderRadius: BorderRadius.circular(20)
        ),
      ),
    );
  }
  
  Widget _notMyMessage() {
    return Align( // alinea todo el contenido al centido que se quiera
      alignment : Alignment.centerLeft,
      child : Container(
        padding   : EdgeInsets.all(8.0),
        margin    : EdgeInsets.only(
          bottom: 5,
          left:   5,
          right:  50
        ),
        child     : Text(this.texto, style: TextStyle(color: Colors.black87)),
        decoration: BoxDecoration(
          color       : Color.fromARGB(255, 224, 225, 228),
          borderRadius: BorderRadius.circular(20)
        ),
      ),
    );
  }
  
}