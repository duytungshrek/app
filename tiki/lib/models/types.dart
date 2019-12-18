class Types {
  static List<String> hotKeyWord = [
    "bitis hunter",
    "giày nam",
    "tai nghe bluetooth ",
    "giày nữ ",
    "balo ",
    "đồng hồ thông minh ",
    "tai nghe",
    "áo khoác nam ",
    "lock and lock",
    "loa bluetooth"
  ];
  getKeyWord(){
    return hotKeyWord;
  }
  static List<String> flashListFilter = [
    "Tất cả",
    "Nhà sách Tiki",
    "Thời Trang",
    "Làm Đẹp - Sức Khỏe",
    "Đồ chơi - Mẹ & Bé",
    "Bách Hóa Online",
  ];
  static List<String> flashListImage = [
    "0979b96d875eb7efc06cb3db4f60fbea",
    "1ba8286234e04c17d91d36bb9e346146",
    "2296a7fca8c7771c9a1189ff0a7f8044",
    "6bb0406c3f3fd6b7b33b0348badbc0fb",
    "b24ef910f35220a941ebc6c39dcb7458",
    "c500b38129f84714b3d6f8de39720616",
    "f39a4b6dd0fe2257e78f2c134f818097",
  ];
  static List<Product> productList = [
    Product("69/34/fd/4714e812d48e4266870b96da24865720.jpg",
        "CRM - Sữa Enfamil A + 1 360° Brain DHA+ MFGM PRO (400g)", "240.000 ₫"),
    Product("3e/5e/36/d7880a52e8f06701e7d75c82e3c3df1f.jpg",
        "Dung Dịch Giặt Quần Áo Cho Bé D-Nee - Chai 3000ml (Tím)", "165.000 ₫"),
    Product("c4/4b/51/4ebf9040c8f7a604f13c62c45d5ad475.jpg",
        "Khăn Ướt Bobby Nắp Nhựa (100 Miếng)", "27.000 ₫"),
    Product(
        "6e/30/02/a5df3c7b4285f3c4210e63ea93a9f51a.jpg",
        "Tã Quần Huggies Dry Gói Cực Đại XL62 (62 Miếng) - Bao Bì Mới",
        "296.000 ₫"),
    Product("80/1b/db/d496a624798fcbca359c62cbbaaca772.jpg",
        "Bột Giặt Tide Hương Downy (5kg)", "209.000 ₫"),
    Product("04/63/fa/5c7f6cafa47df8e74ec1d5e10f5d6d26.jpg",
        "Sữa Bột Enfagrow A+ 4 (2.2kg)", "831.000 ₫"),
    Product("0c/62/39/499c08d6ec13cd33b33ee601d9e4251e.jpg",
        "Điện Thoại iPhone 11 128GB - Hàng Chính Hãng", "22.909.000 ₫"),
    Product("44/e0/23/0368754fad8c6f80e907e89472f505d1.jpg",
        "Điện Thoại OPPO F9 (A11) (64GB/4GB) - Hàng Chính Hãng", "4.490.000 ₫"),
    Product(
        "bc/23/09/76d09086ceaa3d0d9905fe56644e9e9e.jpg",
        "Điện Thoại Xiaomi Mi 8 Lite (4GB / 64GB) - Hàng Chính Hãng",
        "3.590.000 ₫"),
    Product("53/4e/42/9d176c816ed49554af03982b30701621.JPG",
        "Điện Thoại OPPO F11 Pro (6GB/64GB) - Hàng Chính Hãng", "5.995.000 ₫"),
    Product("62/8b/cd/0c405bf8703a3b2f631c293bbd06e3ad.jpg",
        "Điện Thoại iPhone 11 Pro Max 64GB", "30.890.000 ₫"),
    Product(
        "30/52/62/7e164327e8e656390bc9ebf86073fdd0.jpg",
        "Điện Thoại Samsung Galaxy Note 10 (256GB/8GB) - Hàng Chính Hãng",
        "21.590.000 ₫"),
  ];
  static List<Category> categoryList = [
    Category(
        "Đồ Chơi - Mẹ & Bé ",
        "https://salt.tikicdn.com/cache/w885/ts/banner/5c/b1/a5/3a9c361b3c418b8be71b3e08eadd4328.png",
        "images/category/1.png"),
    Category(
        "Điện Thoại - Máy Tính Bảng",
        "https://salt.tikicdn.com/cache/w885/ts/banner/63/e2/05/93fbd2f36d401276db830116ca9cb2ce.jpg",
        "images/category/2.png"),
    Category(
        "Làm Đẹp - Sức Khỏe",
        "https://salt.tikicdn.com/cache/w885/ts/banner/da/70/d7/37bf047b349b47721add7b888b766df8.jpg",
        "images/category/3.png"),
    Category(
        "Điện Gia Dụng",
        "https://salt.tikicdn.com/cache/w885/ts/banner/31/ce/87/b7c8ec03fe33c0935b60301cf98b2cb4.jpg",
        "images/category/4.png"),
    Category(
        "Thời Trang",
        "https://salt.tikicdn.com/cache/w885/ts/banner/ec/c6/46/392c384e410e9d1508ccb53e0d3848d9.jpg",
        "images/category/5.png"),
    Category(
        "Điện Tử - Điện Lạnh",
        "https://salt.tikicdn.com/cache/w885/ts/banner/63/e2/05/93fbd2f36d401276db830116ca9cb2ce.jpg",
        "images/category/6.png"),
    Category(
        "Nhà Cửa - Đời Sống",
        "https://salt.tikicdn.com/cache/w885/ts/banner/de/0e/69/d9df2f8e97b884137d95a19810601b87.jpg",
        "images/category/7.png"),
    Category(
        "Hàng Quốc Tế",
        "https://salt.tikicdn.com/cache/w885/ts/banner/05/e4/83/5d7d8b621eda29084aeedf51d3fa2c21.png",
        "images/category/8.png"),
    Category(
        "Bách Hóa Online",
        "https://salt.tikicdn.com/cache/w885/ts/banner/a8/b2/89/cc521e21f1c12bbb282621e649bb8412.png",
        "images/category/9.png"),
    Category(
        "Thiết Bị Số - Phụ Kiện Số",
        "https://salt.tikicdn.com/cache/w885/ts/banner/06/7e/e0/94f00b988f538ede62a51029b1b95b0a.jpg",
        "images/category/10.png"),
    Category(
        "Voucher - Dịch vụ",
        "https://salt.tikicdn.com/cache/w885/ts/banner/b7/5c/1e/356d8379eb65630316a76b294fd983b2.jpg",
        "images/category/11.png"),
    Category(
        "Ô Tô - Xe Máy - Xe Đạp",
        "https://salt.tikicdn.com/cache/w885/ts/banner/26/b5/a9/37ca91bf6c9a8aa3ae705e1b0f499629.jpg",
        "images/category/12.png"),
    Category(
        "Nhà Sách Tiki",
        "https://salt.tikicdn.com/cache/w885/ts/banner/03/62/0a/4f86228f556af12b74e384fdeff173b8.jpg",
        "images/category/13.png"),
    Category(
        "Laptop - Máy Vi Tính - Linh kiện",
        "https://salt.tikicdn.com/cache/w885/ts/banner/63/e2/05/93fbd2f36d401276db830116ca9cb2ce.jpg",
        "images/category/14.png"),
    Category(
        "Thể Thao - Dã Ngoại",
        "https://salt.tikicdn.com/cache/w885/ts/banner/9b/27/df/6fb656aafa18ae193169c8d2dd5e65db.jpg",
        "images/category/15.png"),
    Category(
        "Máy Ảnh - Máy Quay Phim",
        "https://salt.tikicdn.com/cache/w885/ts/banner/5d/c9/29/7ba0f8fbbc681e37573f62f3fb069663.jpg",
        "images/category/16.png"),
  ];

  getListCategory() {
    return categoryList;
  }

  getListProduct() {
    return productList;
  }

  getListFilter() {
    return flashListFilter;
  }

  getListImage() {
    return flashListImage;
  }
}

class Product {
  String imageLink;
  String name;
  String price;

  Product(this.imageLink, this.name, this.price);
}

class Category {
  String name;
  String bannerLink;
  String icon;

  Category(this.name, this.bannerLink, this.icon);
}
