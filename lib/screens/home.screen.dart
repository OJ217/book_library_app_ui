import 'package:book_library_app_ui/constants/color.constant.dart';
import 'package:book_library_app_ui/models/new_book.model.dart';
import 'package:book_library_app_ui/models/book.model.dart';
import 'package:book_library_app_ui/screens/book_detail.screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/svg.dart';
import 'package:google_fonts/google_fonts.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  List<NewBookModel> newBooks = [];
  List<BookModel> popularBooks = [];

  @override
  initState() {
    super.initState();
    newBooks = NewBookModel.getNewBooks();
    popularBooks = BookModel.getPopularBooks();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SafeArea(
      child: Container(
          padding: const EdgeInsets.all(24.0),
          child: ListView(
            physics: const BouncingScrollPhysics(),
            children: [
              _builHomeHeader(),
              const SizedBox(
                height: 24.0,
              ),
              _buildSearchField(),
              const SizedBox(
                height: 32.0,
              ),
              _buildTabBar(),
              const SizedBox(
                height: 24.0,
              ),
              _buildNewBooksList(),
              const SizedBox(
                height: 32.0,
              ),
              _buildPopularBooksHeader(),
              const SizedBox(
                height: 24.0,
              ),
              _buildPopularBooksList(),
            ],
          )),
    ));
  }

  ListView _buildPopularBooksList() {
    return ListView.separated(
      shrinkWrap: true,
      itemCount: popularBooks.length,
      itemBuilder: (context, index) => GestureDetector(
        onTap: () {
          Navigator.push(
              context,
              MaterialPageRoute(
                  builder: (context) =>
                      BookDetailScreen(bookDetail: popularBooks[index])));
        },
        child: Row(
          children: [
            Container(
              height: 80,
              width: 60,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(6.0),
                  image: DecorationImage(
                      image: AssetImage(popularBooks[index].image))),
            ),
            const SizedBox(
              width: 24.0,
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  popularBooks[index].title,
                  style: const TextStyle(
                      color: kBlackColor,
                      fontSize: 16.0,
                      fontWeight: FontWeight.w600),
                ),
                const SizedBox(
                  height: 4.0,
                ),
                Text(
                  popularBooks[index].author,
                  style: const TextStyle(
                      color: kGreyColor,
                      fontSize: 10.0,
                      fontWeight: FontWeight.w500),
                ),
                const SizedBox(
                  height: 4.0,
                ),
                Text(
                  '\$${popularBooks[index].price}',
                  style: const TextStyle(
                      color: kBlackColor,
                      fontSize: 14.0,
                      fontWeight: FontWeight.w600),
                ),
              ],
            )
          ],
        ),
      ),
      separatorBuilder: (context, index) => const SizedBox(height: 20.0),
    );
  }

  Text _buildPopularBooksHeader() {
    return const Text(
      'Popular',
      style: TextStyle(
          color: kBlackColor, fontSize: 22.0, fontWeight: FontWeight.w600),
    );
  }

  SizedBox _buildNewBooksList() {
    return SizedBox(
      height: 212.0,
      child: ListView.separated(
        itemCount: newBooks.length,
        physics: const BouncingScrollPhysics(),
        scrollDirection: Axis.horizontal,
        itemBuilder: (context, index) => Container(
          height: 212.0,
          width: 156.0,
          decoration: BoxDecoration(
              color: kMainColor,
              borderRadius: BorderRadius.circular(12.0),
              image: DecorationImage(image: AssetImage(newBooks[index].image))),
        ),
        separatorBuilder: (context, index) => const SizedBox(width: 20.0),
      ),
    );
  }

  SizedBox _buildTabBar() {
    return SizedBox(
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
            dividerColor: Colors.transparent,
            labelStyle: GoogleFonts.openSans(
              fontSize: 14.0,
              fontWeight: FontWeight.w700,
            ),
            indicatorSize: TabBarIndicatorSize.label,
            indicatorColor: kBlackColor,
            overlayColor:
                MaterialStateColor.resolveWith((states) => Colors.transparent),
            tabs: const [
              Tab(
                child: Text('New'),
              ),
              SizedBox(
                width: 24.0,
              ),
              Tab(
                child: Text('Trending'),
              ),
              SizedBox(
                width: 24.0,
              ),
              Tab(
                child: Text('Best Seller'),
              ),
            ]),
      ),
    );
  }

  Container _buildSearchField() {
    return Container(
      height: 40.0,
      decoration: BoxDecoration(
          color: kLightGreyColor, borderRadius: BorderRadius.circular(12.0)),
      child: Stack(
        children: [
          const TextField(
            maxLengthEnforcement: MaxLengthEnforcement.enforced,
            style: TextStyle(
                color: kBlackColor,
                fontSize: 12.0,
                fontWeight: FontWeight.w600),
            decoration: InputDecoration(
                contentPadding:
                    EdgeInsets.only(left: 20.0, bottom: 8.0, right: 48.0),
                border: InputBorder.none,
                hintText: 'Search Book',
                hintStyle: TextStyle(
                    color: kGreyColor,
                    fontSize: 12.0,
                    fontWeight: FontWeight.w600)),
          ),
          Positioned(
              right: 0.0,
              child: Container(
                height: 40.0,
                width: 40.0,
                decoration: BoxDecoration(
                    color: kMainColor,
                    borderRadius: BorderRadius.circular(12.0)),
                child: Center(
                  child: SvgPicture.asset('assets/icons/icon_search_white.svg'),
                ),
              ))
        ],
      ),
    );
  }

  Column _builHomeHeader() {
    return const Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Hi, Linus',
          style: TextStyle(
              color: kGreyColor, fontSize: 14.0, fontWeight: FontWeight.w600),
        ),
        Text(
          'Discover Latest Books',
          style: TextStyle(
              color: kBlackColor, fontSize: 22.0, fontWeight: FontWeight.w600),
        )
      ],
    );
  }
}
