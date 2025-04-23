use std::{hash::pedersen_hash, merkle::compute_merkle_root};

fn main(
    id: Field, 
    r: Field, 
    oldPath: [Field; 8], 
    oldRoot: pub Field, 
    newRoot: pub Field, 
    commitment: pub Field, 
    index: pub Field
) {
    assert(pedersen_hash([id, r]) == commitment);

    let validateNewRoot = compute_merkle_root(commitment, index, oldPath);
    assert(newRoot == validateNewRoot);

    let emptyLeaf = 0x18d85f3de6dcd78b6ffbf5d8374433a5528d8e3bf2100df0b7bb43a4c59ebd63;
    let validatePath = compute_merkle_root(emptyLeaf, index, oldPath);
    assert(oldRoot == validatePath);

}

#[test]
fn test_main() {
    // main(1, 2);

    // Uncomment to make test fail
    // main(1, 1);
}
