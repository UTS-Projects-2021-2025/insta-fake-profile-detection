open Owl


let levy_f (x : float) (y : float) : float =
  let first_term = (3.0 *. Owl_const.pi *. x |> Maths.sin) ** 2.0 in
  let second_term = (x -. 1.0) ** 2.0 *. (1.0 +. (3.0 *. y |> Maths.sin) ** 2.0) in
  let third_term = (y -. 1.0) ** 2.0 *. (1.0 +. (2.0 *. y |> Maths.sin) ** 2.0) in
  first_term +. second_term +. third_term

let schaffer_n4 (x : float) (y : float) : float =
  let first_term = (x ** 2.0 -. y ** 2.0 |> Maths.sin) -. 0.5 in
  let second_term = 1.0 +. 0.001 *. (x ** 2.0 +. y ** 2.0) in
  0.5 +. first_term /. (second_term ** 2.0)

let create_individual () : float * float =
  let x = Random.float 20.0 in
  let y = Random.float 20.0 in
  (x -. 10.0, y -. 10.0)

(** Genetic Algorithm *)
 (*
let genetic_algorithm population_size generations mutation_rate crossover_rate =
  let population = Array.init population_size (fun _ -> create_individual ()) in
 *)

(* Generate a neighbor by randomly altering x and y *)
let generate_neighbor x y =
  let dx = (Random.float 2.0 -. 1.0) *. 0.1 in  (* Max change of +/- 0.1 *)
  let dy = (Random.float 2.0 -. 1.0) *. 0.1 in
  (x +. dx, y +. dy)

(* Acceptance probability function *)
let acceptance_probability old_cost new_cost temperature =
  if new_cost < old_cost then 1.0
  else (old_cost -. new_cost) /. temperature |> Maths.exp

(* Simulated annealing algorithm *)
let simulated_annealing d initial_x initial_y initial_temp cooling_rate max_steps =
  let rec anneal x y temperature step best_x best_y best_cost =
    if step = max_steps then (best_x, best_y, best_cost)
    else
      let (new_x, new_y) = generate_neighbor x y in
      let new_cost = d new_x new_y in
      let old_cost = d x y in
      if Random.float 1.0 < acceptance_probability old_cost new_cost temperature then
        if new_cost < best_cost then
          anneal new_x new_y (temperature *. cooling_rate) (step + 1) new_x new_y new_cost
        else
          anneal new_x new_y (temperature *. cooling_rate) (step + 1) best_x best_y best_cost
      else
        anneal x y (temperature *. cooling_rate) (step + 1) best_x best_y best_cost
  in
  let initial_cost = d initial_x initial_y in
  anneal initial_x initial_y initial_temp 0 initial_x initial_y initial_cost

let result =
  Random.self_init () ;;
  let initial_x, initial_y = 100.0, 100.0 in
  let initial_temp = 10.0 in
  let cooling_rate = 0.99 in
  let max_steps = 100000 in
  let x, y, f = simulated_annealing schaffer_n4 initial_x initial_y initial_temp cooling_rate max_steps in
  Printf.printf "x: %f, y: %f, f(x, y): %f\n" x y f


let solve =
  Random.self_init () ;;
  let x, y = create_individual () in
  levy_f x y
