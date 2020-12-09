import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class PageSlider extends StatefulWidget {
  final List<Widget> components;

  PageSlider({@required this.components});

  @override
  _PageSlider createState() => _PageSlider(components: this.components);
}

class _PageSlider extends State<PageSlider> {
  final List<Widget> components;
  ScrollController scrollController;

  _PageSlider({@required this.components});

  @override
  void initState() {
    this.scrollController = ScrollController();
    super.initState();
  }

  List<Widget> dotItems(int position) {
    List<Widget> components = List<Widget>();

    for (int index = 0; index < this.components.length; index++) {
      components.add(GestureDetector(
        onTap: () {
          this.toPagePosition(index);
        },
        child: Container(
          margin: EdgeInsets.only(right: 6, left: 6),
          height: index == position ? 10 : 8,
          width: index == position ? 10 : 8,
          decoration: BoxDecoration(
              color: index == position
                  ? Theme.of(context).primaryColor
                  : Theme.of(context).primaryColorLight,
              shape: BoxShape.circle),
        ),
      ));
    }

    return components;
  }

  toPagePosition(int position) {
    this.scrollController.animateTo(
        MediaQuery.of(context).size.width * position,
        duration: Duration(milliseconds: 250),
        curve: Curves.ease);
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Expanded(
          child: Container(
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              controller: scrollController,
              physics: NeverScrollableScrollPhysics(),
              shrinkWrap: true,
              itemCount: this.components.length,
              itemBuilder: (BuildContext context, int index) {
                return this.components[index];
              },
            ),
          ),
        ),
      ],
    );
  }
}
