import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:fooddelivery/SettingScreen/profiledrawer.dart';
import 'package:google_fonts/google_fonts.dart';

import 'detailpage.dart';
final Map<String, List<Map<String, String>>> items = {
  "Burgers": [
    {
      "name": "Classic Beef Burger",
      "desc": "Juicy grilled beef patty with lettuce & cheese.",
      "img":
      "https://www.certifiedirishangus.ie/wp-content/uploads/2019/11/TheUltimateBurgerwBacon_RecipePic-1536x845.jpg"
    },
    {
      "name": "Cheese Burst Burger",
      "desc": "Melted cheddar oozing out of soft buns.",
      "img": "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRpl-SbwrDGcrLpdDCukQ8yYseB8DaLoU-2Ug&s"
    },
    {
      "name": "Chicken Supreme",
      "desc": "Grilled chicken fillet with creamy mayo.",
      "img":
      "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRQ9OTWKOqBXKbReFtJexqZZpNp1VQFpcFReQ&s"
    },
    {
      "name": "Veggie Delight",
      "desc": "Crispy veggie patty with fresh greens.",
      "img":
      "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRpl-SbwrDGcrLpdDCukQ8yYseB8DaLoU-2Ug&s"
    },
    {
      "name": "Spicy Zinger",
      "desc": "Crispy spicy chicken with hot sauce.",
      "img":
      "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSyw6I2Zg8z1s7flmzwRNDVRmO40wh8k601Ag&s"
    },
    {
      "name": "BBQ Burger",
      "desc": "Smoky BBQ sauce with beef patty & onions.",
      "img":
      "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSnV0OoHofy60aFW17rZEk31IzqrbYBHyHopw&s"
    },
    {
      "name": "Double Patty Burger",
      "desc": "Two juicy patties stacked with cheese.",
      "img":
      "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSIVNo7-WEaUbaSO5t0SF65yPnVNzgkfavcuA&s"
    },
  ],
  "Pizzas": [
    {
      "name": "Margherita Pizza",
      "desc": "Classic tomato, mozzarella & basil.",
      "img": "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcR0Lj3_8eh0xYQLDhyh1pYwOF6l00mL7hIfww&s"
    },
    {
      "name": "Pepperoni Pizza",
      "desc": "Loaded with cheese & spicy pepperoni.",
      "img": "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQPDzEOEACwcoI9C1JMygVPzRGa7IKC13QaINo9aHTM72SrnMepR8-NNJ54TB7YssP_QLE&usqp=CAU"
    },
    {
      "name": "BBQ Chicken Pizza",
      "desc": "Grilled chicken with smoky BBQ sauce.",
      "img": "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTIibPbOeDQQscm9g-fDNdCvROokQJukg8nYQ&s"
    },
    {
      "name": "Veggie Paradise",
      "desc": "Loaded with mushrooms, capsicum & olives.",
      "img": "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcS8Lh9Ga3RNE1HE2zwS62XlbBK9beGZezGciH3mhqwdFUZLKe7xeRigt4E7m8VKYenO2ac&usqp=CAU"
    },
    {
      "name": "Hawaiian Pizza",
      "desc": "Pineapple chunks with ham & cheese.",
      "img": "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTHsriE7w91ktz5Op-WMn5_Ca9kQqKKMnbaKPkwAjFjvb_ceSd1BzyZMh5-lQQM8YNtNuc&usqp=CAU"
    },
    {
      "name": "Four Cheese Pizza",
      "desc": "Mozzarella, cheddar, parmesan, gouda.",
      "img": "https://hips.hearstapps.com/hmg-prod/images/classic-cheese-pizza-recipe-2-64429a0cb408b.jpg?crop=0.8888888888888888xw:1xh;center,top&resize=1200:*"
    },
    {
      "name": "Meat Lovers Pizza",
      "desc": "Loaded with beef, chicken & sausages.",
      "img": "https://media.istockphoto.com/id/2156049905/photo/four-different-types-of-pizza-arranged-in-the-form-of-pizza.jpg?s=612x612&w=0&k=20&c=styI_N1wvgSWuHtPVpKTlMgP-lkEC5akwIo9IRnLOMo="
    },
  ],
  "Healthy": [
    {
      "name": "Caesar Salad",
      "desc": "Romaine lettuce with creamy dressing.",
      "img": "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRt6emBs4NVbYfIJX66wa5MOq6d-2IOzXj2JA&s"
    },
    {
      "name": "Greek Salad",
      "desc": "Feta cheese, olives & fresh veggies.",
      "img": "https://hips.hearstapps.com/hmg-prod/images/greek-salad-index-642f292397bbf.jpg?crop=0.888888888888889xw:1xh;center,top&resize=1200:*"
    },
    {
      "name": "Fruit Bowl",
      "desc": "Seasonal fruits with honey drizzle.",
      "img": "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQQbjh-gtkNGnM7yKsBYM4Hz-Mv2snKXpj1Fg&s"
    },
    {
      "name": "Quinoa Salad",
      "desc": "Quinoa with cherry tomatoes & spinach.",
      "img": "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSaeCUYW4TOXdwrwU3sLSG9ElQvz95sRgybMA&s"
    },
    {
      "name": "Detox Smoothie",
      "desc": "Green smoothie with kale & apple.",
      "img": "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcR-OPWVL7SQgQiPLPHIM4Y5tMX53udE6ISTIQ&s"
    },
    {
      "name": "Avocado Toast",
      "desc": "Whole wheat bread topped with avocado.",
      "img": "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTYLkpP2pBrhn0VLREE6PZh-RQplgrL0JG7rg&s"
    },
    {
      "name": "Grilled Veggies",
      "desc": "Zucchini, carrots & broccoli grilled fresh.",
      "img": "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSES2jirOxZ_0Ten1SpFSgEBSdAo_U7lU3YPg&s"
    },
  ],
  "Drinks": [
    {
      "name": "Coca Cola",
      "desc": "Chilled fizzy classic drink.",
      "img": "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRzPxiuSruZfxAVLCH6Kyqo895euLLa1p3rrg&s"
    },
    {
      "name": "Lemonade",
      "desc": "Refreshing lemon drink.",
      "img": "https://i2.wp.com/lmld.org/wp-content/uploads/2022/04/Lemonade-4.jpg"
    },
    {
      "name": "Iced Coffee",
      "desc": "Cold brewed coffee with ice cubes.",
      "img": "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSrumz0WZEwrjSWnv4I5QuiE9cech5aRr29sw&s"
    },
    {
      "name": "Orange Juice",
      "desc": "Fresh squeezed orange juice.",
      "img": "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcS_k3dmXxGhAIYtpo1VDWy8SJi30wQqJ5J9Ig&s"
    },
    {
      "name": "Strawberry Shake",
      "desc": "Sweet strawberry milkshake.",
      "img": "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQ3hS2o-RKmvJnuo4o9PrED_agl21tt9_dylw&s"
    },
    {
      "name": "Mango Smoothie",
      "desc": "Smooth blend of mango & milk.",
      "img": "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcReNDsNtoLQsbvM4RlRCsUb1BHVn_TNDbb_oQ&s"
    },
    {
      "name": "Iced Tea",
      "desc": "Cool refreshing iced tea.",
      "img": "https://images.themodernproper.com/production/posts/IcedTea_8.jpg?w=960&h=960&q=82&fm=jpg&fit=crop&dm=1716306653&s=e7e37b87126eaafc95ddb53435ba341e"
    },
  ],
  "Desserts": [
    {
      "name": "Chocolate Lava Cake",
      "desc": "Warm chocolate cake with a gooey molten center.",
      "img": "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRnuNMk8sS39SNEGW_8iNF6LwCp6H2u85nvzQ&s"
    },
    {
      "name": "Tiramisu",
      "desc": "Italian dessert made with coffee-soaked ladyfingers and mascarpone cheese.",
      "img": "https://www.kingarthurbaking.com/sites/default/files/2023-03/Tiramisu_1426.jpg"
    },
    {
      "name": "Cheesecake",
      "desc": "Creamy baked or no-bake dessert with a biscuit or graham cracker crust.",
      "img": "https://static01.nyt.com/images/2021/11/02/dining/dg-Tall-and-Creamy-Cheesecake-copy/dg-Tall-and-Creamy-Cheesecake-threeByTwoLargeAt2X.jpg"
    },
    {
      "name": "Macarons",
      "desc": "Colorful French meringue cookies with a soft, creamy filling.",
      "img": "https://www.jordanwinery.com/wp-content/uploads/2020/04/French-Macaron-Cookie-Recipe-WebHero-6435.jpg"
    },
    {
      "name": "Baklava",
      "desc": "Layered pastry filled with nuts and sweetened with honey or syrup.",
      "img": "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTqcXBktNsIimO0afpqZTFfKzsZaqzk-5FHsQ&s"
    },
    {
      "name": "Crème Brûlée",
      "desc": "Rich custard topped with a layer of caramelized sugar.",
      "img": "https://confessionsofabakingqueen.com/wp-content/uploads/2014/06/vanilla-bean-creme-brulee-recipe-1-of-1-2-683x1024.jpg"
    },
    {
      "name": "Ice Cream Sundae",
      "desc": "Ice cream topped with syrups, nuts, whipped cream, and cherries.",
      "img": "https://cookienameddesire.com/wp-content/uploads/2018/05/brownie-sundae.jpg"
    },
  ],
  // ✅ You can keep adding the rest (Desserts, Mexican, Sushi) the same way...
  "Mexican": [
    {
      "name": "Tacos",
      "desc": "Soft or crispy tortillas filled with meats, vegetables, and toppings.",
      "img": "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcR1nHG02s92DPIjxyRlhseB3Tg9Q7xSdBpyCQ&s"
    },
    {
      "name": "Enchiladas",
      "desc": "Rolled tortillas stuffed with meat or cheese, baked in chili sauce.",
      "img": "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcS9vx1zhh-D7XBjunHvJz1jaZ0Ltrx3tiJKiw&s"
    },
    {
      "name": "Quesadillas",
      "desc": "Grilled tortillas filled with melted cheese and optional fillings.",
      "img": "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcR1nHG02s92DPIjxyRlhseB3Tg9Q7xSdBpyCQ&s"
    },
    {
      "name": "Guacamole",
      "desc": "Creamy avocado dip mixed with lime, onions, and tomatoes.",
      "img": "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcT1eFLsmqm2EgcvV7kPCzq8OJOq94SG970ZGQ&s"
    },
    {
      "name": "Chiles Rellenos",
      "desc": "Roasted peppers stuffed with cheese or meat, battered, and fried.",
      "img": "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQcwz9pQMLBU6HN47rNt7dwQJxkZe9uzl4btw&s"
    },
    {
      "name": "Tamales",
      "desc": "Corn dough filled with meats or sweets, wrapped in corn husks, and steamed.",
      "img": "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRqwkZ6Ijv-jsx9EOUZJQLYTCaVPvCfLcL1ug&s"
    },
    {
      "name": "Pozole",
      "desc": "Hearty hominy soup with pork or chicken, garnished with fresh vegetables.",
      "img": "https://thefoodcharlatan.com/wp-content/uploads/2024/10/Pozole-Recipe-10.jpg"
    },
  ],
};
class Menuu extends StatefulWidget {
  const Menuu({super.key});

  @override
  State<Menuu> createState() => _MenuuState();
}

class _MenuuState extends State<Menuu> with TickerProviderStateMixin {
  int _selectedIndex = 0;
  final List<String> categories = [
    "Burgers",
    "Pizzas",
    "Healthy",
    "Drinks",
    "Desserts",
    "Mexican"
  ];
  final Map<String, bool> favorites = {};

  TextEditingController searchController = TextEditingController();
  List<Map<String, String>> searchResults = [];

  void updateSearch(String query) {
    if (query.isEmpty) {
      searchResults = [];
    } else {
      final allItems = items.values.expand((x) => x).toList();
      searchResults = allItems
          .where((item) =>
          item["name"]!.toLowerCase().contains(query.toLowerCase()))
          .toList();
    }
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    final currentCategory = categories[_selectedIndex];
    final currentItems = items[currentCategory] ?? [];

    return Scaffold(
      drawer: const Drawer(
        child: Account(), // 👈 Account screen inside drawer
      ),
      extendBodyBehindAppBar: true,
      body: Container(
        decoration: const BoxDecoration(
          gradient: RadialGradient(
            center: Alignment.center,
            radius: 1.2,
            colors: [
              Color(0xFF3E1F47),
              Color(0xFF0D7377),
            ],
            stops: [0.3, 1.0],
          ),
        ),
        child: Column(
          children: [
            // AppBar + Search
            SafeArea(
              bottom: false,
              child: Padding(
                padding:
                const EdgeInsets.only(left: 16, right: 16, top: 8, bottom: 8),
                child: Column(
                  children: [
                    Row(
                      children: [
                        Builder(
                          builder: (context) => GestureDetector(
                            onTap: () {
                              Scaffold.of(context).openDrawer(); // 👈 now works
                            },
                            child: CircleAvatar(
                              radius: 22,
                              backgroundColor: Colors.white.withOpacity(0.15),
                              child: const Icon(
                                Icons.person,
                                color: Colors.white,
                                size: 22,
                              ),
                            ),
                          ),
                        ),
                        const SizedBox(width: 12),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              "Hello, Foodie 👋",
                              style: GoogleFonts.montserrat(
                                fontSize: 15,
                                fontWeight: FontWeight.w500,
                                color: Colors.amberAccent,
                                letterSpacing: 0.6,
                              ),
                            ),
                            const SizedBox(height: 2),
                            Text(
                              "What would you like today?",
                              style: GoogleFonts.poppins(
                                fontSize: 18,
                                fontWeight: FontWeight.bold,
                                color: Colors.white,
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),

                    const SizedBox(height: 12),
                    Column(
                      children: [
                        Container(
                          height: 48,
                          decoration: BoxDecoration(
                            color: Colors.white.withOpacity(0.12),
                            borderRadius: BorderRadius.circular(16),
                            border: Border.all(color: Colors.white24, width: 1),
                          ),
                          child: Row(
                            children: [
                              const SizedBox(width: 12),
                              const Icon(Icons.search,
                                  color: Colors.white70, size: 20),
                              const SizedBox(width: 8),
                              Expanded(
                                child: TextField(
                                  controller: searchController,
                                  onChanged: updateSearch,
                                  style: GoogleFonts.montserrat(
                                    color: Colors.white,
                                    fontSize: 14,
                                    fontWeight: FontWeight.w500,
                                  ),
                                  cursorColor: Colors.white,
                                  decoration: InputDecoration(
                                    hintText:
                                    "Search meals, cuisines or drinks...",
                                    hintStyle: GoogleFonts.montserrat(
                                      color: Colors.white60,
                                      fontSize: 13,
                                      fontStyle: FontStyle.italic,
                                    ),
                                    border: InputBorder.none,
                                  ),
                                ),
                              ),
                              if (searchController.text.isNotEmpty)
                                IconButton(
                                  icon: const Icon(Icons.clear,
                                      color: Colors.white70),
                                  onPressed: () {
                                    searchController.clear();
                                    updateSearch('');
                                  },
                                ),
                            ],
                          ),
                        ),
                        if (searchResults.isNotEmpty)
                          Container(
                            margin: const EdgeInsets.only(top: 4),
                            padding: const EdgeInsets.all(6),
                            decoration: BoxDecoration(
                              color: Colors.black.withOpacity(0.25),
                              borderRadius: BorderRadius.circular(12),
                            ),
                            constraints: BoxConstraints(
                              maxHeight:
                              MediaQuery.of(context).size.height * 0.3,
                            ),
                            child: ListView.builder(
                              shrinkWrap: true,
                              itemCount: searchResults.length,
                              itemBuilder: (context, index) {
                                final item = searchResults[index];
                                return ListTile(
                                  title: Text(
                                    item["name"]!,
                                    style: GoogleFonts.poppins(
                                      color: Colors.amberAccent,
                                      fontSize: 14,
                                      fontWeight: FontWeight.w600,
                                    ),
                                  ),
                                  subtitle: Text(
                                    item["desc"]!,
                                    style: GoogleFonts.montserrat(
                                      color: Colors.white70,
                                      fontSize: 12,
                                    ),
                                  ),
                                  onTap: () {
                                    Navigator.push(
                                      context,
                                      PageRouteBuilder(
                                        transitionDuration:
                                        const Duration(milliseconds: 700),
                                        pageBuilder: (_, animation, __) =>
                                            FadeTransition(
                                              opacity: animation,
                                              child: DetailPage(item: item),
                                            ),
                                      ),
                                    );
                                    searchController.clear();
                                    updateSearch('');
                                  },
                                );
                              },
                            ),
                          ),
                      ],
                    ),
                  ],
                ),
              ),
            ),

            // Category Tabs
            SizedBox(
              height: 56,
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                padding: const EdgeInsets.symmetric(horizontal: 16),
                itemCount: categories.length,
                itemBuilder: (context, index) {
                  final isSelected = _selectedIndex == index;
                  return AnimatedContainer(
                    duration: const Duration(milliseconds: 300),
                    margin:
                    const EdgeInsets.symmetric(horizontal: 6, vertical: 8),
                    padding:
                    const EdgeInsets.symmetric(horizontal: 18, vertical: 10),
                    decoration: BoxDecoration(
                      color: isSelected
                          ? Colors.amberAccent.withOpacity(0.25)
                          : Colors.transparent,
                      borderRadius: BorderRadius.circular(14),
                      border: Border.all(
                        color: isSelected ? Colors.amberAccent : Colors.white24,
                        width: 1,
                      ),
                      boxShadow: isSelected
                          ? [
                        BoxShadow(
                          color: Colors.amberAccent.withOpacity(0.3),
                          blurRadius: 8,
                          offset: const Offset(0, 3),
                        )
                      ]
                          : [],
                    ),
                    child: GestureDetector(
                      onTap: () => setState(() => _selectedIndex = index),
                      child: Center(
                        child: Text(
                          categories[index],
                          style: GoogleFonts.poppins(
                            fontSize: 14,
                            fontWeight:
                            isSelected ? FontWeight.bold : FontWeight.w400,
                            color:
                            isSelected ? Colors.amberAccent : Colors.white70,
                          ),
                        ),
                      ),
                    ),
                  );
                },
              ),
            ),

            // Grid Items
            Expanded(
              child: currentItems.isEmpty
                  ? Center(
                child: Text(
                  "No items in this category",
                  style: GoogleFonts.poppins(
                    color: Colors.white54,
                    fontSize: 14,
                  ),
                ),
              )
                  : GridView.builder(
                padding: const EdgeInsets.all(16),
                itemCount: currentItems.length,
                gridDelegate:
                const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  crossAxisSpacing: 14,
                  mainAxisSpacing: 14,
                  childAspectRatio: 0.7,
                ),
                itemBuilder: (context, index) {
                  final item = currentItems[index];
                  final isFav = favorites[item["name"]] ?? false;

                  return TweenAnimationBuilder<double>(
                    tween: Tween(begin: 0.85, end: 1),
                    duration: Duration(milliseconds: 300 + (index * 100)),
                    curve: Curves.easeOutBack,
                    builder: (context, value, child) {
                      return Transform.scale(
                        scale: value,
                        child: Opacity(
                          opacity: value,
                          child: child,
                        ),
                      );
                    },
                    child: GestureDetector(
                      onTap: () {
                        Navigator.push(
                          context,
                          PageRouteBuilder(
                            transitionDuration:
                            const Duration(milliseconds: 700),
                            reverseTransitionDuration:
                            const Duration(milliseconds: 500),
                            pageBuilder: (_, animation, __) {
                              return FadeTransition(
                                opacity: animation,
                                child: DetailPage(item: item),
                              );
                            },
                          ),
                        );
                      },
                      child: Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(20),
                          gradient: LinearGradient(
                            colors: [
                              Colors.white.withOpacity(0.08),
                              Colors.white.withOpacity(0.03),
                            ],
                            begin: Alignment.topLeft,
                            end: Alignment.bottomRight,
                          ),
                          border: Border.all(color: Colors.white24),
                          boxShadow: [
                            BoxShadow(
                              color: Colors.black.withOpacity(0.25),
                              blurRadius: 6,
                              offset: const Offset(0, 3),
                            ),
                          ],
                        ),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Expanded(
                              child: Padding(
                                padding: const EdgeInsets.all(10),
                                child: ClipRRect(
                                  borderRadius: BorderRadius.circular(16),
                                  child: Hero(
                                    tag: item["name"]!,
                                    child: Image.network(
                                      item["img"]!,
                                      width: double.infinity,
                                      fit: BoxFit.cover,
                                    ),
                                  ),
                                ),
                              ),
                            ),
                            Padding(
                              padding:
                              const EdgeInsets.symmetric(horizontal: 8),
                              child: Text(
                                item["name"]!,
                                textAlign: TextAlign.center,
                                style: GoogleFonts.poppins(
                                  color: Colors.amberAccent,
                                  fontSize: 15,
                                  fontWeight: FontWeight.w700,
                                ),
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.symmetric(
                                  horizontal: 10, vertical: 4),
                              child: Text(
                                item["desc"]!,
                                textAlign: TextAlign.center,
                                maxLines: 2,
                                overflow: TextOverflow.ellipsis,
                                style: GoogleFonts.montserrat(
                                  color: Colors.white70,
                                  fontSize: 12,
                                ),
                              ),
                            ),
                            Align(
                              alignment: Alignment.bottomRight,
                              child: IconButton(
                                onPressed: () {
                                  setState(() {
                                    favorites[item["name"]!] = !isFav;
                                  });
                                },
                                icon: Icon(
                                  isFav
                                      ? Icons.favorite
                                      : Icons.favorite_border,
                                  color:
                                  isFav ? Colors.redAccent : Colors.white70,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  );
                },
              ),
            ),

          ],
        ),
      ),

    );
  }
}