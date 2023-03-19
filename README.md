# Flutter Puzzel Game

### هذي اكواد للعبة ألغاز بسيطة بحجم 4 × 4 حيث يتم تمثيل البلاط بواسطة مربعات مرقمة. 
### يمكن للمستخدم الضغط على المربع لنقله إلى المساحة الفاضيه ومحاولة حل اللغز بإنه يرتبهم من 1 ل 15.
 
https://user-images.githubusercontent.com/107775566/226172470-d0abfb59-f265-4672-99e9-15c22e97aabe.mp4


## هناك 3 دوال اساسية استخدمتها في كودي :
  ### canMoveTile
1- تتحقق دالة canMoveTile مما إذا كان يمكن نقل البلاط بناءً على موضعه بالنسبةإلى المربع الفارغ

    bool canMoveTile(int tileIndex) {
    int rowDiff = (tileIndex / 4).toInt() - (emptyTileIndex / 4).toInt();
    int colDiff = (tileIndex % 4) - (emptyTileIndex % 4);
    if (rowDiff.abs() > 1 || colDiff.abs() > 1) {
      return false;
    }
    return (rowDiff == 0) || (colDiff == 0);
   }
  
  ### swapTiles 
2- تقوم دالة swapTiles بتبديل اماكن المربع المحدد والمربع الفاضي

    void swapTiles(int tileIndex) {
    int temp = puzzleList[tileIndex];
    puzzleList[tileIndex] = puzzleList[emptyTileIndex];
    puzzleList[emptyTileIndex] = temp;
    emptyTileIndex = tileIndex;
   }
  
  ### shufflePuzzle
3- تقوم دالة shufflePuzzle بترتيب عشوائي لللارقام

     void shufflePuzzle() {
    for (int i = 0; i < 1000; i++) {
      List<int> movableTiles = [];
      for (int j = 0; j < puzzleList.length; j++) {
        if (canMoveTile(j)) {
          movableTiles.add(j);
        }
      }
      int randomIndex = movableTiles[Random().nextInt(movableTiles.length)];
      swapTiles(randomIndex);
    }
   }
