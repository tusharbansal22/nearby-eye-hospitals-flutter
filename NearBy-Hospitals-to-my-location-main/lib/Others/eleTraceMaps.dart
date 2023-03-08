import 'dart:async';
import 'dart:convert';
import 'dart:developer';
import 'dart:io';
import 'package:device_imei/device_imei.dart';
import 'package:device_information/device_information.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:geolocator/geolocator.dart';
import 'package:mobile_number_example/Others/getLocationData.dart';
import 'package:http/http.dart' as http;
import 'package:mobile_number_example/nearPlaces/near_place.dart';





class TraceGeoLocation extends StatefulWidget {




















   TraceGeoLocation({Key? key}) : super(key: key);

  @override
  State<TraceGeoLocation> createState() => _TraceGeoLocationState();
}

class _TraceGeoLocationState extends State<TraceGeoLocation> {


  final client = http.Client();

  final headers = {
    // 'Content-type': 'application/json',
    'accept': 'application/json',
    // "Access-Control-Allow-Origin": "*",
  };

bool tra = true;

dynamic number ="9929736963";


  Future login() async {
    print('jjjjjyggyugbhj');

    print(number);

    final Uri uri = Uri.parse(
        "http://10.1.158.210:8100/order/sendlocationinfo");
    print("uriiiiiiiiiiiiiiiiiiiiiiiiiiiiii=>>>>>>>>>");
    print(uri);
    var obj = {
      "mobile": "9929736963",
      "latitude": _currentPosition!.latitude,
      "longitude": _currentPosition!.longitude
    };
    try {
      print('okkk1');
      final http.Response response = await client.post(uri,
          headers: {HttpHeaders.contentTypeHeader: "application/json"},
          body: jsonEncode(obj));
      print('jjjjj');
      print(response.body);
      log("response:${response.body}");
      log("response:${response.headers}");
      Map<String, dynamic> jsonResponse = jsonDecode(response.body);
      print(jsonResponse);
      if (response.statusCode == 200) {
        return jsonResponse;
      } else if (response.statusCode == 404) {
        if (jsonResponse.isEmpty) return jsonResponse;
        throw Exception();
      }
    } on Exception {
      rethrow;
    }
  }


  List<GetLocationData> dau = [];

  String? _currentAddress;
  Position? _currentPosition = Position(longitude: 0.00,
      latitude: 0.00,
      timestamp: DateTime.now(),
      accuracy: 0.0,
      altitude: 0.0,
      heading: 0.0,
      speed: 0.0,
      speedAccuracy: 0.0);

  Future<bool> _handleLocationPermission() async {
    bool serviceEnabled;
    LocationPermission permission;

    serviceEnabled = await Geolocator.isLocationServiceEnabled();
    if (!serviceEnabled) {
      ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
          content: Text(
              'Location services are disabled. Please enable the services')));
      return false;
    }
    permission = await Geolocator.checkPermission();
    if (permission == LocationPermission.denied) {
      permission = await Geolocator.requestPermission();
      if (permission == LocationPermission.denied) {
        ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(content: Text('Location permissions are denied')));
        return false;
      }
    }
    if (permission == LocationPermission.deniedForever) {
      ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
          content: Text(
              'Location permissions are permanently denied, we cannot request permissions.')));
      return false;
    }
    return true;
  }

  String? _deviceImei = 'Unknown';


  Future<void> getImei() async {
    String? imei;
    try {
      imei = await DeviceImei.getImei();
    } catch (e) {
      print(e);
    }

    if (!mounted) return;
    setState(() {
      print('ollllllllllllllll>>>>>>>>>');
      print(imei);
      _deviceImei = imei;
    });
  }








  Future getLocationUpdates() async {
    print('jhjjjjj');
    const LocationSettings locationSettings =
    LocationSettings(accuracy: LocationAccuracy.high, distanceFilter: 2000,);

    StreamSubscription<Position> positionStream = Geolocator.getPositionStream(
        locationSettings: locationSettings).listen((event) {
      setState(() {
        _currentPosition = event;
        print("latitude : ${_currentPosition!
            .latitude}====>longitude : ${_currentPosition!
            .longitude} =====> ${_currentPosition!.timestamp}");
        print(_currentPosition!.heading);
      });
    });
  }


  String _platformVersion = 'Unknown',
      _imeiNo = "",
      _modelName = "",
      _manufacturerName = "",
      _deviceName = "",
      _productName = "",
      _cpuType = "",
      _hardware = "";
  var _apiLevel;


  // Platform messages are asynchronous, so we initialize in an async method.
  Future<void> initPlatformState() async {
    final hasPermissio = await _handleLocationPermission();
    if (!hasPermissio) return;
    late String platformVersion,
        imeiNo = '',
        modelName = '',
        manufacturer = '',
        deviceName = '',
        productName = '',
        cpuType = '',
        hardware = '';
    var apiLevel;
    // Platform messages may fail,
    // so we use a try/catch PlatformException.
    try {
      platformVersion = await DeviceInformation.platformVersion;
      imeiNo = await DeviceInformation.deviceIMEINumber;
      modelName = await DeviceInformation.deviceModel;
      manufacturer = await DeviceInformation.deviceManufacturer;
      apiLevel = await DeviceInformation.apiLevel;
      deviceName = await DeviceInformation.deviceName;
      productName = await DeviceInformation.productName;
      cpuType = await DeviceInformation.cpuName;
      hardware = await DeviceInformation.hardware;
    } on PlatformException catch (e) {
      platformVersion = '${e.message}';
    }

    // If the widget was removed from the tree while the asynchronous platform
    // message was in flight, we want to discard the reply rather than calling
    // setState to update our non-existent appearance.
    if (!mounted) return;

    setState(() {
      _platformVersion = "Running on :$platformVersion";
      _imeiNo = imeiNo;
      _modelName = modelName;
      _manufacturerName = manufacturer;
      _apiLevel = apiLevel;
      _deviceName = deviceName;
      _productName = productName;
      _cpuType = cpuType;
      _hardware = hardware;
    });
    print('okkkkkkkkkkk');
    print(imeiNo);
  }








    Future<void> _getCurrentPosition() async {
    getLocationUpdates();
    final hasPermission = await _handleLocationPermission();
    if (!hasPermission) return;
    await Geolocator.getCurrentPosition(
        desiredAccuracy: LocationAccuracy.high)
        .then((Position position) {
      setState(() => _currentPosition = position);
    }).catchError((e) {
      debugPrint(e.toString());
    });
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    _getCurrentPosition();
    getLocationUpdates();
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _getCurrentPosition();
    // getLocationdata();

  }


  bool ripple=false ;



  void loopp ()  {
    while(tra){


      Future.delayed(const Duration(seconds: 10), () async{
        final Uri uri = Uri.parse(
            "http://10.1.158.210:8100/order/sendlocationinfo");
        print("uriiiiiiiiiiiiiiiiiiiiiiiiiiiiii=>>>>>>>>>");
        print(uri);
        var obj = {
          "mobile": "9929736963",
          "latitude": _currentPosition!.latitude,
          "longitude": _currentPosition!.longitude
        };
        try {
          print('okkk1');
          final http.Response response = await client.post(uri,
              headers: {HttpHeaders.contentTypeHeader: "application/json"},
              body: jsonEncode(obj));
          print('jjjjj');
          print(response.body);
          log("response:${response.body}");
          log("response:${response.headers}");
          Map<String, dynamic> jsonResponse = jsonDecode(response.body);
          print(jsonResponse);
          if (response.statusCode == 200) {
            return jsonResponse;
          } else if (response.statusCode == 404) {
            if (jsonResponse.isEmpty) return jsonResponse;
            throw Exception();
          }
        } on Exception {
          rethrow;
        }


      });

    }

  }
  bool success = false;
  bool done = false;



  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Location",),

        centerTitle: true,
        backgroundColor: Colors.purple,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.only(
            top: 10,
            left: 10,
            right: 10,
          ),
          child: Column(
            // crossAxisAlignment: CrossAxisAlignment.start,
            children: [

              Card(
                elevation: 5,
                child: Column(
                  children: [
                   Icon(Icons.location_on_sharp,size: 200,color: Colors.red,),
                    SizedBox(height: 100,),
                    Column(
                      children: [
                        Text("Your current location", style: TextStyle(fontSize: 25,fontWeight: FontWeight.w500),),
                        SizedBox(height: 20,),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text("Longitude ${_currentPosition!.longitude.toString()}"),
                            Text("Latitude ${_currentPosition!.latitude.toString()}"),
                          ],
                        )

                      ],
                    ),


                    Column(
                      children: [







                        Padding(
                          padding: const EdgeInsets.only(top: 30, left: 20),
                          child: Container(
                            width: MediaQuery.of(context).size.width,
                            child: ElevatedButton(
                              style: ElevatedButton.styleFrom(
                                  foregroundColor: Colors.green[100],
                                  backgroundColor: Colors.green[100],
                                  // shape: const StadiumBorder(),
                                  elevation: 7),
                              onPressed: () async {
                                setState(() {
                                  ripple = true;
                                });
                                print(_currentPosition!.latitude);
                                print(_currentPosition!.longitude);
                                _getCurrentPosition();
                                Navigator.push(context,
                                    MaterialPageRoute(builder: (context) =>NearByPlaces(lati: _currentPosition!.latitude.toString(), longi: _currentPosition!.longitude.toString(),)));
                                // login();
                                //
                                // done=false;
                                // await Stream.periodic(Duration(seconds: 1)).takeWhile((_) => !done).forEach((_) async
                                // {
                                //   _getCurrentPosition();
                                //   print('>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>Longggggggggggggggggg');
                                //   print(_currentPosition!.longitude);
                                //  await login();
                                //
                                // });
                                // loopp();
                              },
                              child: const Text(
                                "Show me nearby eye hospitals",
                                style: TextStyle(color: Color(0xff008767)),
                              ),
                            ),
                          ),
                        ),


                      ],
                    ),
                    SizedBox(height: 100,),
                  ],
                ),

              ),
            ],
          ),
        ),
      ),
    );
  }
}


