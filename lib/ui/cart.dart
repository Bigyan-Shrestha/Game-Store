import 'package:flutter/material.dart';
import 'package:khalti/khalti.dart';

class CartPage extends StatelessWidget {
  final TextEditingController phoneController = TextEditingController();
  final TextEditingController pinCodeController = TextEditingController();
  final TextEditingController otpController = TextEditingController();
  final List<String> selectedImageUrls;
  final List<String> selectedDownloadLinks;
  final List<double?> selectedPrices;
  final String selectedImageNames;
  // Declare initiationModel as a class variable


  CartPage({
    Key? key,
    required this.selectedImageUrls,
    required this.selectedDownloadLinks,
    required this.selectedPrices,
    required this.selectedImageNames,
  }) : super(key: key);
  PaymentInitiationResponseModel? initiationModel;
  // Function to initiate payment
  Future<void> initiatePayment() async {
    final service = KhaltiService(client: KhaltiHttpClient());

    try {
      initiationModel = await service.initiatePayment(
        request: PaymentInitiationRequestModel(
          amount: int.parse(selectedPrices as String),
          mobile: phoneController.text,
          productIdentity: 'mac-mini',
          productName: selectedImageNames,
          transactionPin: pinCodeController.text,
          productUrl: 'Test',
          additionalData: {
            'Test': 'Success',

          },
        ),
      );

      // Handle the initiation response as needed
      print('Initiation Token: ${initiationModel?.token}');
    } catch (e) {
      // Handle errors or throw them if needed
      print('Error initiating payment: $e');
    }
  }

  Future<void> verifyPayment() async {
    final service = KhaltiService(client: KhaltiHttpClient());

    try {
      String? otp = otpController.text;

      if (initiationModel != null) {
        final confirmationModel = await service.confirmPayment(
          request: PaymentConfirmationRequestModel(
            confirmationCode: otp,
            token: initiationModel!.token,
            transactionPin: pinCodeController.text,
          ),
        );

        // Process the confirmation response
        print('Verification Token: ${confirmationModel.token}');
      } else {
        // Handle the case where initiationModel is null
        print('Error: initiationModel is null');
      }
    } catch (e) {
      // Handle errors or throw them if needed
      print('Error confirming payment: $e');
    }
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black87,
      appBar: AppBar(
        backgroundColor: Colors.orange,
        title: const Text('Cart',style: const TextStyle(
          fontSize: 20,

          color: Colors.white,
        ),),
      ),
      body: ListView.builder(
        itemCount: selectedImageUrls.length,
        itemBuilder: (context, index) {
          return buildCartItem(
            imageUrl: selectedImageUrls[index],
            downloadLink: selectedDownloadLinks[index],
            price: selectedPrices[index],
            name: selectedImageNames,
          );
        },
      ),
    );
  }

  Widget buildCartItem({
    required String imageUrl,
    required String downloadLink,
    double? price,
    required name,
  }) {
    return Card(
      color: Colors.white10,
      margin: const EdgeInsets.all(8.0),
      child: Padding(

        padding: const EdgeInsets.all(8.0),
        child: Column(

          children: [
            Image.asset(
              imageUrl,
            ),
            const SizedBox(height: 8.0),
            const Text(
              'Game Details:',
              style: TextStyle(
                fontSize: 16.0,

                color: Colors.orange
              ),
            ),
            const SizedBox(height: 8.0),
            Text(
              'Game : ${name.toString()}',
              style: const TextStyle(
                fontSize: 14.0,

                color: Colors.white,
              ),
            ),
            const SizedBox(height: 10),
            Text(
              price == null ? 'Price: Free' : 'Price: Rs.$price',
              style: const TextStyle(
                fontSize: 14.0,
                color: Colors.white,
              ),
            ),
            const SizedBox(height: 10),
            Container(
              color: Colors.black54,
              width: 220, // Set the desired width
              child: TextFormField(
                controller: phoneController,

                keyboardType: TextInputType.phone,
                style: TextStyle(color: Colors.orange),
                decoration: InputDecoration(
                  labelText: 'Enter your phone.',
                  labelStyle: TextStyle(color: Colors.orange),
                  focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.orange),
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.orange),
                  ),
                  suffixIcon: Icon(
                    Icons.phone,
                    color: Colors.orange,
                  ),
                ),
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            Container(
              color: Colors.black54,
              width: 220, // Set the desired width
              child: TextFormField(
                controller: pinCodeController,
                obscureText: true,
                keyboardType: TextInputType.number,
                style: TextStyle(color: Colors.orange),
                decoration: InputDecoration(
                  labelText: 'Enter Pin.',
                  labelStyle: TextStyle(color: Colors.orange),
                  focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.orange),
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.orange),
                  ),
                  suffixIcon: Icon(
                    Icons.lock,
                    color: Colors.orange,
                  ),
                ),
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            ElevatedButton(
              onPressed: () async {

                await initiatePayment();
              },
              style: ElevatedButton.styleFrom(
                foregroundColor: Colors.white, backgroundColor: Colors.orange,  // Text color
                padding: EdgeInsets.symmetric(vertical: 15, horizontal: 20),  // Button padding
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10),  // Button border radius
                ),
                elevation: 3,  // Button elevation
              ),
              child: Text(
                'Pay via Khalti',
                style: TextStyle(
                  fontSize: 16,  // Text font size
                ),
              ),
            ),

            const SizedBox(
              height: 50,
            ),
            Text('Check you phone for OTP.',
            style: TextStyle(color: Colors.orange),),
            SizedBox(height: 10,),
            Container(
            color: Colors.black54 ,
              width: 200, // Set the desired width
              child:
              TextFormField(

                controller: otpController,

                keyboardType: TextInputType.number,
                style: TextStyle(color: Colors.orange),
                decoration: InputDecoration(
                  labelText: 'Enter OTP',
                  labelStyle: TextStyle(color: Colors.orange),
                  focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.orange),
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.orange),
                  ),
                  suffixIcon: Icon(
                    Icons.lock,
                    color: Colors.orange,
                  ),
                ),
              ),
            ),
            SizedBox(height: 20,),
            ElevatedButton(

              onPressed: () async {
                await verifyPayment();
              },
              style: ElevatedButton.styleFrom(
                foregroundColor: Colors.white, backgroundColor: Colors.orange,  // Text color
                padding: EdgeInsets.symmetric(vertical: 15, horizontal: 20),  // Button padding
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10),  // Button border radius
                ),
                elevation: 3,  // Button elevation
              ),
              child: Text(
                'Submit',
                style: TextStyle(
                  fontSize: 16,  // Text font size
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
  }
