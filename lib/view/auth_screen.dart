import 'package:buy_dotcom_app/constants/Common_functions.dart';
import 'package:buy_dotcom_app/utils/colors.dart';
import 'package:country_picker/country_picker.dart';
import 'package:flutter/material.dart';

class AuthScreen extends StatefulWidget {
  const AuthScreen({super.key});

  @override
  State<AuthScreen> createState() => _AuthScreenState();
}

class _AuthScreenState extends State<AuthScreen> {
  bool inLogin = false;
  String currentCountryCode = '+880';
  TextEditingController mobileController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;
    final textTheme = Theme.of(context).textTheme;

    return Scaffold(
      backgroundColor: white,
      appBar: AppBar(
        backgroundColor: white,
        shadowColor: black,
        elevation: 5,
        centerTitle: true,
        title: Image(
          image: const AssetImage('assets/images/amazon_logo.png'),
          height: height * 0.04,
        ),
      ),
      body: SafeArea(
        child: Container(
          height: height,
          width: width,
          padding: EdgeInsets.symmetric(
            horizontal: width * 0.03,
            vertical: height * 0.02,
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Welcome',
                style: textTheme.displaySmall!
                    .copyWith(fontWeight: FontWeight.w600),
              ),
              CommonFunctions.blankSpace(height * 0.02, 0),
              LoginPage(width, height, textTheme, context),
              CommonFunctions.blankSpace(height * 0.05, 0),
              bottomTags(width, height, textTheme),
            ],
          ),
        ),
      ),
    );
  }

  Container LoginPage(
      double width, double height, TextTheme textTheme, BuildContext context) {
    return Container(
      width: width,
      decoration: BoxDecoration(
        border: Border.all(
          color: greyShade3,
        ),
      ),
      child: Column(
        children: [
          CreateAccount(height, width, textTheme),
          SignIn(width, height, textTheme, context),
          CommonFunctions.blankSpace(height * 0.02, 0),
          ElevatedButton(
            onPressed: () {},
            style: ElevatedButton.styleFrom(
              minimumSize: Size(width * 0.88, height * 0.06),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.all(Radius.circular(3)),
              ),
              backgroundColor: amber,
            ),
            child: Text(
              'Continue',
              style:
                  textTheme.displaySmall!.copyWith(fontWeight: FontWeight.w600),
            ),
          ),
          CommonFunctions.blankSpace(height * 0.02, 0),
          Container(
            padding: EdgeInsets.only(
              left: width * 0.03,
              right: width * 0.03,
            ),
            child: RichText(
              text: TextSpan(
                children: [
                  TextSpan(
                      text: 'By Continuing you agee to Amazon\'s',
                      style: textTheme.labelMedium!),
                  TextSpan(
                    text: ' Conditions of use',
                    style: textTheme.labelMedium!.copyWith(color: blue),
                  ),
                  TextSpan(text: ' and ', style: textTheme.labelMedium!),
                  TextSpan(
                    text: 'Privacy Notice.',
                    style: textTheme.labelMedium!.copyWith(color: blue),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  Container SignIn(
      double width, double height, TextTheme textTheme, BuildContext context) {
    return Container(
      width: width,
      padding: EdgeInsets.symmetric(
          horizontal: width * 0.03, vertical: height * 0.01),
      child: InkWell(
        onTap: () {
          setState(() {
            inLogin = false;
          });
        },
        child: Column(
          children: [
            Row(
              children: [
                Container(
                  height: height * 0.03,
                  width: width * 0.06,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    border: Border.all(
                      color: grey,
                    ),
                    color: white,
                  ),
                  child: Icon(
                    Icons.circle,
                    size: height * 0.015,
                    color: inLogin ? transparent : secondaryColor,
                  ),
                ),
                CommonFunctions.blankSpace(0, width * 0.02),
                RichText(
                  text: TextSpan(
                    children: [
                      TextSpan(
                        text: 'Sign in. ',
                        style: textTheme.bodyMedium!
                            .copyWith(fontWeight: FontWeight.bold),
                      ),
                      TextSpan(
                        text: 'Already a customer? ',
                        style: textTheme.bodyMedium,
                      ),
                    ],
                  ),
                ),
              ],
            ),
            CommonFunctions.blankSpace(height * 0.01, 0),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                InkWell(
                  onTap: () {
                    showCountryPicker(
                        context: context,
                        onSelect: (val) {
                          currentCountryCode = '+${val.phoneCode}';
                          setState(() {});
                        });
                  },
                  child: Container(
                    alignment: Alignment.center,
                    height: height * 0.06,
                    width: width * 0.2,
                    decoration: BoxDecoration(
                      border: Border.all(
                        color: grey,
                      ),
                      color: greyShade2,
                      borderRadius: BorderRadius.circular(
                        5,
                      ),
                    ),
                    child: Text(
                      currentCountryCode,
                      style: textTheme.displaySmall!
                          .copyWith(fontWeight: FontWeight.w600),
                    ),
                  ),
                ),
                SizedBox(
                  height: height * 0.06,
                  width: width * 0.62,
                  child: TextFormField(
                    controller: mobileController,
                    cursorColor: black,
                    keyboardType: TextInputType.number,
                    decoration: InputDecoration(
                      hintText: 'Mobile number',
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(5),
                        borderSide: BorderSide(color: grey),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(5),
                        borderSide: const BorderSide(color: secondaryColor),
                      ),
                      disabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(5),
                        borderSide: BorderSide(color: grey),
                      ),
                      enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(5),
                        borderSide: BorderSide(color: grey),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Container CreateAccount(double height, double width, TextTheme textTheme) {
    return Container(
      height: height * 0.06,
      width: width,
      decoration: BoxDecoration(
        border: Border(
          bottom: BorderSide(color: greyShade3),
        ),
        color: greyShade1,
      ),
      padding: EdgeInsets.symmetric(horizontal: width * 0.03),
      child: Row(
        children: [
          InkWell(
            onTap: () {
              setState(() {
                inLogin = true;
              });
            },
            child: Container(
              height: height * 0.03,
              width: width * 0.06,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                border: Border.all(
                  color: grey,
                ),
                color: white,
              ),
              child: Icon(
                Icons.circle,
                size: height * 0.015,
                color: !inLogin ? transparent : secondaryColor,
              ),
            ),
          ),
          CommonFunctions.blankSpace(0, width * 0.02),
          RichText(
            text: TextSpan(
              children: [
                TextSpan(
                  text: 'Create Account. ',
                  style: textTheme.bodyMedium!
                      .copyWith(fontWeight: FontWeight.bold),
                ),
                TextSpan(
                  text: 'New to Amazon? ',
                  style: textTheme.bodyMedium,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Column bottomTags(double width, double height, TextTheme textTheme) {
    return Column(
      children: [
        Container(
          height: 1,
          width: width,
          decoration: BoxDecoration(
            gradient: LinearGradient(
              colors: [white, grey, white],
            ),
          ),
        ),
        CommonFunctions.blankSpace(height * 0.025, 0),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Text(
              'Condition of Use',
              style: textTheme.bodyMedium!.copyWith(color: blue),
            ),
            Text(
              'Privacy',
              style: textTheme.bodyMedium!.copyWith(color: blue),
            ),
            Text(
              'Help',
              style: textTheme.bodyMedium!.copyWith(color: blue),
            ),
          ],
        ),
        CommonFunctions.blankSpace(height * 0.01, 0),
        Text(
          '© 1996-2023, Amazon.com, Inc. or its affiliates',
          style: textTheme.labelMedium!.copyWith(color: grey),
        )
      ],
    );
  }
}
