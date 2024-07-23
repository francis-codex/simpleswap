// ignore_for_file: avoid_print

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

void main() async {
  // Create a connection to the devnet cluster.
  final cluster = web3.Cluster.testnet;
  final connection = web3.Connection(cluster);

  print('Creating accounts...\n');

  // Create a new wallet to transfer tokens from.
  final wallet1 = web3.Keypair.generateSync();
  final address1 = wallet1.pubkey;

  // Store the address in the global variable

  // Fund the sending wallet.
    await connection.requestAndConfirmAirdrop(
      wallet1.pubkey, 
      solToLamports(2).toInt(),
    );

  // Check the account balances before making the transfer.
  final balance = await connection.getBalance(wallet1.pubkey);
  print('Account $address1 has an initial balance of $balance lamports.');

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
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
      ),
    );
  }
}
