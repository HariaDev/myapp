import 'package:flutter/material.dart';

class TableSuaredWidget extends StatelessWidget {

  final int column;
  final int row;
  final int flex;
  final List<List<String>>? dataText;
  final Map Function(Map map) onClick;
  final Map Function(Map map) onDoubleClick;

  int width=50;
  int height=50;
  int contentWidth;
  int contentHeight;

  Color colorBase;
  Color colorClick;
  Color colorDoubleClick;

  TableSuaredWidget(this.dataText, this.column,this.row,this.flex, this.onClick,this.onDoubleClick, 
  {super.key,this.contentHeight = 650,this.contentWidth = 860,
  this.colorBase = Colors.blueAccent,this.colorClick = Colors.greenAccent,this.colorDoubleClick = Colors.red});
  

  @override
  Widget build(BuildContext context) {
    int numcolumns = this.column;
    int numRows = this.row;
    if(dataText != null){
      numRows = dataText!.length;
      height=(contentHeight/numRows).toInt();
    }else{
      height=(contentHeight/row).toInt();
      width=(contentWidth/column).toInt();
    }
    var rows = <Widget>[];
    for (var i = 0; i < numRows; i++) {
      var columns = <Widget>[];
      if(dataText != null){
        numcolumns = dataText![i].length;
        width=(contentWidth/numcolumns).toInt();
      }
      for (var j = 0; j < numcolumns; j++) {
        if(dataText != null){
          columns.add(SuaredWidget(dataText![i][j],i,j,width,height,onClick,onDoubleClick,
          colorBase: colorBase,colorClick: colorClick,colorDoubleClick: colorDoubleClick));
        }else{
          //columns.add(SuaredWidget("${i}-${j}",i,j,width,height,onClick,onDoubleClick));
          columns.add(SuaredWidget("",i,j,width,height,onClick,onDoubleClick));
        }
        //columns.add(SuaredWidget("${i}-${j}",i,j,width,height,onClick,onDoubleClick));
      }
      rows.add(Row(
        children: columns,
      ));
    }
    return Expanded(
          flex:flex,
          child: Container(
              //decoration: BoxDecoration(border: Border.all()),
              child: Column(
              children: rows
            )
          )
        );
    
  }
}

// #docregion FavoriteWidget
class SuaredWidget extends StatefulWidget {
  final int column;
  final int row;
  final String myText;
  final Map Function(Map map) onClick;
  final Map Function(Map map) onDoubleClick;
  
  final int width;
  final int height;

  Color colorBase;
  Color colorClick;
  Color colorDoubleClick;

  SuaredWidget( this.myText,this.column,this.row,this.width,this.height,this.onClick,this.onDoubleClick,
  {super.key, this.colorBase = Colors.blueAccent,this.colorClick = Colors.greenAccent,this.colorDoubleClick = Colors.red});

  @override
  _SquaredWidgetState createState() => _SquaredWidgetState(myText,this.width,this.height, onClick,onDoubleClick, colorBase: colorBase,colorClick: colorClick,colorDoubleClick: colorDoubleClick);
}
// #enddocregion FavoriteWidget

// #docregion _FavoriteWidgetState, _FavoriteWidgetState-fields, _FavoriteWidgetState-build
class _SquaredWidgetState extends State<SuaredWidget> {
  // #enddocregion _FavoriteWidgetState-build
  bool _isFavorited = true;
  bool _isClicked = false;
  bool _isDoubleCliked = false;
  int _favoriteCount = 41;
  int _clikedCount = 0;
  int _doubleClikedCount = 0;
  int column = -1;
  int row = -1;
  String myText;
  int width = 55;
  int height = 55;

  final Map Function(Map map) onClick;
  final Map Function(Map map) onDoubleClick;
  // #enddocregion _FavoriteWidgetState-fields
  Color colorBase;
  Color colorClick;
  Color colorDoubleClick;
  Color currenColor = Colors.blueAccent;

  _SquaredWidgetState(this.myText,this.width,this.height,this.onClick,this.onDoubleClick,
  {this.colorBase = Colors.blueAccent,this.colorClick = Colors.greenAccent,this.colorDoubleClick = Colors.red});


  void _onTab(int column,int row) {
    this.column = column;
    this.row = row;
    setState(() {
      _clikedCount =  _isClicked ? _clikedCount - 1 : _clikedCount + 1;
      _isClicked = !_isClicked;
      _isDoubleCliked = false;
      currenColor = _isClicked ? colorClick : colorBase;
    });
    Map data = {"column": this.column,"row": this.row};
    onClick.call(data);
  }

  void _onDoubleTab(int column,int row) {
    this.column = column;
    this.row = row;
    setState(() {      
      _doubleClikedCount =  _isDoubleCliked ? _doubleClikedCount - 1 : _doubleClikedCount + 1;
      _isDoubleCliked = !_isDoubleCliked;
      _isClicked = false;
      currenColor = _isDoubleCliked ? colorDoubleClick : colorBase;
    });
    Map data = {"column": this.column,"row": this.row};
    onDoubleClick.call(data);
  }

  // #docregion _FavoriteWidgetState-build
  @override
  Widget build(BuildContext context) {
    //currenColor = _isFavorited ? colorBlue : colorGreen;
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        GestureDetector(
          onTap: (){ _onTab(widget.column,widget.row); },
          onDoubleTap: (){ _onDoubleTab(widget.column,widget.row); },
          child: Expanded(
             child: Container(
              width: width.toDouble(),
              height: height.toDouble(),
              padding: new EdgeInsets.fromLTRB(5.0, 5.0, 5.0, 5.0),
              decoration: BoxDecoration(
                color: currenColor,
                border: Border.all(
                    color: Colors.black, width: 1.0, style: BorderStyle.solid),
              ),
              //color: currenColor,
              child: Center(
                child: Text(myText),
              ),
            ),
          )
        )
      ],
    );
  }
  // #docregion _FavoriteWidgetState-fields
}