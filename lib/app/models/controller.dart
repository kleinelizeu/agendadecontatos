import 'package:agendadecontatos/app/models/contact_model.dart';
import 'package:agendadecontatos/app/utils/db_util.dart';
import 'package:mobx/mobx.dart';
part 'controller.g.dart';

class Controller = _ControllerBase with _$Controller;

abstract class _ControllerBase with Store {
  //  ObservableList<ContactModel> listContacts = [].asObservable();
  @observable
  var listContacts = ObservableList<ContactModel>();

  @computed
  Future<void> loadContacts() async {
    final dataList = await DbUtil.getData('contacts');
    listContacts = dataList
        .map(
          (item) => ContactModel(
            name: item['name'],
            phone: item['phone'],
            cellphone: item['cellphone'],
          ),
        )
        .toList()
        .asObservable();
  }

  @action
  addContact(ContactModel model) {
    listContacts.add(model);
    DbUtil.insert('contacts', {
      'name': model.name,
      'cellphone': model.cellphone,
      'phone': model.phone,
    });
  }

  @action
  removeContact(ContactModel model) {
    listContacts.removeWhere((element) => element.name == model.name);

    // listContacts.remove(model);
    DbUtil.remove(model.name);
  }
}
