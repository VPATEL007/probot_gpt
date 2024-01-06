import 'dart:convert';
import 'dart:developer';

import 'package:http/http.dart' as http;
import 'package:probot/config.dart';



  createOrder() async {
    final myData = await ApiServices().razorPayApi();
    log("myDataCreate: $myData");
    if (myData["status"] == "success") {
      log(myData);
      return myData["body"]["id"];
    } else {
      return "err";
    }
  }


class ApiServices {
  razorPayApi( ) async {
    var auth =
        'Basic ${base64Encode(utf8.encode('${appCtrl.firebaseConfigModel!.razorPayKey}:${appCtrl.firebaseConfigModel!.razorPaySecret}'))}';
    var headers = {'content-type': 'application/json', 'Authorization': auth};
    var request =
    http.Request('POST', Uri.parse('https://api.razorpay.com/v1/orders'));
    request.body = json.encode({
      "amount": 350 * 100, // Amount in smallest unit like in paise for INR
      "currency": "INR", //Currency
      "receipt": "_1" //R
    });
    request.headers.addAll(headers);
/*https://api.razorpay.com/v1/subscriptions*/
    /* "plan_id": "plan_LVkMeGIqlbdECh", // Amount in smallest unit like in paise for INR
      "total_count": 1,//Currency
      //Reciept Id*/
    http.StreamedResponse response = await request.send();

    if (response.statusCode == 200) {
      return {
        "status": "success",
        "body": jsonDecode(await response.stream.bytesToString())
      };
    } else {
      return {"status": "fail", "message": (response.reasonPhrase)};
    }
  }
}