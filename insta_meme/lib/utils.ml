open Owl ;;

let hello = "Hello, playground" ;;

let load_iris =
    let fname = "resources/iris.csv" in
    let header = [|"sepal_length";"sepal_width";"petal_length";"petal_width";"species"|] in
    let types = [|"f";"f";"f";"f";"s"|] in
    Dataframe.of_csv ~sep:',' ~head:header ~types fname ;;

let load_instafake =
    let fname = "resources/fake-v1.0.csv" in
    let types = [|"f";"f";"f";"f";"f";"f";"f";"f";"f";"f"|] in
    Dataframe.of_csv ~sep:',' ~types fname ;;

let split_instafake =
    let df = load_instafake in
    let x = Dataframe.get_cols df [|0;2;3;4;5;6;7;8;9|] in
    let y = Dataframe.get_col df 1 in
    (x, y) ;;
