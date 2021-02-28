class AmountCalculator {

  final List quantityList;
  final List priceList;
  double _amount = 0;

  AmountCalculator({this.quantityList, this.priceList});

  String getAmountWithoutGst () {
    for(int i=0; i<quantityList.length ; i++){
      _amount += quantityList[i] * priceList[i];
    }
    return _amount.toStringAsFixed(2);
  }

  String getGst () {
    double gst = _amount * 0.025;
    return gst.toStringAsFixed(2);
  }

  String getFinalAmount () {
    _amount += _amount * 0.05;
    return _amount.toStringAsFixed(2);
  }

}