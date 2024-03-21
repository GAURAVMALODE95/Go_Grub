import 'package:flutter/material.dart';
import 'package:go_grub/styles/textstyle.dart';

class SelectLocation extends StatefulWidget {
  const SelectLocation({Key? key});

  @override
  State<SelectLocation> createState() => _SelectLocationState();
}

class _SelectLocationState extends State<SelectLocation> {
  TextEditingController _searchController = TextEditingController();
  final List<String> _cities = [
    "Abohar",
    "Abu Road",
    "Achalpur",
    "Adilabad",
    "Adoni",
    "Bagalkot",
    "Baghpat",
    "Bagnan",
    "Bagula",
    "Bahadurgarh",
    "Chakdaha",
    "Chakradharpur",
    "Chalisgaon",
    "Challakere",
    "Chamarajanagar",
    "Dabhoi",
    "Dabra",
    "Dahanu",
    "Dahod",
    "Dalsingh Sarai",
    "Ellenabad",
    "Eluru",
    "Erattupetta",
    "Erode",
    "Etah",
    "Fatehabad",
    "Fatehgarh",
    "Fatehpur",
    "Fazilka",
    "Firozabad",
    "Gadag-Betageri",
    "Gadarwara",
    "Gadhinglaj",
    "Gadwal",
    "Ganaur",
    "Habra",
    "Haflong",
    "Haldia",
    "Haldwani",
    "Hamirpur",
    "Ichalkaranji",
    "Ilkal",
    "Imphal",
    "Indore",
    "Islampur",
    "Jabalpur",
    "Jagdalpur",
    "Jagdishpur",
    "Jagraon",
    "Jagtial",
    "Kaithal",
    "Kakinada",
    "Kalameshwar",
    "Kalimpong",
    "Kallakurichi",
    "Lakhimpur",
    "Lakhisarai",
    "Lalganj",
    "Lalitpur",
    "Latur",
    "Machilipatnam",
    "Madanapalle",
    "Madhepura",
    "Madhubani",
    "Madhupur",
    "Nabadwip",
    "Nadiad",
    "Nagaon",
    "Nagapattinam",
    "Nagaur",
    "Naharlagun",
    "Nainital",
    "Nakodar",
    "Nalbari",
    "Nalgonda",
    "Namakkal",
    "Nanded",
    "Nandura",
    "Nandurbar",
    "Nandyal",
    "Nangal",
    "Nanjangud",
    "Nanpara",
    "Naraingarh",
    "Narasaraopet",
    "Narnaul",
    "Narsapur",
    "Narsinghpur",
    "Narsipatnam",
    "Narwana",
    "Nashik",
    "Nasirabad",
    "Nathdwara",
    "Naugachhia",
    "Navsari",
    "Nawada",
    "Nawalgarh",
    "Nawanshahr",
    "Neemrana",
    "Neemuch",
    "Nelamangala",
    "Nellore",
    "Neyveli",
    "Nilanga",
    "Nipani",
    "Nirmal",
    "Nizamabad",
    "Noorpur",
    "North Lakhimpur",
    "Nuzividu",
    "Obdur",
    "Obu Road",
    "Ochalpur",
    "Odilabad",
    "Odoni",
    "Pabalkot",
    "Pabpat",
    "Pabnan",
    "Pabula",
    "Pahadurgarh",
    "Qakdaha",
    "Qakradharpur",
    "Qalisgaon",
    "Qallakere",
    "Qamarajanagar",
    "Rabhoi",
    "Rabra",
    "Rahanu",
    "Rahod",
    "Ralsingh Sarai",
    "Sellenabad",
    "Seluru",
    "Serattupetta",
    "Srode",
    "Setah",
    "Tatehabad",
    "Tatehgarh",
    "Tatehpur",
    "Tazilka",
    "Tirozabad",
    "Uadag-Betageri",
    "Uadarwara",
    "Uadhinglaj",
    "Uadwal",
    "Uanaur",
    "Vabra",
    "Vaflong",
    "Valdia",
    "Valdwani",
    "Vamirpur",
    "Wachalkaranji",
    "Wilkal",
    "Wimphal",
    "Windore",
    "Wislampur",
    "Xabalpur",
    "Xagdalpur",
    "Xagdishpur",
    "Xagraon",
    "Xagtial",
    "Yakithal",
    "Yakinada",
    "Yalameshwar",
    "Yalimpong",
    "Yallakurichi",
    "Zakhimpur",
    "Zakhisarai",
    "Zalganj",
    "Zalhepura",
    "Zalatur"
  ];
  List<String> _filteredCities = [];
  String? _preferredCity;

  @override
  void initState() {
    super.initState();
    _filteredCities = _cities;
  }

  void _filterCities(String query) {
    setState(() {
      _filteredCities = _cities
          .where((city) => city.toLowerCase().contains(query.toLowerCase()))
          .toList();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: GestureDetector(
          onTap: () {
            Navigator.pushNamed(context, 'homepage');
          },
          child: Icon(
            Icons.arrow_back,
            color: Colors.black,
          ),
        ),
        title: Text(
          "Enter your city or nearby",
          style: mystyle.defaultTextStyle,
        ),
        shadowColor: Colors.white,
        backgroundColor: Colors.white,
      ),
      body: Column(
        children: [
          SizedBox(
            height: 10,
          ),
          Padding(
            padding: const EdgeInsets.only(left: 10, right: 10),
            child: Container(
              height: 50,
              decoration: BoxDecoration(
                color: Color.fromARGB(255, 249, 249, 249),
                border: Border.all(
                  color: Color.fromARGB(255, 194, 187, 187),
                ),
                borderRadius: BorderRadius.circular(12),
              ),
              child: TextField(
                controller: _searchController,
                onChanged: (value) {
                  _filterCities(value);
                },
                decoration: InputDecoration(
                  prefixIcon: Icon(
                    Icons.search,
                    color: Colors.black,
                  ),
                  border: InputBorder.none,
                  hintText: "Try Mumbai, Nashik..",
                  hintStyle: TextStyle(
                    color: const Color.fromARGB(255, 158, 154, 154),
                    fontFamily: 'Roboto',
                    fontSize: 15,
                  ),
                ),
              ),
            ),
          ),
          Expanded(
            child: ListView.builder(
              itemCount: _filteredCities.length,
              itemBuilder: (context, index) {
                final city = _filteredCities[index];
                return ListTile(
                  title: Text(city),
                  onTap: () {
                    

                    setState(() {
                      _preferredCity = city;
                    });
                  },
                );
              },
            ),
          ),
            ElevatedButton(
              onPressed: () {
                // Use _preferredCity variable wherever you need it
                print("Preferred City: $_preferredCity");
                Navigator.pop(context,
                        _preferredCity); 
              },
              child: Text("Save"),
            ),
         ],
      ),
    );
  }
}
