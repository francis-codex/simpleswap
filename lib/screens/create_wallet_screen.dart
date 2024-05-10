/// Imports

// ignore_for_file: avoid_print

// Solana imports
import 'package:firebase_auth/firebase_auth.dart';
import 'package:provider/provider.dart';
// ignore: unused_import
import 'package:solana_web3/programs.dart';
import 'package:solana_web3/solana_web3.dart' as web3;

// Privider Imports
// ignore: unused_import
import 'package:solana/solana.dart';

import 'package:flutter/material.dart';
import 'package:simpleswap/screens/home_screen.dart';
import 'package:solana_web3/solana_web3.dart';

// Prividers
class KeyPairProvider extends ChangeNotifier {
  Keypair? keyPair;

  void setKeyPair(Keypair newKeyPair) {
    keyPair = newKeyPair;
    notifyListeners();
  }
}

// ignore: no_leading_underscores_for_local_identifiers
void main(final List<String> _arguments) async {
  // Create a connection to the devnet cluster.
  final cluster = web3.Cluster.devnet;
  final connection = web3.Connection(cluster);

  print('Creating accounts...\n');

  // Create a new wallet to transfer tokens from.
  final wallet1 = web3.Keypair.generateSync();
  final address1 = wallet1.pubkey;

  // Check the account balances before making the transfer.
  final balance = await connection.getBalance(wallet1.pubkey);
  print('Account $address1 has an initial balance of $balance lamports.');
  final auth = await FirebaseAuth.instance.currentUser;
  print(auth);
}

class CreateWalletScreen extends StatefulWidget {
  const CreateWalletScreen({super.key});

  @override
  State<CreateWalletScreen> createState() => _CreateWalletScreenState();
}

class _CreateWalletScreenState extends State<CreateWalletScreen> {
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => KeyPairProvider(), // Provide the KeyPairProvider
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
                      onPressed: () async {
                        // Navigator.push(
                        //   context,
                        //   MaterialPageRoute(
                        //     builder: (context) =>
                        //         const HomeScreen(), // Navigate to ScreenTwo
                        //   ),
                        // );
                        // Get User Email And Details(image, name, etc.)
                        final auth = await FirebaseAuth.instance.currentUser;
                        print(auth);
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
                          ),
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
    );
  }
}
