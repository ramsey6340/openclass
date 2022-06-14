import 'enum_category_salle.dart';
import 'salle.dart';

class CategorySalle
{
  int id;
  EnumCategorySalle name_category;
  List<Salle> salles;

  CategorySalle(this.id, this.name_category, this.salles);
}