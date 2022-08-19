import 'package:flutter/material.dart';
import 'package:just_audio/just_audio.dart';

import '../../../utils/colors_utils.dart';

class ToolsBody extends StatefulWidget {
  const ToolsBody({Key? key}) : super(key: key);

  @override
  State<ToolsBody> createState() => _ToolsBodyState();
}

class _ToolsBodyState extends State<ToolsBody> {
  String imageBig = 'furadeira';

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        SizedBox(
          height: 28,
        ),
        Padding(
          padding: EdgeInsets.all(8),
          child: Image.asset(
            'assets/images_sounds/$imageBig.png',
            width: MediaQuery.of(context).size.width,
          ),
        ),
        SizedBox(
          height: 80,
        ),
        Text(
          'Toque uma das Ferramentas',
          style: TextStyle(fontSize: 18),
        ),
        SizedBox(
          height: 12,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            SizedBox(
              width: 28,
            ),
            _circleAvatar(image: 'furadeira', sound: 'furadeira'),
            _circleAvatar(image: 'serrote', sound: 'serrote'),
            _circleAvatar(image: 'martelo', sound: 'martelo'),
            _circleAvatar(image: 'cliped', sound: 'cliped'),
            SizedBox(
              width: 28,
            ),
          ],
        )
      ],
    );
  }

  _circleAvatar({required String sound, required String image}) {
    return CircleAvatar(
      radius: 30,
      backgroundColor: ColorsUtils.t,
      child: InkWell(
        onTap: () {
          _setImage('$image');
          _sound('$sound');
        },
        child: Image.asset('assets/images_sounds/$image.png'),
      ),
    );
  }

  _sound(String sound) {
    final _player = AudioPlayer();
    _player.setAsset('assets/sound/$sound.wav');
    _player.play();
  }

  _setImage(String image) {
    setState(() {
      imageBig = image;
    });
  }
}
