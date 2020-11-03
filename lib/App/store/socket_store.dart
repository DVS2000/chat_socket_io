import 'package:mobx/mobx.dart';
import 'package:socket_io_client/socket_io_client.dart';
part 'socket_store.g.dart';

class SocketStore = _SocketStoreBase with _$SocketStore;

abstract class _SocketStoreBase with Store {

  @observable
  bool isLoading = false;

  @observable
  bool connected = false;

  @observable
  bool isSending = false;

  @observable
  ObservableList<String> data = ObservableList.of([]);
  
  Socket socket;

  @action
  Future<void> connect() async {

    isLoading = true;

    socket = io('http://chats2020.herokuapp.com', <String, dynamic>{
        'transports': ['websocket'],
        'autoConnect': true,
        'extraHeaders': {'foo': 'bar'} // optional
      });

      socket.on('connect', (_) {
        isLoading = false;
        print("Conectouuuu");
        connected = true;
      });

      socket.on('disconnect', (_) {
        connected = false;
      });

      socket.on('msg', (msg) {
        print(msg);
        data.add(msg);
      });

   }

   @action
   Future<void> sendSms({String sms}) async {
     socket.emit('msg', sms);
     data.add("Tu: " + sms);
   }
}