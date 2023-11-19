// To parse this JSON data, do
//
//     final priceVeriation = priceVeriationFromJson(jsonString);


class Controls {
  PriceVeriation? size;

  Controls({
    this.size,
  });

  factory Controls.fromJson(Map<String, dynamic> json) => Controls(
    size: json["size"] == null ? null : PriceVeriation.fromJson(json["size"]),
  );

  Map<String, dynamic> toJson() => {
    "size": size?.toJson(),
  };
}

class PriceVeriation {
  String? textId;
  String? controlType;
  String? dataType;
  String? label;
  int? priceVeriationDefault;
  int? minimum;
  double? priceIncreasePerUnit;
  Controls? controls;

  PriceVeriation({
    this.textId,
    this.controlType,
    this.dataType,
    this.label,
    this.priceVeriationDefault,
    this.minimum,
    this.priceIncreasePerUnit,
    this.controls,
  });

  factory PriceVeriation.fromJson(Map<String, dynamic> json) => PriceVeriation(
    textId: json["textId"],
    controlType: json["controlType"],
    dataType: json["dataType"],
    label: json["label"],
    priceVeriationDefault: json["default"],
    minimum: json["minimum"],
    priceIncreasePerUnit: json["priceIncreasePerUnit"]?.toDouble(),
    controls: json["controls"] == null ? null : Controls.fromJson(json["controls"]),
  );

  Map<String, dynamic> toJson() => {
    "textId": textId,
    "controlType": controlType,
    "dataType": dataType,
    "label": label,
    "default": priceVeriationDefault,
    "minimum": minimum,
    "priceIncreasePerUnit": priceIncreasePerUnit,
    "controls": controls?.toJson(),
  };
}
