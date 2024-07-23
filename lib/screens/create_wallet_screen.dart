// ignore_for_file: avoid_print

<<<<<<< HEAD
=======
// Solana imports
import 'package:firebase_auth/firebase_auth.dart';
import 'package:provider/provider.dart';
// ignore: unused_import
import 'package:solana_web3/programs.dart';
import 'package:solana_web3/solana_web3.dart' as web3;

// Privider Imports
// ignore: unused_import
import 'package:solana/solana.dart';

>>>>>>> aa680d1d9df85f0f0dad9b75e4107a342a1ffb31
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:solana_web3/solana_web3.dart' as web3;
import 'package:simpleswap/screens/home_screen.dart';
import 'package:solana_web3/solana_web3.dart';


// Providers
class KeyPairProvider extends ChangeNotifier {
  web3.Keypair? keyPair;

  void setKeyPair(web3.Keypair newKeyPair) {
    keyPair = newKeyPair;
    notifyListeners();
  }
}

<<<<<<< HEAD
void main() async {
  // Create a connection to the devnet cluster.
  final cluster = web3.Cluster.testnet;
=======
// ignore: no_leading_underscores_for_local_identifiers
void main(final List<String> _arguments) async {
  // Create a connection to the devnet cluster.
  final cluster = web3.Cluster.devnet;
>>>>>>> aa680d1d9df85f0f0dad9b75e4107a342a1ffb31
  final connection = web3.Connection(cluster);

  print('Creating accounts...\n');

  // Create a new wallet to transfer tokens from.
  final wallet1 = web3.Keypair.generateSync();
  final address1 = wallet1.pubkey;
<<<<<<< HEAD

  // Store the address in the global variable

  // Fund the sending wallet.
    await connection.requestAndConfirmAirdrop(
      wallet1.pubkey, 
      solToLamports(2).toInt(),
    );
=======
>>>>>>> aa680d1d9df85f0f0dad9b75e4107a342a1ffb31

  // Check the account balances before making the transfer.
  final balance = await connection.getBalance(wallet1.pubkey);
  print('Account $address1 has an initial balance of $balance lamports.');
<<<<<<< HEAD
=======
  final auth = await FirebaseAuth.instance.currentUser;
  print(auth);
}

class CreateWalletScreen extends StatefulWidget {
  const CreateWalletScreen({super.key});
>>>>>>> aa680d1d9df85f0f0dad9b75e4107a342a1ffb31

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
<<<<<<< HEAD
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Solana Wallet',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const CreateWalletScreen(),
    );
  }
}

class CreateWalletScreen extends StatelessWidget {
  const CreateWalletScreen({super.key});

    @override
  Widget build(BuildContext context) {
      return ChangeNotifierProvider(
      create: (context) => KeyPairProvider(),
      child: Scaffold(
        body: Container(
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
                child: SingleChildScrollView(
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
                              builder: (context) => const HomeSccreen(),
                            ),
                          );
                        },
                        child: const Padding(
                          padding: EdgeInsets.symmetric(vertical: 12),
                          child: Text(
                            "Create a new wallet",
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              color: Color(0xFF101010),
                              fontSize: 16,
                              fontWeight: FontWeight.w700,
                              fontFamily: "NunitoSans",
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
                ),
              ),
            ],
          ),
        ),
=======
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
>>>>>>> aa680d1d9df85f0f0dad9b75e4107a342a1ffb31
      ),
    );
  }
}
