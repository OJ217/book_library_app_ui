import 'package:book_library_app_ui/constants/color.constant.dart';
import 'package:book_library_app_ui/models/book.model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:google_fonts/google_fonts.dart';

class BookDetailScreen extends StatelessWidget {
  final BookModel bookDetail;

  const BookDetailScreen({super.key, required this.bookDetail});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        bottomNavigationBar: _buildElevatedButton(),
        body: SafeArea(
            child: CustomScrollView(
          slivers: [_buildSliverAppBar(context), _buildBookDetailSection()],
        )));
  }

  SliverToBoxAdapter _buildBookDetailSection() {
    return SliverToBoxAdapter(
      child: Padding(
        padding: const EdgeInsets.all(24.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              bookDetail.title,
              style: const TextStyle(
                  color: kBlackColor,
                  fontSize: 28.0,
                  fontWeight: FontWeight.w700),
            ),
            const SizedBox(
              height: 8.0,
            ),
            Text(
              bookDetail.author,
              style: const TextStyle(
                  color: kGreyColor,
                  fontSize: 16.0,
                  fontWeight: FontWeight.w500),
            ),
            const SizedBox(
              height: 8.0,
            ),
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  '\$',
                  style: TextStyle(
                      color: kMainColor,
                      fontSize: 18.0,
                      fontWeight: FontWeight.w600),
                ),
                Text(
                  bookDetail.price,
                  style: const TextStyle(
                      color: kMainColor,
                      fontSize: 32.0,
                      fontWeight: FontWeight.w600),
                ),
              ],
            ),
            const SizedBox(
              height: 20.0,
            ),
            SizedBox(
              height: 36.0,
              child: DefaultTabController(
                length: 5,
                animationDuration: const Duration(milliseconds: 300),
                child: TabBar(
                    isScrollable: true,
                    labelColor: kBlackColor,
                    unselectedLabelColor: kGreyColor,
                    labelPadding: const EdgeInsets.all(0.0),
                    indicatorPadding: const EdgeInsets.all(0.0),
                    tabAlignment: TabAlignment.start,
                    dividerColor: const Color.fromRGBO(0, 0, 0, 0),
                    labelStyle: GoogleFonts.openSans(
                      fontSize: 14.0,
                      fontWeight: FontWeight.w700,
                    ),
                    indicatorSize: TabBarIndicatorSize.label,
                    indicatorColor: kBlackColor,
                    overlayColor: MaterialStateColor.resolveWith(
                        (states) => Colors.transparent),
                    tabs: const [
                      Tab(
                        child: Text('Description'),
                      ),
                      SizedBox(
                        width: 24.0,
                      ),
                      Tab(
                        child: Text('Reviews (20)'),
                      ),
                      SizedBox(
                        width: 24.0,
                      ),
                      Tab(
                        child: Text('Similar'),
                      ),
                    ]),
              ),
            ),
            const SizedBox(
              height: 40.0,
            ),
            Text(
              bookDetail.description,
              style: const TextStyle(
                  color: kGreyColor,
                  fontSize: 14.0,
                  fontWeight: FontWeight.w600,
                  height: 2),
            )
          ],
        ),
      ),
    );
  }

  SliverAppBar _buildSliverAppBar(BuildContext context) {
    return SliverAppBar(
      automaticallyImplyLeading: false,
      backgroundColor: Color(bookDetail.color),
      expandedHeight: MediaQuery.of(context).size.height * 0.45,
      flexibleSpace: SizedBox(
        height: MediaQuery.of(context).size.height * 0.5,
        child: Stack(
          children: [
            Positioned(
                left: 24.0,
                top: 24.0,
                child: GestureDetector(
                  onTap: () {
                    Navigator.pop(context);
                  },
                  child: Container(
                    width: 32.0,
                    height: 32.0,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(4.0),
                        color: kWhiteColor),
                    child: Center(
                      child:
                          SvgPicture.asset('assets/icons/icon_back_arrow.svg'),
                    ),
                  ),
                )),
            Align(
              alignment: Alignment.bottomCenter,
              child: Container(
                width: 172.0,
                height: 224.0,
                margin: const EdgeInsets.only(bottom: 60.0),
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(16.0),
                    image:
                        DecorationImage(image: AssetImage(bookDetail.image))),
              ),
            )
          ],
        ),
      ),
    );
  }

  Container _buildElevatedButton() {
    return Container(
        margin: const EdgeInsets.only(left: 24.0, right: 24.0, bottom: 40.0),
        child: ElevatedButton(
          onPressed: () {},
          style: ElevatedButton.styleFrom(
              backgroundColor: kMainColor,
              foregroundColor: Colors.deepOrange[100],
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(8.0))),
          child: const Text(
            'Add to Library',
            style: TextStyle(
                color: kWhiteColor,
                fontSize: 14.0,
                fontWeight: FontWeight.w600),
          ),
        ));
  }
}
