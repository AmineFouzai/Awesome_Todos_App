final List<String> users = ['ala', '123'];

bool login(email, pass) {
  return users.indexOf(email) != -1
      ? users.indexOf(pass) != -1 ? true : false
      : false;
}
