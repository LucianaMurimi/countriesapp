import 'package:explore/app/country.dart';
import 'package:flutter/material.dart';
import 'package:explore/data/api_service.dart';
import 'package:grouped_list/grouped_list.dart';
import 'package:explore/data/country_model.dart';


class App extends StatefulWidget {
  const App({Key? key}) : super(key: key);

  @override
  State<App> createState() => _AppState();
}

class _AppState extends State<App> {
  List countries = [];
  List languages = [];
  List continents = [];
  List timezones = [];

  bool displaySearchResults = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.only(left: 24.0, right: 24, top: 48),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: const [
                Text("Explore"),
                Icon(Icons.light_mode_outlined),
              ],
            ),
            const SizedBox(height: 16,),
            TextFormField(
              decoration: const InputDecoration(
                prefixIcon: Icon(Icons.search_outlined),
                labelText: "Search Country"
              ),
            ),
            const SizedBox(height: 16,),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                TextButton.icon(
                    onPressed: (){
                      buildLanguageModalBottomSheet(
                        context: context,
                        elements: languages,
                      );
                    },
                    icon: const Icon(Icons.language_rounded),
                    label: const Text("EN")),
                TextButton.icon(
                    onPressed: (){
                      buildFilterModalBottomSheet(
                        context: context,
                        elements1: continents,
                        elements2: timezones,
                      );
                    },
                    icon: const Icon(Icons.filter_alt_outlined),
                    label: const Text("Filter"))
              ],
            ),
            // List View Builder
            FutureBuilder(
              future: ApiService().getCountries(),
              builder: (BuildContext context, AsyncSnapshot snapshot){
                if(snapshot.connectionState == ConnectionState.done){
                  if(snapshot.hasData){
                    countries = snapshot.data;

                    return Expanded(
                      child: GroupedListView(
                        elements: snapshot.data,
                        groupBy: (Country country) => country.name?.common?[0] ?? "",
                        groupComparator: (String value1,
                            String value2) => value2.compareTo(value1),
                        itemComparator: (Country country1, Country country2){
                          String _country1 = country1.name?.common ?? "";
                          String _country2 = country2.name?.common ?? "";

                          return _country2.compareTo(_country1);
                        },
                        order: GroupedListOrder.DESC,
                        useStickyGroupSeparators: true,
                        groupSeparatorBuilder: (String value) => Padding(
                          padding: const EdgeInsets.only(top: 8.0, left: 8.0, bottom: 0),
                          child: Text(
                            value,
                            textAlign: TextAlign.left,
                            style: const TextStyle(fontSize: 18,
                                fontWeight: FontWeight.bold),
                          ),
                        ),
                        itemBuilder: (BuildContext context, Country country){
                          country.languages?.forEach((key, value){
                            if(!languages.contains(value)){
                              languages.add(value);
                            }
                          });

                          List _continents = country.continents ?? [];
                          for(String continent in _continents){
                            if(!continents.contains(continent)){
                              continents.add(continent);
                            }
                          }

                          List _timezones = country.timezones ?? [];
                          for(String timezone in _timezones){
                            if(!timezones.contains(timezone)){
                              timezones.add(timezone);
                            }
                          }

                          return ListTile(
                            leading: ClipRRect(
                              borderRadius: BorderRadius.circular(8.0),
                              child: SizedBox.fromSize(
                                size: const Size.fromRadius(20), // Image radius
                                child: Image.network(country.flags?["png"]
                                    ?? "https://via.placeholder.com/150/000000/FFFFFF/?text=NotFound",
                                    width: 40, height: 40,
                                    fit: BoxFit.cover
                                  ),
                              ),
                            ),
                            title: Text(country.name?.common ?? ""),
                            subtitle: Text(country.capital == null ? "" : country.capital?[0]),
                            onTap: (){
                              Navigator.push(
                                context,
                                MaterialPageRoute(builder: (context) => CountryWidget(country: country)),
                              );
                            },
                          );
                        },
                      ),
                    );
                  }else{
                    return const Text("No data returned");
                  }
                }else{
                  return const CircularProgressIndicator();
                }
              },
            )
          ],
        ),
      )
    );
  }
}


buildLanguageModalBottomSheet({context, elements}){
  showModalBottomSheet(
    shape: const RoundedRectangleBorder(
      borderRadius: BorderRadius.only(
        topLeft: Radius.circular(16),
        topRight: Radius.circular(16),
      ),
    ),
    context: context,
    builder:(context){
      elements.sort();
      return ListView.builder(
        itemCount: elements.length,
        itemBuilder: (BuildContext context, int index){
          return ListTile(
            leading: Text(elements[index]),
            trailing: elements[index] =="English" ?
              const Icon(Icons.circle, size: 13.6,) : const Icon(Icons.circle_outlined, size: 13.6),
            onTap: (){
              Navigator.pop(context);
              ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
                content: Text("Localization under implementation"),
              ));
            },
          );
        },
      );
    }
  );
}

buildFilterModalBottomSheet({context, elements1, elements2}){
  showModalBottomSheet(
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(16),
          topRight: Radius.circular(16),
        ),
      ),
      isScrollControlled: true,
      context: context,
      builder:(context){
        elements1.sort();
        elements2.sort();

        return SingleChildScrollView(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              ExpansionTile(
                title: const Text("Continents"),
                children: [
                  SizedBox(
                    child: Expanded(
                      child: ListView.builder(
                        shrinkWrap: true,
                        itemCount: elements1.length,
                        itemBuilder: (BuildContext context, int index){
                          return ListTile(
                            leading: Text(elements1[index]),
                            trailing: const Icon(Icons.crop_square_rounded, size: 20),
                            onTap: (){
                            },
                          );
                        },
                      ),
                    ),
                  ),
                ],
              ),
              ExpansionTile(
                title: const Text("Time Zone"),
                children: [
                  ListView.builder(
                    shrinkWrap: true,
                    itemCount: elements2.length,
                    itemBuilder: (BuildContext context, int index){
                      return ListTile(
                        leading: Text(elements2[index]),
                        trailing: const Icon(Icons.crop_square_rounded, size: 20),
                        onTap: (){
                        },
                      );
                    },
                  ),
                ],
              ),
            ],
          ),
        );
      }
  );
}