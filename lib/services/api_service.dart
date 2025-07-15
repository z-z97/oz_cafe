class ApiService {
  Future<List<Map<String, dynamic>>> fetchProducts() async {
    return [
      {
        'name': 'Spanish Latte',
        'price': '2.8 BHD',
        'image': 'https://yourdomain.com/spanish_latte.jpg',
      },
      {
        'name': 'Cold Brew',
        'price': '2.5 BHD',
        'image': 'https://yourdomain.com/cold_brew.jpg',
      },
    ];
  }
}
