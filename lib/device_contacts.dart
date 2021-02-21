import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter_contacts/flutter_contacts.dart';
// import 'package:permission_handler/permission_handler.dart';

class DeviceContacts extends HookWidget {
  static const title = 'Device Contacts';
  static const androidIcon = Icon(Icons.contacts);
  static const iosIcon = Icon(CupertinoIcons.group);

  @override
  Widget build(BuildContext context) {
    final _contacts = useState([]);

    Future _loadContacts(bool withPhotos) async {
      final contacts = withPhotos
          ? (await FlutterContacts.getContacts(withPhotos: true)).toList()
          : (await FlutterContacts.getContacts()).toList();

      _contacts.value = contacts;
    }

    useEffect(() {
      _loadContacts(false);
      return;
    }, []);

    refreshContacts() async {}

    refreshContacts();

    return CupertinoPageScaffold(
      navigationBar: CupertinoNavigationBar(),
      child: ListView.builder(
        itemCount: _contacts.value.length,
        itemBuilder: (BuildContext context, int index) {
          return Text(_contacts.value[index]);
        },
      ),
    );
  }
}
