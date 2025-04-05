import 'dart:typed_data';

import 'package:flutter/material.dart';
// import 'package:image_picker/image_picker.dart';

import 'home_screen.dart';

class ItemsUploadScreen extends StatefulWidget {
  const ItemsUploadScreen({super.key});

  @override
  State<ItemsUploadScreen> createState() => _ItemsUploadScreenState();
}

class _ItemsUploadScreenState extends State<ItemsUploadScreen> {

  Uint8List? imageFileUint8List;
  bool isUploading = false;

  TextEditingController sellerNameTextEditingController = TextEditingController();
  TextEditingController sellerPhoneTextEditingController = TextEditingController();
  TextEditingController itemNameTextEditingController = TextEditingController();
  TextEditingController itemDescriptionTextEditingController = TextEditingController();
  TextEditingController itemPriceTextEditingController = TextEditingController();


  // This function builds your actual screen
  Widget uploadFormScreen()
  {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        backgroundColor: Colors.black,
        leading: IconButton(
          onPressed: (){
            Navigator.push(
              context,
              MaterialPageRoute(builder: (c) => const HomeScreen()),
            );
          },
          icon: Icon(
            Icons.arrow_back_rounded,
            color: Colors.white,
          ),
        ),
        actions: [
          IconButton(onPressed: ()
          {

          },
          icon: const Icon(
            Icons.cloud_upload,
            color: Colors.white,
          )
          )
        ],
        title: const Text(
          "Upload",
          style: TextStyle(color: Colors.white),
        ),
      ),
      body: ListView(
        children: [

          isUploading == true
          ? const LinearProgressIndicator(color: Colors.purpleAccent,)
              : Container(),


          //image
          SizedBox(
            height: 230,
            width: MediaQuery.of(context).size.width*0.8,
            child: Center(
              child: imageFileUint8List != null ?
              Image.memory(
                imageFileUint8List!
              ): const Icon(
                Icons.image_not_supported,
                color: Colors.grey,
                size: 50,
              ),
              ),
            ),

          const Divider(
            color: Colors.white70,
            thickness: 2,
          ),

          //seller name
          ListTile(
            leading: const Icon(
              Icons.person_pin_rounded,
              color: Colors.white,

            ),
            title: SizedBox(
              width: 250,
              child: TextField(
                style: const TextStyle(color: Colors.grey),
                controller: sellerNameTextEditingController,
                decoration: const InputDecoration(
                  hintText: "Seller Name"
                ),
              ),
            ),
          ),
          const Divider(
            color: Colors.white70,
            thickness: 1,
          ),

          //seller phone
          ListTile(
            leading: const Icon(
              Icons.phone_iphone_rounded,
              color: Colors.white,

            ),
            title: SizedBox(
              width: 250,
              child: TextField(
                style: const TextStyle(color: Colors.grey),
                controller: sellerPhoneTextEditingController,
                decoration: const InputDecoration(
                    hintText: "Seller Phone"
                ),
              ),
            ),
          ),
          const Divider(
            color: Colors.white70,
            thickness: 1,
          ),

          //item name
          ListTile(
            leading: const Icon(
              Icons.title,
              color: Colors.white,

            ),
            title: SizedBox(
              width: 250,
              child: TextField(
                style: const TextStyle(color: Colors.grey),
                controller: itemNameTextEditingController,
                decoration: const InputDecoration(
                    hintText: "Item Name"
                ),
              ),
            ),
          ),
          const Divider(
            color: Colors.white70,
            thickness: 1,
          ),

          //item description
          ListTile(
            leading: const Icon(
              Icons.description_outlined,
              color: Colors.white,

            ),
            title: SizedBox(
              width: 250,
              child: TextField(
                style: const TextStyle(color: Colors.grey),
                controller: itemDescriptionTextEditingController,
                decoration: const InputDecoration(
                    hintText: "Item Description"
                ),
              ),
            ),
          ),
          const Divider(
            color: Colors.white70,
            thickness: 1,
          ),

          //item price
          ListTile(
            leading: const Icon(
              Icons.price_change_rounded,
              color: Colors.white,

            ),
            title: SizedBox(
              width: 250,
              child: TextField(
                style: const TextStyle(color: Colors.grey),
                controller: itemPriceTextEditingController,
                decoration: const InputDecoration(
                    hintText: "Item Price"
                ),
              ),
            ),
          ),
          const Divider(
            color: Colors.white70,
            thickness: 1,
          ),

        ],
      )
    );
  }


  Widget defaultScreen()
  {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        backgroundColor: Colors.black,
        title: const Text(
            "Upload New Items",
        style: TextStyle(color: Colors.white),
        ),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [

            const Icon(Icons.add_photo_alternate,
            color: Colors.white,
            size: 200,
            ),
            ElevatedButton(
              onPressed: (){
                showDialogBox();
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.white
              ),
              child: const Text("Add new Item",
              style: TextStyle(color: Colors.black),
              ),
            )
          ],
        ),
      ),
    );
  }

  showDialogBox()
  {
    return showDialog(
        context: context,
        builder: (c)
    {
      return SimpleDialog(
        backgroundColor: Colors.black,
        title: const Text(
          "Item Image",
          style: TextStyle(
            color: Colors.white70,
          ),
        ),
        children: [
          SimpleDialogOption(
            onPressed: ()
            {
              captureImage();
            },
            child: const Text(
              "Capture",
              style: TextStyle(color: Colors.grey),
            ),
          ),
          SimpleDialogOption(
            onPressed: ()
            {
              chooseImage();
            },
            child: const Text(
              "Choose",
              style: TextStyle(color: Colors.grey),
            ),
          ),
          SimpleDialogOption(
            onPressed: ()
            {
              Navigator.pop(context);
            },
            child: const Text(
              "Cancel",
              style: TextStyle(color: Colors.grey),
            ),
          ),
        ],
      );
    }
    );
  }

  captureImage() async
  {
    // try
    //     {
    //       final pickedImage = await ImagePicker().pickImage(source: ImageSource.camera);
    //
    //       if(pickedImage != null)
    //         {
    //           String imagePath = pickedImage.path;
    //           imageFileUint8List = await pickedImage.readAsBytes();
    //
    //           //remove bg
    //           //makeimg transparent
    //           setState(() {
    //             imageFileUint8List;
    //           }
    //           );
    //         }
    //     }
    // catch(errorMsg)
    // {
    //   print(errorMsg.toString());
    //
    //   setState(() {
    //     imageFileUint8List;
    //   }
    //   );
    // }
  }
  chooseImage() async
  {
    // try
    // {
    //   final pickedImage = await ImagePicker().pickImage(source: ImageSource.gallery);
    //
    //   if(pickedImage != null)
    //   {
    //     String imagePath = pickedImage.path;
    //     imageFileUint8List = await pickedImage.readAsBytes();
    //
    //     //remove bg
    //     //makeimg transparent
    //     setState(() {
    //       imageFileUint8List;
    //     }
    //     );
    //   }
    // }
    // catch(errorMsg)
    // {
    //   print(errorMsg.toString());
    //
    //   setState(() {
    //     imageFileUint8List;
    //   }
    //   );
    // }
  }

  @override
  Widget build(BuildContext context) {
    return defaultScreen(); // ✅ Return the form screen
  }
}
