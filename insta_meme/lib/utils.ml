open Owl ;;

let hello = "Hello, playground" ;;

let load_iris =
    let fname = "resources/iris.csv" in
    let header = [|"sepal_length";"sepal_width";"petal_length";"petal_width";"species"|] in
    let types = [|"f";"f";"f";"f";"s"|] in
    Dataframe.of_csv ~sep:',' ~head:header ~types fname ;;

let load_dataset =
    let xfname = "resources/data-data.csv" in
    let x = Owl_io.read_csv ~sep:',' xfname in
    let x = Array.map (fun a -> Array.map float_of_string a) x |> Mat.of_arrays in
    let yfname = "resources/data-target.csv" in
    let y = Owl_io.read_csv ~sep:',' yfname in
    let y = Array.map (fun a -> Array.map float_of_string a) y |> Mat.of_arrays in
    x, y ;;
