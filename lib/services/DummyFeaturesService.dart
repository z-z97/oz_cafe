import 'package:oz_cofe/model/ProfileMenuItemModel.dart';
import 'package:oz_cofe/model/PromoModel.dart';
import 'package:oz_cofe/model/StoreModel.dart';
import 'package:oz_cofe/model/orderModel.dart';
import 'package:oz_cofe/model/productModel.dart';

class DummyData {
  static final products = [
    Productmodel(
      id: 'espresso_id',
      name: 'Espresso',
      catogary: 'Hot Drinks',
      price: 1.5,
    ),
        Productmodel(
      id: 'Americano_id',
      name: 'Americano',
      catogary: 'Hot Drinks',
      price: 1.5,
    ),
            Productmodel(
      id: 'iced_Americano_id',
      name: 'iced Americano',
      catogary: 'cold Drinks',
      price: 1.5,
    ),
                Productmodel(
      id: 'iced_latte_id',
      name: 'iced latte',
      catogary: 'cold Drinks',
      price: 2.1,
    ),
                    Productmodel(
      id: 'Halloumi_Zaatar_Sandwich_id',
      name: 'Halloumi Zaatar Sandwich',
      catogary: 'Meals',
      price: 2.5,
    ),
                        Productmodel(
      id: 'Brisket_Sliders_id',
      name: 'Brisket Sliders',
      catogary: 'Meals',
      price: 2.5,
    ),
                            Productmodel(
      id: 'French_toast_id',
      name: 'French toast',
      catogary: 'Desserts',
      price: 2.8,
    ),
                                Productmodel(
      id: 'Labneh_Zattar_Toast_id',
      name: 'Labneh Zattar Toast',
      catogary: 'Breakfast',
      price: 2.4,
    ),
  ];

  static final promos = [
    PromoModel(
      title: "Discount up to 5%",
      description: "Learn more for more info",
      storeIds: ['Seef-id', 'Muharraq-id'],
      numberOfVocher: 5,
    ),
    PromoModel(
      title: "Save up to \$1,200",
      description: "with this pocket",
      storeIds: ['Seef2-id', 'Muharraq2-id'],
      numberOfVocher: 1,
    ),
  ];

  static final stores = [
    StoreModel(
      id: 'Seef-id',
      name: "Oz Cafe Seef",
      imageUrl: "assets/images/oz_seef.jpg",
      status: "Open",
      distance: "430m",
      rating: 5,
      address: "Jl. ZA. Pagar Alam , Bandar Lampung",
      openTime: '9:00am',
      closTime: '10:00pm',
    ),
    StoreModel(
      id: 'Muharraq-id',
      name: "Oz Cafe Muharraq",
      imageUrl: "assets/images/oz_muharraq.jpg",
      status: "Closed",
      distance: "630m",
      rating: 3,
      address: "Jl. ZA. Pagar Alam , Bandar Lampung",
      openTime: '9:00am',
      closTime: '11:00pm',
    ),
    StoreModel(
      id: 'Seef2-id',
      name: "Oz Cafe Seef2",
      imageUrl: "assets/images/oz_seef.jpg",
      status: "Open",
      distance: "430m",
      rating: 5,
      address: "Jl. ZA. Pagar Alam , Bandar Lampung",
      openTime: '9:00am',
      closTime: '11:00pm',
    ),
    StoreModel(
      id: 'Muharraq2-id',
      name: "Oz Cafe Muharraq2",
      imageUrl: "assets/images/oz_muharraq.jpg",
      status: "Closed",
      distance: "630m",
      rating: 3,
      address: "Jl. ZA. Pagar Alam , Bandar Lampung",
      openTime: '9:00am',
      closTime: '11:00pm',
    ),
  ];

  static final transactions = [
    TransactionModel(
      products: ['espresso_id' , 'French_toast_id'],
     cafeName: 'Goodtime Cafe 2B', 
     orderName: '',
      pickupMethod: '',
       totalMenu: 2,
        totalPrice: 5.5, 
        date: DateTime(2024 ,5 , 6), 
        status: 'Complete'
      
  
    ),
    TransactionModel(
products: ['espresso_id' , 'French_toast_id'],
     cafeName: 'Goodtime Cafe 2B', 
     orderName: '',
      pickupMethod: '',
       totalMenu: 2,
        totalPrice: 6.8, 
        date: DateTime(2024 ,5 , 6), 
        status: 'Complete'
      
  
    ),
        TransactionModel(
products: ['Brisket_Sliders_id' , 'Labneh_Zattar_Toast_id'],
     cafeName: 'Goodtime Cafe 2B', 
     orderName: '',
      pickupMethod: '',
       totalMenu: 2,
        totalPrice: 9, 
        date: DateTime(2024 ,5 , 6), 
        status: 'On Process'
      
  
    ),
            TransactionModel(
products: ['Brisket_Sliders_id' , 'Labneh_Zattar_Toast_id'],
     cafeName: 'Goodtime Cafe 2B', 
     orderName: '',
      pickupMethod: '',
       totalMenu: 2,
        totalPrice: 8.5, 
        date: DateTime(2024 ,5 , 6), 
        status: 'On Process'
      
  
    ),
  ];
    static List<Productmodel> getproductForTransaction(TransactionModel Transaction) {
    return DummyData.products
        .where((product) => Transaction.products.contains(product.id))
        .toList();
  }

  static List<StoreModel> getStoresForPromo(PromoModel promo) {
    return DummyData.stores
        .where((store) => promo.storeIds.contains(store.id))
        .toList();
  }

  static final profileItems = [
    ProfileMenuItemModel(
      title: "Shipping Address",
      icon: "assets/icons/address.png",
    ),
    ProfileMenuItemModel(
      title: "Membership",
      icon: "assets/icons/membership.png",
    ),
    ProfileMenuItemModel(title: "Favorite", icon: "assets/icons/favorite.png"),
    ProfileMenuItemModel(title: "Contact Us", icon: "assets/icons/contact.png"),
    ProfileMenuItemModel(title: "FAQ", icon: "assets/icons/faq.png"),
    ProfileMenuItemModel(
      title: "Logout",
      icon: "assets/icons/logout.png",
      hasArrow: false,
    ),
  ];
}
