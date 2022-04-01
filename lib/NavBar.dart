// ignore: file_names
import 'package:flutter/material.dart';

class NavBar extends StatelessWidget {
  const NavBar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: [
          UserAccountsDrawerHeader(
            accountName: Text('Abighail Shafira'),
            accountEmail: Text('example@mail.com'),
            currentAccountPicture: CircleAvatar(
                child: ClipOval(
              child: Image.network(
                'https://www.mecgale.com/wp-content/uploads/2017/08/dummy-profile.png',
                width: 90,
                height: 90,
                fit: BoxFit.cover,
              ),
            )),
            decoration: BoxDecoration(
              gradient: LinearGradient(
              begin: Alignment.topLeft,
              end: Alignment.bottomCenter,
              colors: [Color(0xFFFD4140), Color(0xFF060E39)]),
            ),
          ),
          ListTile(
            leading: Icon(Icons.favorite),
            title: Text('Beranda'),
            onTap: () => null,
          ),
          ListTile(
            leading: Icon(Icons.auto_stories),
            title: Text('Akademik'),
            trailing: Icon(Icons.arrow_drop_down),
            onTap: () => null,
          ),
          ListTile(
            leading: Icon(Icons.assured_workload),
            title: Text('Fakultas & Prodi'),
            trailing: Icon(Icons.arrow_drop_down),
            onTap: () => null,
          ),
          ListTile(
            leading: Icon(Icons.people),
            title: Text('Dosen & Mahasiswa'),
            trailing: Icon(Icons.arrow_drop_down),
            onTap: () => null,
          ),
          ListTile(
            leading: Icon(Icons.beenhere),
            title: Text('Prestasi'),
            trailing: Icon(Icons.arrow_drop_down),
            onTap: () => null,
          ),
          ListTile(
            leading: Icon(Icons.article),
            title: Text('Survey'),
            onTap: () => null,
          ),
        ],
      ),
    );
  }
}
