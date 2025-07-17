import 'package:flutter/material.dart';

void main() {
  runApp(MicroBankApp());
}

class MicroBankApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'MicroBank',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.indigo,
        fontFamily: 'Roboto',
      ),
      initialRoute: '/',
      routes: {
        '/': (_) => HomePage(),
        '/pix': (_) => PixPage(),
        '/loans': (_) => LoansPage(),
        '/payments': (_) => PaymentsPage(),
        '/receipts': (_) => ReceiptsPage(),
        '/premium': (_) => PremiumPage(),
      },
    );
  }
}

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Row(
          children: [
            CircleAvatar(
              backgroundImage: AssetImage('assets/user.jpg'),
            ),
            SizedBox(width: 10),
            Text.rich(
              TextSpan(
                text: 'Olá, ',
                children: [
                  TextSpan(
                    text: 'usuário MicroBank.',
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                ],
              ),
            ),
          ],
        ),
        actions: [
          Icon(Icons.menu),
          SizedBox(width: 16),
        ],
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Saldo em conta',
              style: TextStyle(color: Colors.orange, fontSize: 16),
            ),
            Text(
              'R\$ 1.500,67',
              style: TextStyle(fontSize: 28, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                HomeIconButton(
                    icon: Icons.pix, label: 'Área Pix', route: '/pix'),
                HomeIconButton(
                    icon: Icons.money, label: 'Empréstimos', route: '/loans'),
                HomeIconButton(
                    icon: Icons.payment,
                    label: 'Pagamentos',
                    route: '/payments'),
                HomeIconButton(
                    icon: Icons.receipt,
                    label: 'Recebimentos',
                    route: '/receipts'),
              ],
            ),
            SizedBox(height: 30),
            GestureDetector(
              onTap: () => Navigator.pushNamed(context, '/premium'),
              child: Container(
                padding: EdgeInsets.all(16),
                decoration: BoxDecoration(
                  color: Colors.orange.shade50,
                  borderRadius: BorderRadius.circular(12),
                  border: Border.all(color: Colors.orange),
                ),
                child: Row(
                  children: [
                    Icon(Icons.bar_chart, size: 40, color: Colors.orange),
                    SizedBox(width: 12),
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text('Impulsione seus negócios',
                              style: TextStyle(fontWeight: FontWeight.bold)),
                          Text('através dos nossos serviços premium.'),
                          SizedBox(height: 5),
                          Text('Contrate agora',
                              style: TextStyle(color: Colors.orange)),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
            SizedBox(height: 30),
            Center(
              child: Column(
                children: [
                  Text(
                    'Pix por aproximação? Você encontra aqui.',
                    style: TextStyle(color: Colors.blue),
                  ),
                  TextButton(
                    onPressed: () {},
                    child: Text('Clique aqui e saiba mais.',
                        style: TextStyle(color: Colors.orange)),
                  ),
                  Text(
                    'Aqui na MicroBank você está conectado mesmo off-line.',
                    style: TextStyle(color: Colors.indigo),
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}

class HomeIconButton extends StatelessWidget {
  final IconData icon;
  final String label;
  final String route;

  const HomeIconButton({
    required this.icon,
    required this.label,
    required this.route,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => Navigator.pushNamed(context, route),
      child: Column(
        children: [
          CircleAvatar(
            backgroundColor: Colors.indigo.shade50,
            child: Icon(icon, color: Colors.indigo),
          ),
          SizedBox(height: 8),
          Text(label),
        ],
      ),
    );
  }
}

// Telas Simples para cada funcionalidade

class PixPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return _simplePage(context, 'Área Pix');
  }
}

class LoansPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return _simplePage(context, 'Empréstimos');
  }
}

class PaymentsPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return _simplePage(context, 'Pagamentos');
  }
}

class ReceiptsPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return _simplePage(context, 'Recebimentos');
  }
}

class PremiumPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return _simplePage(context, 'Serviços Premium');
  }
}

Widget _simplePage(BuildContext context, String title) {
  return Scaffold(
    appBar: AppBar(title: Text(title)),
    body: Center(
      child: Text(
        '$title em construção...',
        style: TextStyle(fontSize: 18),
      ),
    ),
  );
}
