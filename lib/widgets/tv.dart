import 'package:flutter/material.dart';
import 'package:movie_app/utils/text.dart';

class TV extends StatelessWidget {
  final List tv;
  const TV({super.key, required this.tv});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          ModifiedText(
            text: 'TV Shows',
            size: 26,
            color: Colors.white,
          ),
          SizedBox(
            height: 10,
          ),
          Container(
            height: 200,
            child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: tv.length,
                itemBuilder: (context, index) {
                  return InkWell(
                    onTap: () {},
                    child: Container(
                      padding: EdgeInsets.all(5),
                      width: 250,
                      child: Column(
                        children: [
                          Container(
                            width: 250,
                            height: 140,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(20),
                              image: DecorationImage(
                                  image: NetworkImage(
                                      'https://image.tmdb.org/t/p/w500' +
                                          tv[index]['backdrop_path']),
                                  fit: BoxFit.cover),
                            ),
                          ),
                          SizedBox(
                            height: 10,
                          ),
                          Container(
                            child: ModifiedText(
                                text: tv[index]['original_name'] != null
                                    ? tv[index]['original_name']
                                    : 'Loading',
                                color: Colors.white,
                                size: 12),
                          )
                        ],
                      ),
                    ),
                  );
                }),
          )
        ],
      ),
    );
  }
}
