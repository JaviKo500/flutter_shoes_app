import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shoes_app/src/models/shoe_model.dart';
import 'package:shoes_app/src/pages/shoe_desc_page.dart';


class ShoeSizePreview extends StatelessWidget {
  final bool fullScreen;
  const ShoeSizePreview ({
    Key? key,
    this.fullScreen = false
  }) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        if ( !fullScreen) {
          Navigator.push(context,  MaterialPageRoute(builder: ( _ ) => ShoeDescPage()));
        }
      },
      child: Padding(
        padding: EdgeInsets.symmetric(
          horizontal: fullScreen ? 5:  30, 
          vertical: fullScreen ? 5 :  5
        ),
        child: Container(
          width: double.infinity,
          height: fullScreen ? 410 : 430,
          decoration: BoxDecoration(
            color: const Color(0xffFFCF53),
            borderRadius: !fullScreen 
            ? BorderRadius.circular(50)
            : const BorderRadius.only( 
                bottomLeft: Radius.circular( 50 ),
                bottomRight: Radius.circular( 50 ),
                topLeft: Radius.circular( 40 ),
                topRight: Radius.circular( 40 ),
              )
            ),
          child: Column(
            children: [
              const _ShoeShadow(),
              if( !fullScreen )
                const _ShoeSize(),
            ],
          )
        ),
      ),
    );
  }
}


class _ShoeSize extends StatelessWidget {

const _ShoeSize({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric( horizontal: 10),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: const  [
          _CardSizeShoe( size: 7,),
          _CardSizeShoe( size: 7.5,),
          _CardSizeShoe( size: 8,),
          _CardSizeShoe( size: 8.5,),
          _CardSizeShoe( size: 9,),
          _CardSizeShoe( size: 9.5,),
        ],
      ),
    );
  }
}

class _CardSizeShoe extends StatelessWidget {
  final double size;
  const _CardSizeShoe({
    Key? key,
    required this.size,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final shoeModel = Provider.of<ShoeModel>(context);
    return GestureDetector(
      onTap: () {
        shoeModel.size = size;
      },
      child: Container(
        alignment: Alignment.center,
        width: 45,
        height: 45,
        decoration: BoxDecoration(
          color: size == shoeModel.size ? const Color(0xffF1A23A) : Colors.white,
          borderRadius: BorderRadius.circular(10),
          boxShadow: size == shoeModel.size 
          ? [ const BoxShadow(
              color: Color(0xffF1A23A),
              blurRadius: 10,
              offset: Offset(0, 5)
              )
            ] 
          : []
        ),
        child: Text(
          size.toString().replaceAll('.0', ''),
          style: TextStyle(
            color: size == shoeModel.size ? Colors.white : const Color(0xffF1A23A),
            fontSize: 16,
            fontWeight: FontWeight.bold
          ),
        ),
      ),
    );
  }
}


class _ShoeShadow extends StatelessWidget {

const _ShoeShadow({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    final shoeModel = Provider.of<ShoeModel>(context);
    return Padding(
      padding: const EdgeInsets.all(50),
      child: Stack(
        children: [
          const Positioned(
            bottom: 20,
            right: 0,
            child: _Shadow()
          ),
          Image(image: AssetImage(shoeModel.assetImage)),
        ],
      ),
    );
  }
}


class _Shadow extends StatelessWidget {

const _Shadow({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Transform.rotate(
      angle: -0.5,
      child: Container(
        width: 230,
        height: 120,
        decoration: BoxDecoration(
          // color: Colors.red,
          borderRadius: BorderRadius.circular(100),
          boxShadow: const [
            BoxShadow(
              color: Color(0xffEAA14E),
              blurRadius: 40,
            )
          ]
        ),
       ),
    );
  }
}