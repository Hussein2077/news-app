import 'package:flutter/material.dart';
class BuildArticals extends StatelessWidget {
  const BuildArticals({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return  Padding(
      padding: const EdgeInsets.all(20.0),
      child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisSize: MainAxisSize.min,
          children: [

            Container(
              width: 120,
              height: 120,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(16),
                image: DecorationImage(
                    image: NetworkImage(
                      'https://th.bing.com/th?id=OP.OuH2xFuMcCVFJQ474C474&o=5&pid=21.1',
                    ),
                    fit: BoxFit.cover),
              ),
            ),
            const SizedBox(width: 10,),
            Expanded(
              child: Container(
                height: 120,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,

                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Expanded(child: Text('Title',
                      style: TextStyle(
                        fontWeight: FontWeight.w700,
                        fontSize: 21,
                      ),
                      maxLines: 4,
                      overflow: TextOverflow.ellipsis,
                    ))
                    ,
                    Expanded(child: Text('2021/253/55',
                      style: TextStyle(
                          color: Colors.grey
                      ),
                    ))],
                ),
              ),
            ),
          ]),
    );
  }
}
