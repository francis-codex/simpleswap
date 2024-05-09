import 'package:flutter/material.dart';
import 'package:simpleswap/screens/home_screen.dart';

class CreateWalletScreen extends StatefulWidget {
  const CreateWalletScreen({super.key});

  @override
  State<CreateWalletScreen> createState() => _CreateWalletScreenState();
}

class _CreateWalletScreenState extends State<CreateWalletScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Container(
          width: MediaQuery.of(context).size.width,
          height: MediaQuery.of(context).size.height,
          decoration: const BoxDecoration(
            image: DecorationImage(
              image: AssetImage("assets/images/create_wallet_bg.png"),
              fit: BoxFit.cover,
            ),
          ),
          child: Stack(
            children: [
              Positioned(
                bottom: 90,
                left: 0,
                right: 0,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    const Text(
                      "Let’s get you in",
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 32,
                        fontWeight: FontWeight.w700,
                        fontFamily: "Poppins",
                      ),
                    ),
                    const SizedBox(height: 10),
                    const Text(
                      "To get started, please create a new wallet or import one from seed phrase.",
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        color: Color(0xFFCACACA),
                        fontSize: 16,
                        fontWeight: FontWeight.w400,
                        fontFamily: "NunitoSans",
                      ),
                    ),
                    const SizedBox(height: 40),
                    Container(
                      width: 340,
                      decoration: const BoxDecoration(
                        color: Color(0xFF6FB9DA),
                        borderRadius: BorderRadius.all(Radius.circular(10)),
                      ),
                      child: TextButton(
                        onPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) =>
                                  const HomeSccreen(), // Navigate to ScreenTwo
                            ),
                          );
                        },
                        child: const Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              "Create a new wallet",
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                color: Color(0xFF101010),
                                fontSize: 16,
                                fontWeight: FontWeight.w700,
                                fontFamily: "NunitoSans",
                              ),
                            )
                          ],
                        ),
                      ),
                    ),
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
