// ignore: file_names
import 'package:flutter/material.dart';
import 'DosenPage.dart';
import 'FakultasPage.dart';
import 'MahasiswaPage.dart';
import 'PublikasiPage.dart';
import 'TrendNilai.dart';
import 'ProdiPage.dart';
import 'splash-screen.dart';
import 'Leaderboard.dart';
import 'Dashboard.dart';
import 'login.dart';

class NavBar extends StatelessWidget {
  const NavBar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: [
          UserAccountsDrawerHeader(
            accountName: const Text('Abighail Shafira'),
            accountEmail: const Text('example@mail.com'),
            currentAccountPicture: CircleAvatar(
                child: ClipOval(
              child: Image.network(
                'https://www.mecgale.com/wp-content/uploads/2017/08/dummy-profile.png',
                width: 90,
                height: 90,
                fit: BoxFit.cover,
              ),
            )),
            decoration: const BoxDecoration(color: const Color(0xFF060E39)),
          ),
          ListTile(
              leading: Icon(
                Icons.home,
                color: Color(0xFF060E39),
              ),
              title: Text(
                'Beranda',
              ),
              onTap: () {
                Navigator.of(context)
                    .push(MaterialPageRoute(builder: (context) {
                  return MyHomePage();
                }));
              }),
          ExpansionTile(
            leading: Icon(
              Icons.assured_workload,
              color: Color(0xFF060E39),
            ),
            title: Text('Fakultas dan Prodi'),
            children: <Widget>[
              ListTile(
                  title: Text(
                    'Fakultas',
                  ),
                  onTap: () {
                    Navigator.of(context)
                        .push(MaterialPageRoute(builder: (context) {
                      return FakultasPage();
                    }));
                  }),
              ListTile(
                  title: Text(
                    'Prodi',
                  ),
                  onTap: () {
                    Navigator.of(context)
                        .push(MaterialPageRoute(builder: (context) {
                      return ProdiPage();
                    }));
                  }),
            ],
          ),
          ExpansionTile(
            leading: Icon(
              Icons.people,
              color: Color(0xFF060E39),
            ),
            title: Text('Dosen dan Mahasiswa'),
            children: <Widget>[
              ListTile(
                  title: Text(
                    'Dosen',
                  ),
                  onTap: () {
                    Navigator.of(context)
                        .push(MaterialPageRoute(builder: (context) {
                      return DosenPage();
                    }));
                  }),
              ListTile(
                  title: Text(
                    'Mahasiswa',
                  ),
                  onTap: () {
                    Navigator.of(context)
                        .push(MaterialPageRoute(builder: (context) {
                      return MahasiswaPage();
                    }));
                  }),
            ],
          ),
          ExpansionTile(
            leading: Icon(
              Icons.school,
              color: Color(0xFF060E39),
            ),
            title: Text('Prestasi'),
            children: <Widget>[
              ListTile(
                  title: const Text(
                    'Leaderboard',
                  ),
                  onTap: () {
                    Navigator.of(context)
                        .push(MaterialPageRoute(builder: (context) {
                      return Profile();
                    }));
                  }),
            ],
          ),
          ExpansionTile(
            leading: Icon(
              Icons.school,
              color: Color(0xFF060E39),
            ),
            title: Text('Akademik'),
            children: <Widget>[
              ListTile(
                  title: const Text(
                    'Publikasi',
                  ),
                  onTap: () {
                    Navigator.of(context)
                        .push(MaterialPageRoute(builder: (context) {
                      return Publikasi();
                    }));
                  }),
              ListTile(
                  title: const Text(
                    'Trend Nilai',
                  ),
                  onTap: () {
                    Navigator.of(context)
                        .push(MaterialPageRoute(builder: (context) {
                      return TrendNilai();
                    }));
                  }),
            ],
          ),
          ListTile(
              leading: Icon(
                Icons.exit_to_app,
                color: Color(0xFF060E39),
              ),
              title: Text('Keluar'),
              onTap: () {
                tampilkanDialog(context);
              }),
        ],
      ),
    );
  }
}

void tampilkanDialog(BuildContext context) {
  showDialog<String>(
    context: context,
    builder: (BuildContext context) => AlertDialog(
      title: const Text('Keluar'),
      content: const Text('Anda yakin ingin keluar?'),
      actions: <Widget>[
        TextButton(
          onPressed: () => Navigator.pop(context, 'Cancel'),
          child: const Text('Batal'),
        ),
        TextButton(
          onPressed: () {
            Navigator.of(context).push(MaterialPageRoute(builder: (context) {
              return HomePage();
            }));
          },
          child: const Text('OK'),
        ),
      ],
    ),
  );
}
