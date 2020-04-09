class Transaction{
  String description;

  Transaction(this.description);

  static getTransactions(){
    return ["Pedro ordered #04333 of \$19,90 on January 21",
      "Caio ordered #91234 of \$23,20 on January 10",
      "Marc ordered #42332 of \$31,40 on February 05",
      "John ordered #54344 of \$23,90 on March 10",
      "Gray ordered #84344 of \$44,90 on December 23",
      "Ana ordered #84544 of \$99,90 on December 30",
      "Diogo ordered #3344 of \$19,90 on December 31",
    ];
  }
}