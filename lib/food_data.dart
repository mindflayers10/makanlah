class FoodData {
  String name;
  String price;
  String description;
  String imageAsset;

  FoodData({
    required this.name,
    required this.price,
    required this.description,
    required this.imageAsset,
  });
}

var foodDataList = [
  FoodData(
    name: 'Nasi Udang',
    price: 'Rp 35.000',
    description:
    ' Olahan Seafood dengan dominan udang bersama Nasi putih',
    imageAsset: 'images/seafood.png',
  ),
  FoodData(
    name: 'Capcay',
    price: 'Rp 18.000',
    description:
    ' Capcay goreng spesial dengan resep rahasia khas Makanlah cocok untuk vegan',
    imageAsset: 'images/capcay.png',
  ),
  FoodData(
    name: 'Mie Goreng Spesial',
    price: 'Rp 25.000',
    description:
    ' Mie goreng spesial dengan tambahan ayam,telur,dan sayuran ',
    imageAsset: 'images/miegr.png',
  ),
  FoodData(
    name: 'Manggo Squash',
    price: 'Rp 15.000',
    description:
    ' Minuman mangga dengan potongan mangga yang segar beserta tambahan soda. ',
    imageAsset: 'images/manggos.png',
  ),
  FoodData(
    name: 'Lime Squash',
    price: 'Rp 14.000',
    description:
    ' Minuman Lime dengan campuran soda serta daun Mint yang membuat rasa segar saat menikmatinya. ',
    imageAsset: 'images/lime.png',
  ),
  FoodData(
    name: 'Juice Strawberry',
    price: 'Rp 12.000',
    description:
    ' Minuman Jus Strawberry Murni tanpa bahan pengawet. ',
    imageAsset: 'images/strawbery.png',
  ),
];
