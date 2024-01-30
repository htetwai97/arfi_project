class BankInfoVO {
  int? id;
  String? bankName;
  String? accountHolderName;
  int? accountNumber;
  String? photo;
  String? createdAt;

  BankInfoVO(
      {this.id,
      this.bankName,
      this.accountHolderName,
      this.accountNumber,
      this.photo,
      this.createdAt});

  BankInfoVO.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    bankName = json['bank_name'];
    accountHolderName = json['account_holder_name'];
    accountNumber = json['account_number'];
    photo = json['photo'];
    createdAt = json['created_at'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['bank_name'] = this.bankName;
    data['account_holder_name'] = this.accountHolderName;
    data['account_number'] = this.accountNumber;
    data['photo'] = this.photo;
    data['created_at'] = this.createdAt;
    return data;
  }
}
