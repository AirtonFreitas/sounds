import 'package:flutter/material.dart';
import 'package:just_audio/just_audio.dart';
import '../../../utils/colors_utils.dart';

class AnimalsBody extends StatefulWidget {
  const AnimalsBody({Key? key}) : super(key: key);

  @override
  State<AnimalsBody> createState() => _AnimalsBodyState();
}

class _AnimalsBodyState extends State<AnimalsBody> {
  String imageBig = 'lion';

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        Padding(
          padding: EdgeInsets.all(8),
          child: Image.asset(
            'assets/images_sounds/$imageBig.png',
            width: MediaQuery.of(context).size.width,
          ),
        ),
        Text(
          'Toque um dos Animais',
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
            _circleAvatar(image: 'lion', sound: 'lion'),
            _circleAvatar(image: 'zebra', sound: 'zebra'),
            _circleAvatar(image: 'girafa', sound: 'girafa'),
            _circleAvatar(image: 'gorila', sound: 'gorila'),
            SizedBox(
              width: 28,
            ),
          ],
        ),
        SizedBox(
          height: 28,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SizedBox(
              width: 28,
            ),
            _circleAvatar(image: 'tiger', sound: 'tiger'),
            _circleAvatar(image: 'jaguar', sound: 'jaguar'),
            _circleAvatar(image: 'elephant', sound: 'elephant'),
            SizedBox(
              width: 28,
            ),
          ],
        ),
      ],
    );
  }

  _circleAvatar({required String sound, required String image}) {
    return CircleAvatar(
      backgroundColor: ColorsUtils.t,
      radius: 30,
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
