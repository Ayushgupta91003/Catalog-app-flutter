import 'package:catalog/models/catalog.dart';

class CartModel{
  // catalog field
  CatalogModel _catalog = CatalogModel();


  // Collection of IDs - store Ids of each item
  final List<int> _itemIds = [];

  // Get Catalog
  CatalogModel get catalog => _catalog;

  set catalog(CatalogModel newCatalog){
    assert(newCatalog!= null);
    _catalog = newCatalog;
  }


  // Get items in the cart
  List<Item> get items => _itemIds.map((id)=> _catalog.getByID(id)).toList();

  // Get Total price
  num get totalPrice =>
      items.fold(0, (total,current)=> total+(current.price??0));






  // add item
  void add(Item item){
    _itemIds.add(item.id ?? 0);
  }

  // delete item

  void remove(Item item){
    _itemIds.remove(item.id);
  }



}

