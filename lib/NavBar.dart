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
                null;
              }),
          ExpansionTile(
            leading: Icon(
              Icons.book,
              color: Color(0xFF060E39),
            ),
            title: Text('Akademik'),
            children: <Widget>[
              ListTile(
                title: Text(
                  'Menu 1',
                ),
                onTap: () {
                  null;
                },
              ),
              ListTile(
                title: Text(
                  'Menu 2',
                ),
                onTap: () {
                  null;
                },
              )
            ],
          ),
          ExpansionTile(
            leading: Icon(
              Icons.assured_workload,
              color: Color(0xFF060E39),
            ),
            title: Text('Fakultas dan Prodi'),
            children: <Widget>[
              ListTile(
                title: Text(
                  'Menu 1',
                ),
                onTap: () {
                  null;
                },
              ),
              ListTile(
                title: Text(
                  'Menu 2',
                ),
                onTap: () {
                  null;
                },
              )
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
                  'Menu 1',
                ),
                onTap: () {
                  null;
                },
              ),
              ListTile(
                title: Text(
                  'Menu 2',
                ),
                onTap: () {
                  null;
                },
              )
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
                title: Text(
                  'Menu 1',
                ),
                onTap: () {
                  null;
                },
              ),
              ListTile(
                title: Text(
                  'Menu 2',
                ),
                onTap: () {
                  null;
                },
              )
            ],
          ),
          ListTile(
              leading: Icon(
                Icons.checklist,
                color: Color(0xFF060E39),
              ),
              title: Text('Survey'),
              onTap: () {
                null;
              }),
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
          onPressed: () => Navigator.pop(context, 'OK'),
          child: const Text('OK'),
        ),
      ],
    ),
  );
}
