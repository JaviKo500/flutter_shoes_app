import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shoes_app/src/helpers/helpers.dart';
import 'package:shoes_app/src/models/shoe_model.dart';
import 'package:shoes_app/src/widgets/widgets.dart';


class ShoeDescPage extends StatelessWidget {
  const ShoeDescPage ({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Stack(
            children: [
              const Hero(
                tag: 'shoe-1',
                child: ShoeSizePreview(
                  fullScreen: true,
                ),
              ),
              Positioned(
                top: 80,
                child: FloatingActionButton(
                  onPressed: () {
                    changeStatusDark();
                    Navigator.pop(context);
                  },
                  elevation: 0,
                  highlightElevation: 0,
                  backgroundColor: Colors.transparent,
                  child: const Icon(Icons.chevron_left, color: Colors.white, size: 60,),
                )
              )
            ],
          ),
          Expanded(
            child: SingleChildScrollView(
              child: Column(
                children: const [
                  ShoeDescription(
                    title: 'Nike Air Max 720', 
                    description: "The Nike Air Max 720 goes bigger than ever before with Nike's taller Air unit yet, offering more air underfoot for unimaginable, all-day comfort. Has Air Max gone too far? We hope so."
                  ),
                  _AmountButNow(),
                  _ColorsAndMore(),
                  _ButtonsLikeCardSettings()
                ],
              ),
            )
          )
        ],
      )
    );
  }
}

class _ButtonsLikeCardSettings extends StatelessWidget {
  const _ButtonsLikeCardSettings({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric( vertical: 30),
      padding: const EdgeInsets.symmetric( horizontal: 30),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          const _ShadowButton( icon: Icon(Icons.star, size: 25, color: Colors.red,)),
          _ShadowButton( icon: Icon(Icons.shopping_cart, size: 25, color: Colors.grey.withOpacity(0.4),)),
          _ShadowButton( icon: Icon(Icons.settings, size: 25, color: Colors.grey.withOpacity(0.4),)),
        ],
      ),
    );
  }
}

class _ShadowButton extends StatelessWidget {
  final Widget icon;
  const _ShadowButton({
    Key? key,
    required this.icon
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 55,
      height: 55,
      decoration: const BoxDecoration(
        color: Colors.white,
        shape: BoxShape.circle,
        boxShadow: [
          BoxShadow(
            color: Colors.black12,
            spreadRadius: -5,
            blurRadius: 20,
            offset: Offset(0, 10)
          )
        ]
      ),
      child: icon
    );
  }
}

class _ColorsAndMore extends StatelessWidget {
  const _ColorsAndMore({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric( horizontal: 30 ),
      child: Row(
        children: [
          Expanded(
            child: Stack(
              children: const [
                Positioned(
                  left: 90,
                  child: _ColorsButton( color: Color(0xffC6D642), index: 4, imageUrl: 'assets/images/verde.png',)),
                Positioned(
                  left: 60,
                  child: _ColorsButton( color: Color(0xffFFAD29), index: 3, imageUrl: 'assets/images/amarillo.png',)),
                Positioned(
                  left: 30,
                  child: _ColorsButton( color: Color(0xff2099F1), index: 2, imageUrl: 'assets/images/azul.png',)),
                Positioned(
                  child: _ColorsButton( color: Color(0xff364D56), index: 1, imageUrl: 'assets/images/negro.png',)),
              ],
            )
          ),
          const OrangeButton(
            text: 'More related items', 
            height: 30, 
            withButton: 170,
            color: Color(0xffFFC675),
          )
        ],
      ),
    );
  }
}

class _ColorsButton extends StatelessWidget {
  final Color color;
  final int index;
  final String imageUrl;
  const _ColorsButton({
    Key? key,
    required this.color,
    required this.index,
    required this.imageUrl,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    changeStatusLight();
    final shoeModel = Provider.of<ShoeModel>(context);
    return FadeInLeft(
      duration: const Duration( milliseconds: 300 ),
      delay: Duration( milliseconds: index * 100),
      child: GestureDetector(
        onTap: () {
          shoeModel.assetImage = imageUrl;
        },
        child: Container(
          width: 45,
          height: 45,
          decoration: BoxDecoration(
            color: color,
            shape: BoxShape.circle
          ), 
        ),
      ),
    );
  }
}

class _AmountButNow extends StatelessWidget {
  const _AmountButNow({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 30),
      margin: const EdgeInsets.only( top: 15, bottom: 20 ),
      child: Row(
        children: [
          const Text(
            '\$180.0',
            style: TextStyle(
              fontSize: 28,
              fontWeight: FontWeight.bold
            ),
          ),
          const Spacer(),
          Bounce(
            delay: const Duration( seconds: 1),
            from: 8,
            child: const OrangeButton(text: 'Buy now', withButton: 120, height: 40 ,)
          )

        ],
      ),
    );
  }
}