
import 'package:oz_cofe/model/ProfileMenuItemModel.dart';
import 'package:oz_cofe/model/PromoModel.dart';
import 'package:oz_cofe/model/StoreModel.dart';
import 'package:oz_cofe/model/TransactionModel.dart';

class DummyData {


  static final promos = [
    PromoModel(title: "Discount up to 5%", description: "Learn more for more info", storeIds: ['Seef-id','Muharraq-id'], numberOfVocher: 5),
    PromoModel(title: "Save up to \$1,200", description: "with this pocket", storeIds: ['Seef2-id', 'Muharraq2-id'], numberOfVocher: 1),
  ];

  static final stores = [
    StoreModel(
      id:'Seef-id',
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
      id:'Muharraq-id',
      name: "Oz Cafe Muharraq",
      imageUrl: "assets/images/oz_muharraq.jpg",
      status: "Closed",
      distance: "630m", rating: 3, 
      address: "Jl. ZA. Pagar Alam , Bandar Lampung",
              openTime: '9:00am', 
        closTime: '11:00pm',
    ),
        StoreModel(
          id:'Seef2-id',
      name: "Oz Cafe Seef2",
      imageUrl: "assets/images/oz_seef.jpg",
      status: "Open",
      distance: "430m", rating: 5, address: "Jl. ZA. Pagar Alam , Bandar Lampung",
                 openTime: '9:00am', 
        closTime: '11:00pm',
    ),
    StoreModel(
         id:'Muharraq2-id',
      name: "Oz Cafe Muharraq2",
      imageUrl: "assets/images/oz_muharraq.jpg",
      status: "Closed",
      distance: "630m", rating: 3, address: "Jl. ZA. Pagar Alam , Bandar Lampung",
              openTime: '9:00am', 
        closTime: '11:00pm',
    ),
  ];

  static final transactions = [
    TransactionModel(
      storeName: "Goodtime Cafe 2B",
      orderDetails: "Peanut Butter Latte, Caramel...",
      pickupMethod: "Self Pickup",
      date: "2024-03-12",
      status: "Order Completed",
    ),
    TransactionModel(
      storeName: "Goodtime Cafe 2B",
      orderDetails: "Peanut Butter Latte, Caramel...",
      pickupMethod: "Self Pickup",
      date: "2024-03-10",
      status: "Order Completed",
    ),
  ];
static List<StoreModel> getStoresForPromo(PromoModel promo) {
  return DummyData.stores
      .where((store) => promo.storeIds.contains(store.id))
      .toList();
}
  static final profileItems = [
    ProfileMenuItemModel(title: "Shipping Address", icon: "assets/icons/address.png"),
    ProfileMenuItemModel(title: "Membership", icon: "assets/icons/membership.png"),
    ProfileMenuItemModel(title: "Favorite", icon: "assets/icons/favorite.png"),
    ProfileMenuItemModel(title: "Contact Us", icon: "assets/icons/contact.png"),
    ProfileMenuItemModel(title: "FAQ", icon: "assets/icons/faq.png"),
    ProfileMenuItemModel(title: "Logout", icon: "assets/icons/logout.png", hasArrow: false),
  ];
}
