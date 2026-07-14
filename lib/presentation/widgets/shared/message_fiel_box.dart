import 'package:flutter/material.dart';

class MessageFieldBox extends StatelessWidget {
  final ValueChanged<String> onValue;

  const MessageFieldBox({super.key, required this.onValue});

  @override
  Widget build(BuildContext context) {
    final textController = TextEditingController();
    final FocusNode focusNode = FocusNode();

    final outlineInputBorder = UnderlineInputBorder(
      borderSide: BorderSide(color: Colors.transparent),
      borderRadius: BorderRadius.circular(40),
    );

    final inputDecoration = InputDecoration(
      hintText: 'Escribe un mensaje con "?"',
      enabledBorder: outlineInputBorder,
      focusedBorder: outlineInputBorder,
      filled: true,
      suffixIcon: IconButton(
        icon: const Icon(Icons.send_outlined),
        onPressed: () {
          final textValue = textController.value.text;
          onValue(
            textValue,
          ); // Llama a la función onValue con el texto ingresado
          textController.clear(); // Limpia el campo de texto después de enviar
        },
      ),
    );
    return TextFormField(
      // keyboardType: ,
      onTapOutside: (event) {
        focusNode.unfocus(); // Desenfoca el campo de texto al tocar fuera
      },
      focusNode: focusNode,
      controller: textController,
      decoration: inputDecoration,
      onFieldSubmitted: (value) {
        textController.clear(); // Limpia el campo de texto después de enviar
        focusNode.requestFocus(); // Mantiene el foco en el campo de texto
        onValue(value); // Llama a la función onValue con el texto ingresado
      },
      // onChanged: (value) {
      //   print('Valor cambiado: $value');
      // },
    );
  }
}
