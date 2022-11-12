import 'package:flutter/material.dart';
import 'package:explore/data/country_model.dart';


class CountryWidget extends StatefulWidget {
  final Country country;
  const CountryWidget({Key? key, required this.country}) : super(key: key);

  @override
  State<CountryWidget> createState() => _CountryWidgetState();
}

class _CountryWidgetState extends State<CountryWidget> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
          appBar: AppBar(
            title: Text(widget.country.name?.common ?? ""),
          ),
          body: Padding(
            padding: const EdgeInsets.only(left: 24.0, right: 24.0),
            child: Column(
              children: [
                SizedBox(
                  width: 380,
                  height: 200,
                  child: Stack(
                    children: [
                      ClipRRect(
                        borderRadius: BorderRadius.circular(8.0),
                        child: SizedBox.fromSize(
                          size: const Size.fromRadius(180), // Image radius
                          child: Image.network(widget.country.flags?["png"]
                              ?? "https://via.placeholder.com/150/000000/FFFFFF/?text=NotFound",
                              width: 40, height: 40,
                              fit: BoxFit.cover
                          ),
                        ),
                      ),
                      Positioned(
                        top: 76,
                        left: 0,
                        child: IconButton(
                          onPressed: (){},
                          icon: const CircleAvatar(
                            backgroundColor: Color(0x80f2f2f2),
                            radius: 10,
                            child: Icon(Icons.keyboard_arrow_left, size: 20,),
                          )
                        )
                      ),
                      Positioned(
                          top: 76,
                          right: 0,
                          child: IconButton(
                              onPressed: (){},
                              icon: const CircleAvatar(
                                backgroundColor: Color(0x80f2f2f2),
                                radius: 10,
                                child: Icon(Icons.keyboard_arrow_right, size: 20,),
                              )
                          )
                      ),
                      Positioned(
                          top: 184,
                          right: 146,
                          child: Row(
                            children: [
                              Container(
                                height: 8,
                                width: 8,
                                decoration: const BoxDecoration(
                                    color: Color(0x80f2f2f2),
                                    borderRadius: BorderRadius.all(Radius.circular(4)),
                                ),
                              ),
                              const SizedBox(width: 4,),
                              Container(
                                height: 8,
                                width: 8,
                                decoration: const BoxDecoration(
                                  color: Color(0x80f2f2f2),
                                  borderRadius: BorderRadius.all(Radius.circular(4)),
                                ),
                              )
                            ],
                          )
                      ),
                    ],
                  ),
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    CustomRichText(
                      label: "Official name:",
                      value: widget.country.name?.official ?? "",
                    ),
                    CustomRichText(
                      label: "cca2:",
                      value: widget.country.cca2 ?? "",
                    ),
                    CustomRichText(
                      label: "Independent:",
                      value: widget.country.independent.toString(),
                    ),
                    CustomRichText(
                      label: "Status:",
                      value: widget.country.status ?? "",
                    ),
                    CustomRichText(
                      label: "UN member:",
                      value: widget.country.unMember.toString(),
                    ),
                    CustomRichText(
                      label: "Region:",
                      value: widget.country.region ?? "",
                    ),
                    CustomRichText(
                      label: "Sub region:",
                      value: widget.country.subregion ?? "",
                    ),
                    CustomRichText(
                      label: "Area:",
                      value: widget.country.area.toString(),
                    ),
                    CustomRichText(
                      label: "Population:",
                      value: widget.country.population.toString(),
                    ),
                    CustomRichText(
                      label: "Start of week:",
                      value: widget.country.startOfWeek ?? "",
                    ),
                  ],
                ),
              ],
            ),
          ),
        ));
  }
}

class CustomRichText extends StatelessWidget {
  final String label;
  final String value;
  const CustomRichText({Key? key, required this.label, required this.value}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return RichText(
        text: TextSpan(
        text: label, style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold, color: Colors.black),
        children: [
            TextSpan(
            text: " $value", style: const TextStyle(fontSize: 16, fontWeight: FontWeight.normal, color: Colors.black)
            ),]
        )
    );
  }
}
