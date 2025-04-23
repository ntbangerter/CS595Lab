use std::{hash::pedersen_hash, merkle::compute_merkle_root};

fn main(
    r: Field, 
    index: Field, 
    path: [Field; 8], 
    root: pub Field,
    id: pub Field
) {
    let leaf = pedersen_hash([id, r]);
    let validateRoot = compute_merkle_root(leaf, index, path);

    assert(root == validateRoot);
}

#[test]
fn test_main() {
    // main(1, 2);

    // Uncomment to make test fail
    // main(1, 1);
}
