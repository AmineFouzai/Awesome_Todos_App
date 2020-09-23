final List<String> users = ['thehanterx2@gmail.com', '123456'];

bool login(email, pass) {
  return users.indexOf(email) != -1
      ? users.indexOf(pass) != -1 ? true : false
      : false;
}
