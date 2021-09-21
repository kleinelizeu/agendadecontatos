import 'package:mobx/mobx.dart';
part 'contact_model.g.dart';

class ContactModel = _ContactModelBase with _$ContactModel;

abstract class _ContactModelBase with Store {
  _ContactModelBase({this.name, this.cellphone, this.phone});

  @observable
  String name;
  @action
  setName(String value) => name = value;

  @observable
  String cellphone;
  @action
  setCellPhone(String value) => cellphone = value;

  @observable
  String phone;
  @action
  setPhone(String value) => phone = value;
}
