open Owl ;;

let hello = "Hello, playground" ;;

let load_iris =
    let fname = "resources/iris.csv" in
    let header = [|"sepal_length";"sepal_width";"petal_length";"petal_width";"species"|] in
    let types = [|"f";"f";"f";"f";"s"|] in
    Dataframe.of_csv ~sep:',' ~head:header ~types fname ;;

let load_instafake =
    let fname = "resources/fake-v1.0.csv" in
    let types = [|"f";"b";"f";"f";"f";"f";"f";"f";"f";"f"|] in
    Dataframe.of_csv ~sep:',' ~types fname ;;
