import 'package:flutter/material.dart';

class Avatar extends StatefulWidget {
  final double size;
  final String uri;
  const Avatar({super.key, required this.size, required this.uri});
  @override
  // ignore: library_private_types_in_public_api
  _AvatarState createState() => _AvatarState();
}

class _AvatarState extends State<Avatar> {
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        shape: BoxShape.circle,
      ),
      child: ClipOval(
          child: /*Image.network(
        widget.uri,
        width: widget.size,
        height: widget.size,
        fit: BoxFit.cover,
      )*/
              Image.asset(
        widget.uri,
        width: widget.size,
        height: widget.size,
        fit: BoxFit.cover,
      )),
    );
  }
}
