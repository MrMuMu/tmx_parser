import 'package:xml/xml.dart';

import 'extensions/xml_element.dart';
import 'properties.dart';
import 'property.dart';

class Terrain {
  String name;
  int tile;

  Map<String, Property> properties;

  Terrain.fromXML(XmlElement element) {
    if (element.name.local != "terrain") {
      throw "can not parse, element is not a 'terrain'";
    }

    name = element.getAttributeStrOr("name", name);
    tile = element.getAttributeIntOr("tile", tile);

    element.children.whereType<XmlElement>().forEach((childElement) {
      switch (childElement.name.local) {
        case "properties":
          properties ??= Properties.fromXML(childElement);
          break;
      }
    });
  }
}
