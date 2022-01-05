import 'package:dispatcher/core/utils/constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class FeedComponent extends StatelessWidget {
  final _formKey = GlobalKey<FormState>();

  FeedComponent({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        return Padding(
          padding: EdgeInsets.symmetric(
            horizontal: constraints.maxWidth / 13.8,
          ),
          child: Column(
            children: [
              Row(
                children: [
                  SvgPicture.asset(VECTOR_IMAGES_PATH + 'dummy_avatar.svg'),
                  Container(
                    width: constraints.maxWidth / 2.74,
                    child: Text(
                      'Good morning, Helen',
                      maxLines: 2,
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.w500,
                        height: 27 / 18,
                        color: Colors.black,
                      ),
                    ),
                  ),
                  SizedBox.expand(),
                  InkWell(
                    child: Icon(Icons.notifications_outlined),
                    onTap: () {
                      print('Tapped the notifications icon');
                    },
                  ),
                ],
              ),
              Container(
                child: Form(
                  key: _formKey,
                  child: TextFormField(
                    decoration: InputDecoration(
                      border: InputBorder.none,
                      prefixIcon: Icon(Icons.search),
                      suffix: IconButton(
                        onPressed: () {},
                        icon: Icon(Icons.filter),
                      ),
                      hintText: 'What do you want delivered?',
                    ),
                  ),
                ),
              ),
              // TODO: Finish the feed component
            ],
          ),
        );
      },
    );
  }
}
