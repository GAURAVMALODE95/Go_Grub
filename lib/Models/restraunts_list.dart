import 'package:flutter/material.dart';

class Product {
  final String imageUrl;
  final String title;
  final String discount;
  final String subdiscount;
  final String category;
  final String location;
  final String rating;
  final String delivery;

  Product({
    required this.imageUrl,
    required this.title,
    required this.discount,
    required this.subdiscount,
    required this.category,
    required this.location,
    required this.rating,
    required this.delivery,
  });
}


  List<Product> ProductList = [
     Product(
      imageUrl:
          "https://media-assets.swiggy.com/swiggy/image/upload/fl_lossy,f_auto,q_auto,w_208,h_208,c_fit/kpwpzmwserbnsgltku6x",
      title: "Shamsundar Misal",
      discount: "₹250 for two",
      subdiscount: "",
      category: "Maharashtrian, Fast Food",
      location: "Raviwar Peth",
      rating: "4.4/5 - 15-20 mins",
      delivery: "Free Delivery",
    ),
    Product(
      imageUrl:
          "https://media-assets.swiggy.com/swiggy/image/upload/fl_lossy,f_auto,q_auto,w_264,h_288,c_fill/vhl20yarbr5rofm31z0s",
      title: "Sagar Sweet",
      discount: "20% OFF",
      subdiscount: "upto ₹50",
      category: "Sweets, Fast Food, Desserts",
      location: "Ashoka Marg, Upnagar",
      rating: "4.5/5 - 20-25 mins",
      delivery: "Free Delivery",
    ),
    Product(
      imageUrl:
          "https://media-assets.swiggy.com/swiggy/image/upload/fl_lossy,f_auto,q_auto,w_660/hyzmji0gto0g7hag9y3z",
      title: "Baker's Den",
      discount: "50% OFF",
      subdiscount: "upto 200",
      category: "Cakes and Pastries",
      location: "College Road",
      rating: "4.3/5 - 35-40 mins",
      delivery: "Free Delivery",
    ),
    Product(
      imageUrl:
          "https://media-assets.swiggy.com/swiggy/image/upload/fl_lossy,f_auto,q_auto,w_208,h_208,c_fit/s9nr57all5im481ekdxi",
      title: "Kasturi Restaurant",
      discount: "₹125 OFF",
      subdiscount: "above ₹249",
      category: "Bengali,Thalis",
      location: "Ruby Area",
      rating: "4.4/5 - 45-50 mins",
      delivery: "Free Delivery",
    ),
   
    
    Product(
      imageUrl:
          "https://media-assets.swiggy.com/swiggy/image/upload/fl_lossy,f_auto,q_auto,w_112,h_112,c_fill/24c8a7f9e1144c3078f8fec6a98fae68",
      title: "Cafe Durga",
      discount: "₹150 for two",
      subdiscount: "",
      category: "South Indian, Beverages, Pizzas, Pastas, Street Food",
      location: "Krishi Nagar, Nas_College Road",
      rating: "4.2/5 - 30-35 mins",
      delivery: "Free Delivery",
    ),
    Product(
      imageUrl:
          "https://media-assets.swiggy.com/swiggy/image/upload/fl_lossy,f_auto,q_auto,w_208,h_208,c_fit/ulrkuqf04s5uzpzblf4k",
      title: "Madhur Sweets",
      discount: "₹200 for two",
      subdiscount: "Use F100",
      category: "Sweets, Snacks, Fast Food, Desserts",
      location: "Ashtavinayak Colony, College Road",
      rating: "4.3/5 - 25-30 mins",
      delivery: "Free Delivery",
    ),
    Product(
      imageUrl:
          "https://media-assets.swiggy.com/swiggy/image/upload/fl_lossy,f_auto,q_auto,w_208,h_208,c_fit/1187e4c231b87107dd9ad9f20d5520c5",
      title: "GetAWay-Ice Creams & Desserts",
      discount: "50% OFF",
      subdiscount: "",
      category: "Ice Cream, Desserts, Healthy Food, Sweets",
      location: "Patil Colony, DK Nagar",
      rating: "4.0/5 - 25-30 mins",
      delivery: "Free Delivery",
    ),
    Product(
      imageUrl:
          "https://media-assets.swiggy.com/swiggy/image/upload/fl_lossy,f_auto,q_auto,w_264,h_288,c_fill/03501c33ecb3a3105124441e541e6fe4",
      title: "McCafe by McDonald's",
      discount: "₹250 for two",
      subdiscount: "",
      category: "American, Beverages, Desserts",
      location: "Patil Colony, College Road",
      rating: "4.6/5 - 20-25 mins",
      delivery: "Free Delivery",
    ),
    Product(
      imageUrl:
          "https://media-assets.swiggy.com/swiggy/image/upload/fl_lossy,f_auto,q_auto,w_208,h_208,c_fit/h3xvytpo4dxkiebnrtfu",
      title: "Madras Cafe",
      discount: "₹200 for two",
      subdiscount: "",
      category: "South Indian, North Indian, Chinese, Punjabi, Snacks",
      location: "Rajwada Nagar, Railway Station",
      rating: "4.1/5 - 35-40 mins",
      delivery: "Free Delivery",
    ),
    Product(
      imageUrl:
          "https://media-assets.swiggy.com/swiggy/image/upload/fl_lossy,f_auto,q_auto,w_112,h_112,c_fill/ac6cd19ec0940e13058d1646e6837915",
      title: "McDonald's Gourmet Burger Collection",
      discount: "₹600 for two",
      subdiscount: "",
      category: "Burgers, Beverages, Cafe, Desserts",
      location: "Shivaji Nagar, Upnagar",
      rating: "4.4/5 - 25-30 mins",
      delivery: "Free Delivery",
    ),
    Product(
      imageUrl:
          "https://media-assets.swiggy.com/swiggy/image/upload/fl_lossy,f_auto,q_auto,w_208,h_208,c_fit/iirtrufbyqfyrhe6ofam",
      title: "Burger King",
      discount: "60% OFF",
      subdiscount: "upto ₹120",
      category: "Burgers, American",
      location: "Patil Colony, Ramdas Colony",
      rating: "4.3/5 - 25-30 mins",
      delivery: "Free Delivery",
    ),
    Product(
        imageUrl:
            "https://media-assets.swiggy.com/swiggy/image/upload/fl_lossy,f_auto,q_auto,w_264,h_288,c_fill/dmqnvtoyx7j66dhzdhh7",
        title: "Sadhana Chulivarchi Misal",
        discount: "₹200 for two",
        subdiscount: "no discount",
        category: "Maharashtrian, Snacks, Fast Food, Street Food",
        location: "Sadhu Waswani Road, Sharanpur Road",
        rating: "4.3/5 - 15-20 mins",
        delivery: "Free Delivery"),
    Product(
      imageUrl:
          "https://media-assets.swiggy.com/swiggy/image/upload/fl_lossy,f_auto,q_auto,w_264,h_288,c_fill/6e04be27387483a7c00444f8e8241108",
      title: "The Good Bowl",
      discount: "₹400 for two",
      subdiscount: "",
      category: "Biryani, North Indian, Pastas, Punjabi, Desserts, Beverages",
      location: "Rajwada Nagar, Deolali",
      rating: "4.4/5 - 35-40 mins",
      delivery: "Free Delivery",
    ),
  ];

  
