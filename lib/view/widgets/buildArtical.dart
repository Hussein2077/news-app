import 'package:flutter/material.dart';
class BuildArticals extends StatelessWidget {
  const BuildArticals({Key? key,required this.artical}) : super(key: key);
 final Map artical;
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
                    image: NetworkImage('${artical['image_url']}'),
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
                    Expanded(child: Text('${artical['title']}',
                      style: TextStyle(
                        fontWeight: FontWeight.w700,
                        fontSize: 16,
                      ),
                      maxLines: 4,
                      overflow: TextOverflow.ellipsis,
                    ))
                    ,
                    Text('${artical['pubDate']}',
                      style: TextStyle(
                          color: Colors.grey
                      ),
                    )],
                ),
              ),
            ),
          ]),
    );
  }
}
