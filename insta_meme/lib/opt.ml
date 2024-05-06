open Owl

let eval =
    let x, y = load_dataset in
    let r = Regression.D.svm ~i:true x y in
