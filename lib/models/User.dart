class User {
  final String name;
  final String email;
  final String password;

  User({required this.name, required this.email, required this.password});

  // Tạo danh sách tĩnh để lưu người dùng
  static List<User> users = [];

  // Thêm người dùng mới vào danh sách
  static void addUser(User user) {
    users.add(user);
  }

  // Lấy danh sách tất cả người dùng
  static List<User> getUsers() {
    return users;
  }

  // Phương thức để xác thực người dùng
  static User? authenticate(String username, String password) {
    try {
      return users.firstWhere(
        (user) => user.name == username && user.password == password,
      );
    } catch (e) {
      return null;
    }
  }
}
