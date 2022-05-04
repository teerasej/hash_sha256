class BlockHashModel {
  int nonce = 0;
  String hashed = '';

  BlockHashModel(this.hashed, {this.nonce = 0});
}
