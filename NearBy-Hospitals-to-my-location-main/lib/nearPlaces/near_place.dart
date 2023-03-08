import 'dart:convert';
import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class NearByPlaces extends StatefulWidget {
  String lati ;
  String longi ;
   NearByPlaces({Key? key, required this.lati, required this.longi}) : super(key: key);

  @override
  State<NearByPlaces> createState() => _NearByPlacesState();
}




class _NearByPlacesState extends State<NearByPlaces> {

  Map<String, dynamic> jsonResponse = {
    "html_attributions" : [],
    "results" : [
      {
        "business_status" : "OPERATIONAL",
        "geometry" : {
          "location" : {
            "lat" : -33.8675219,
            "lng" : 151.2016502
          },
          "viewport" : {
            "northeast" : {
              "lat" : -33.86614532010728,
              "lng" : 151.2031259298927
            },
            "southwest" : {
              "lat" : -33.86884497989272,
              "lng" : 151.2004262701072
            }
          }
        },
        "icon" : "https://maps.gstatic.com/mapfiles/place_api/icons/v1/png_71/generic_business-71.png",
        "icon_background_color" : "#7B9EB0",
        "icon_mask_base_uri" : "https://maps.gstatic.com/mapfiles/place_api/icons/v2/generic_pinlet",
        "name" : "Sydney Harbour Dinner Cruises",
        "opening_hours" : {
          "open_now" : true
        },
        "photos" : [
          {
            "height" : 375,
            "html_attributions" : [
              "\u003ca href=\"https://maps.google.com/maps/contrib/109764923610545394994\"\u003eA Google User\u003c/a\u003e"
            ],
            "photo_reference" : "AfLeUgNn6HK2pDkMtfEPoeZP5trmHuJ8G82nzyYN5hc9K_yj-3uJdpOMTfhsmAVSGe8VO0rs-GWNRfigg9rZhM-tu6BHegMrEXNrSeDuP7GL8MONFYkcEpBfmFht3ikaw__fFH6x7ApLcgAbERZK4pKPnD7YNv7fSoSRLcVUUSsn3ia0rVOd",
            "width" : 500
          }
        ],
        "place_id" : "ChIJM1mOVTS6EmsRKaDzrTsgids",
        "plus_code" : {
          "compound_code" : "46J2+XM Sydney, New South Wales",
          "global_code" : "4RRH46J2+XM"
        },
        "rating" : 4.4,
        "reference" : "ChIJM1mOVTS6EmsRKaDzrTsgids",
        "scope" : "GOOGLE",
        "types" : [
          "tourist_attraction",
          "travel_agency",
          "restaurant",
          "point_of_interest",
          "food",
          "establishment"
        ],
        "user_ratings_total" : 25,
        "vicinity" : "32 The Promenade, Sydney"
      },
      {
        "business_status" : "OPERATIONAL",
        "geometry" : {
          "location" : {
            "lat" : -33.8677035,
            "lng" : 151.2017297
          },
          "viewport" : {
            "northeast" : {
              "lat" : -33.86634597010728,
              "lng" : 151.2031781298927
            },
            "southwest" : {
              "lat" : -33.86904562989272,
              "lng" : 151.2004784701072
            }
          }
        },
        "icon" : "https://maps.gstatic.com/mapfiles/place_api/icons/v1/png_71/generic_business-71.png",
        "icon_background_color" : "#7B9EB0",
        "icon_mask_base_uri" : "https://maps.gstatic.com/mapfiles/place_api/icons/v2/generic_pinlet",
        "name" : "Sydney Harbour Lunch Cruise",
        "opening_hours" : {
          "open_now" : false
        },
        "photos" : [
          {
            "height" : 1152,
            "html_attributions" : [
              "\u003ca href=\"https://maps.google.com/maps/contrib/109783897724781877380\"\u003eOKSANA MEZHOV\u003c/a\u003e"
            ],
            "photo_reference" : "AfLeUgPW956tCT2ZDplADtq44TwW16IhRMzWp1wWo146tUo8tAWNqybjA-Z75Kicyc-M6C-Kw1cds1n48ufSjfI1cw96yzVrTXfrdhR4V0Pv0781lNi9r8xpKxCrR2NWf6MpL-PtyrcA4C4mcaW4CO4P_B5uB6pCEdXb5kiyXj5hhl5JYUZ2",
            "width" : 2048
          }
        ],
        "place_id" : "ChIJUbf3iDiuEmsROJxXbhYO7cM",
        "plus_code" : {
          "compound_code" : "46J2+WM Sydney, New South Wales",
          "global_code" : "4RRH46J2+WM"
        },
        "rating" : 4.1,
        "reference" : "ChIJUbf3iDiuEmsROJxXbhYO7cM",
        "scope" : "GOOGLE",
        "types" : [
          "travel_agency",
          "restaurant",
          "point_of_interest",
          "food",
          "establishment"
        ],
        "user_ratings_total" : 25,
        "vicinity" : "King Street Wharf 5, 32 The Promenade, Sydney"
      },
      {
        "business_status" : "OPERATIONAL",
        "geometry" : {
          "location" : {
            "lat" : -33.8587323,
            "lng" : 151.2100055
          },
          "viewport" : {
            "northeast" : {
              "lat" : -33.85739847010727,
              "lng" : 151.2112436298927
            },
            "southwest" : {
              "lat" : -33.86009812989271,
              "lng" : 151.2085439701072
            }
          }
        },
        "icon" : "https://maps.gstatic.com/mapfiles/place_api/icons/v1/png_71/bar-71.png",
        "icon_background_color" : "#FF9E67",
        "icon_mask_base_uri" : "https://maps.gstatic.com/mapfiles/place_api/icons/v2/bar_pinlet",
        "name" : "Cruise Bar",
        "opening_hours" : {
          "open_now" : true
        },
        "photos" : [
          {
            "height" : 575,
            "html_attributions" : [
              "\u003ca href=\"https://maps.google.com/maps/contrib/112582655193348962755\"\u003eA Google User\u003c/a\u003e"
            ],
            "photo_reference" : "AfLeUgPUD6YuEsX67hjqi3VdVu13JHCaO-JG0-ITLou6UU40ZAcah1Pju6u1pLIEvH3eZVHmpZF58nRjOGPYuiUlgjbCumXu9Dfd37qI5qxaDGdOJc9QoofOQV4PBW20ey0P3OcZirPIz26yqqg_AsX7QhD2xEa8p-84PIG5O_txJgHRkQ0P",
            "width" : 766
          }
        ],
        "place_id" : "ChIJi6C1MxquEmsR9-c-3O48ykI",
        "plus_code" : {
          "compound_code" : "46R6+G2 The Rocks, New South Wales",
          "global_code" : "4RRH46R6+G2"
        },
        "price_level" : 2,
        "rating" : 4,
        "reference" : "ChIJi6C1MxquEmsR9-c-3O48ykI",
        "scope" : "GOOGLE",
        "types" : [ "bar", "restaurant", "point_of_interest", "food", "establishment" ],
        "user_ratings_total" : 1429,
        "vicinity" : "Level 1, 2 and 3, Overseas Passenger Terminal, Circular Quay W, The Rocks"
      },
      {
        "business_status" : "OPERATIONAL",
        "geometry" : {
          "location" : {
            "lat" : -33.8676569,
            "lng" : 151.2017213
          },
          "viewport" : {
            "northeast" : {
              "lat" : -33.86629922010728,
              "lng" : 151.2031712798927
            },
            "southwest" : {
              "lat" : -33.86899887989272,
              "lng" : 151.2004716201073
            }
          }
        },
        "icon" : "https://maps.gstatic.com/mapfiles/place_api/icons/v1/png_71/generic_business-71.png",
        "icon_background_color" : "#7B9EB0",
        "icon_mask_base_uri" : "https://maps.gstatic.com/mapfiles/place_api/icons/v2/generic_pinlet",
        "name" : "Clearview Sydney Harbour Cruises",
        "opening_hours" : {
          "open_now" : false
        },
        "photos" : [
          {
            "height" : 372,
            "html_attributions" : [
              "\u003ca href=\"https://maps.google.com/maps/contrib/114394575270272775071\"\u003eClearview Glass Boat Cruises\u003c/a\u003e"
            ],
            "photo_reference" : "AfLeUgMDXIA71JTj5Rcdcz7ExJji3iAUVBS0iZHKCJyXCZa5XUpbT2QBOPpAXGdoG1QDeLhnGUEbL-46y71Y-j8sVtkCKoxMHVSqAoLWadIQmy-_MbeuD2bLuWsIyeD_B-wclK-64tcNdzXJkl0l0we_7XmJvApUXCL5S1oyNIe-30xzU9Q4",
            "width" : 640
          }
        ],
        "place_id" : "ChIJNQfwZTiuEmsR1m1x9w0E2V0",
        "plus_code" : {
          "compound_code" : "46J2+WM Sydney, New South Wales",
          "global_code" : "4RRH46J2+WM"
        },
        "rating" : 3.9,
        "reference" : "ChIJNQfwZTiuEmsR1m1x9w0E2V0",
        "scope" : "GOOGLE",
        "types" : [
          "travel_agency",
          "restaurant",
          "point_of_interest",
          "food",
          "establishment"
        ],
        "user_ratings_total" : 64,
        "vicinity" : "32 The Promenade King Street Wharf 5, Sydney"
      },
      {
        "business_status" : "OPERATIONAL",
        "geometry" : {
          "location" : {
            "lat" : -33.8677035,
            "lng" : 151.2017297
          },
          "viewport" : {
            "northeast" : {
              "lat" : -33.86634597010728,
              "lng" : 151.2031781298927
            },
            "southwest" : {
              "lat" : -33.86904562989272,
              "lng" : 151.2004784701072
            }
          }
        },
        "icon" : "https://maps.gstatic.com/mapfiles/place_api/icons/v1/png_71/generic_business-71.png",
        "icon_background_color" : "#7B9EB0",
        "icon_mask_base_uri" : "https://maps.gstatic.com/mapfiles/place_api/icons/v2/generic_pinlet",
        "name" : "Magistic Cruises",
        "opening_hours" : {
          "open_now" : true
        },
        "photos" : [
          {
            "height" : 3456,
            "html_attributions" : [
              "\u003ca href=\"https://maps.google.com/maps/contrib/111624752247196095718\"\u003eNieves Casais\u003c/a\u003e"
            ],
            "photo_reference" : "AfLeUgPGRefgJNpk-MCxph4YQCjJSCLaHUQ7rHb2z_MxmRgfB2em8qq-GP3nokZrjsgJXebrE9Yf8gLC1Iv82Lgsw7CABYmn7aa9Koi6rvG1dF9jvDITmDzGbxMTncmPmPIZkhBMg9LUbRWQyv8ir8O5d9kpaJThKML6eANh382aRBN9NGhL",
            "width" : 4608
          }
        ],
        "place_id" : "ChIJxRjqYTiuEmsRGebAA_chDLE",
        "plus_code" : {
          "compound_code" : "46J2+WM Sydney, New South Wales",
          "global_code" : "4RRH46J2+WM"
        },
        "rating" : 4,
        "reference" : "ChIJxRjqYTiuEmsRGebAA_chDLE",
        "scope" : "GOOGLE",
        "types" : [
          "tourist_attraction",
          "travel_agency",
          "restaurant",
          "point_of_interest",
          "food",
          "establishment"
        ],
        "user_ratings_total" : 111,
        "vicinity" : "King Street Wharf, 32 The Promenade, Sydney"
      },
      {
        "business_status" : "OPERATIONAL",
        "geometry" : {
          "location" : {
            "lat" : -33.8675883,
            "lng" : 151.2016452
          },
          "viewport" : {
            "northeast" : {
              "lat" : -33.86623847010728,
              "lng" : 151.2029950298927
            },
            "southwest" : {
              "lat" : -33.86893812989273,
              "lng" : 151.2002953701073
            }
          }
        },
        "icon" : "https://maps.gstatic.com/mapfiles/place_api/icons/v1/png_71/generic_business-71.png",
        "icon_background_color" : "#7B9EB0",
        "icon_mask_base_uri" : "https://maps.gstatic.com/mapfiles/place_api/icons/v2/generic_pinlet",
        "name" : "Sydney Showboats",
        "opening_hours" : {
          "open_now" : true
        },
        "photos" : [
          {
            "height" : 4912,
            "html_attributions" : [
              "\u003ca href=\"https://maps.google.com/maps/contrib/105311284660389698992\"\u003eA Google User\u003c/a\u003e"
            ],
            "photo_reference" : "AfLeUgOEmfCLMIc4bRtjPz32C-_clnhybnNpfkD4roQp3Omu8h7ty0ZitmJGwix8jpsgA8ne1L09ZwMXF7nKWUU0GMMm45m1EXlB77jPh12jTW1BoZamfoQFgb_fQbB3doxC7VqH5kr45fFNqhJy5AyDyLIZ4DV3FVQzhnT0GLHPsT3Zf43e",
            "width" : 7360
          }
        ],
        "place_id" : "ChIJjRuIiTiuEmsRCHhYnrWiSok",
        "plus_code" : {
          "compound_code" : "46J2+XM Sydney, New South Wales",
          "global_code" : "4RRH46J2+XM"
        },
        "rating" : 4.2,
        "reference" : "ChIJjRuIiTiuEmsRCHhYnrWiSok",
        "scope" : "GOOGLE",
        "types" : [
          "travel_agency",
          "restaurant",
          "point_of_interest",
          "food",
          "establishment"
        ],
        "user_ratings_total" : 148,
        "vicinity" : "32 The Promenade, King Street Wharf, 5, Sydney"
      },
      {
        "business_status" : "OPERATIONAL",
        "geometry" : {
          "location" : {
            "lat" : -33.8609391,
            "lng" : 151.2098735
          },
          "viewport" : {
            "northeast" : {
              "lat" : -33.85958927010727,
              "lng" : 151.2112233298927
            },
            "southwest" : {
              "lat" : -33.86228892989272,
              "lng" : 151.2085236701072
            }
          }
        },
        "icon" : "https://maps.gstatic.com/mapfiles/place_api/icons/v1/png_71/generic_business-71.png",
        "icon_background_color" : "#7B9EB0",
        "icon_mask_base_uri" : "https://maps.gstatic.com/mapfiles/place_api/icons/v2/generic_pinlet",
        "name" : "Australian Cruise Group",
        "opening_hours" : {
          "open_now" : true
        },
        "photos" : [
          {
            "height" : 1536,
            "html_attributions" : [
              "\u003ca href=\"https://maps.google.com/maps/contrib/113088009011192061895\"\u003eKeith Bauman\u003c/a\u003e"
            ],
            "photo_reference" : "AfLeUgOls2kTvg73w2SshvtnGmZb2ccpwLe6wj6ENvBQSWanLNWOJ2-DfjxiTBUv3GEjeBR1bqGpR67nvTJN0YWnC1JlQWDRCoe6b7rOmz1iVBsm5tMwf4GPYZal0Yzl3qhiaEV3D5UclCgdwqgTHms0L7tvSaYd55YSvl-bGHex9kVvrNq9",
            "width" : 2048
          }
        ],
        "place_id" : "ChIJpU8KgUKuEmsRKErVGEaa11w",
        "plus_code" : {
          "compound_code" : "46Q5+JW Sydney, New South Wales",
          "global_code" : "4RRH46Q5+JW"
        },
        "rating" : 4.4,
        "reference" : "ChIJpU8KgUKuEmsRKErVGEaa11w",
        "scope" : "GOOGLE",
        "types" : [
          "travel_agency",
          "restaurant",
          "point_of_interest",
          "food",
          "establishment"
        ],
        "user_ratings_total" : 5,
        "vicinity" : "6 Cirular Quay, Sydney"
      },

    ],
    "status" : "OK"
  };
  @override
  void initState() {
    fetchAlbum();

    // TODO: implement initState
  }


  Future fetchAlbum() async {
    try {

      print('okkkkk');
      final client = http.Client();



      print("tokennmnnnnnn");


      print("okkkkkkk 1");
      final Uri uri = Uri.parse("https://maps.googleapis.com/maps/api/place/nearbysearch/json?location=${widget.lati}%2C${widget.longi}&radius=1500&type=hospital&keyword=eye&key=API_KEY");
      // final headers = {
      //   'Content-type': 'application/json',
      //   "Cookie": token.toString(),
      //   // 'Accept': 'application/json',
      //   // "Access-Control-Allow-Origin": "*",
      // };
      final http.Response response = await client.get(
        uri,
        // headers: headers,
      );
      log("response:${response.body}");
      // log("response:${response.headers}");
      // log("response:${response.body}");


      // print(jsonResponse);
      print("okkkkkkk 2");

      setState(() {
        jsonResponse = jsonDecode(response.body);
      });

      if (response.statusCode == 200) {
        // If the server did return a 200 OK response,
        // then parse the JSON.
        // print("okkkkkkk 44");
        // statesList = jsonDecode(response.body)['states'].keys.toList();
        // print(response.body);

      } else {
        // If the server did not return a 200 OK response,
        // then throw an exception.
        throw Exception('Failed to load album');
      }
    } catch (e) {
      print(e);
    }
  }





  @override
  Widget build(BuildContext context) {
    return SafeArea(child: Scaffold(
      appBar: AppBar(
        title: Text("Nearby Eye Hospitals"),
      ),
      body:  ListView.builder(
          padding: const EdgeInsets.all(8),
          itemCount: jsonResponse["results"].length,
          itemBuilder: (BuildContext context, int index) {
            return Column(
              crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Card(
                    color: index%2==0? Colors.orange.withOpacity(0.1): Colors.purpleAccent.withOpacity(0.1),
                    child: Column(
                      children: [
                        Row(
                          children: [

                            Text(jsonResponse["results"][index]["name"], style: TextStyle(fontSize: 16,fontWeight: FontWeight.bold),),
                          ],
                        ),
                        SizedBox(width: 50,height: 10,),
                        Row(
                          children: [
                            Text("Rating: ${jsonResponse["results"][index]["rating"].toString()}", style: TextStyle(fontSize: 14,fontWeight: FontWeight.bold),),
                            SizedBox(width: 50,),
                            jsonResponse["results"][index]["opening_hours"]["open_now"]? Text("Open Now", style: TextStyle(fontSize: 14,fontWeight: FontWeight.bold, color: Colors.green),):
                            Text("Close", style: TextStyle(fontSize: 14,fontWeight: FontWeight.bold, color: Colors.red),),
                          ],
                        ),
                        Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text("Address: ", style: TextStyle(fontSize: 14,fontWeight: FontWeight.bold),),
                            Container(
                                width: MediaQuery.of(context).size.width*0.7,
            child: Text("${jsonResponse["results"][index]["vicinity"].toString()}", style: TextStyle(fontSize: 14,fontWeight: FontWeight.bold,color: Colors.deepPurpleAccent),)),
                          ],
                        ),
                      ],
                    ),
                  )
                ],

            );
          }
      ),
    ));
  }
}
