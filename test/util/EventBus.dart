class EventBus {
  Map<String, _Handlers> _events = new Map();

  void on(String event, Function handler, {Object namespace}) {
    _Handlers handlers = _events[event] ?? new _Handlers();
    handlers.add(handler, namespace);
    _events[event] = handlers;
  }

  void off(String event, {Function handler, Object namespace}) {
    _Handlers handlers = _events[event];
    if (handler != null) {
      handlers.removeByHandler(handler, namespace);
    } else {
      if (namespace != null) {
        handlers.removeByNamespace(namespace);
      }
    }
  }

  void trigger(String event, {dynamic data, Object namespace}) {
    if (_events[event] == null) {
      print('no event binded: $event');
      return;
    }
    List<_Handler> handlers = _events[event].handlers;

    handlers.forEach((_Handler element) {
      if (element != null) {
        if (namespace != null) {
          if (namespace == element.namespace) {
            element.handler(data);
          }
        } else {
          element.handler(data);
        }
      }
    });
  }

  void clear() {
    _events = new Map();
  }
}

class _Handlers {
  List<_Handler> handlers = [];

  add(Function handle, Object namespace) {
    handlers.add(_Handler(handle, namespace));
  }

  removeByHandler(Function handle, [Object namespace]) {
    List<_Handler> tmp = handlers.where((_Handler it) => it.handler == handle);
    if (namespace != null) {
      tmp = tmp.where((_Handler element) => element.namespace == namespace);
    }
    tmp.forEach((element) {
      handlers.remove(element);
    });
  }

  removeByNamespace(Object namespace) {
    List<_Handler> tmp =
        handlers.where((_Handler it) => it.namespace == namespace);
    tmp.forEach((element) {
      handlers.remove(element);
    });
  }

  List<_Handler> whereNamespace(Object namespace) {
    return handlers.where((_Handler it) => it.namespace == namespace);
  }
}

class _Handler {
  Function handler;
  Object namespace;
  _Handler(this.handler, this.namespace);
}
