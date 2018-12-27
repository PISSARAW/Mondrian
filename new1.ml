// Executer ocaml graphics.cma

Graphics.open_graph " ";;
Graphics.set_window_title "Mondrian";;
Graphics.plot 10 20;;
 
ignore (Graphics.read_key ());;

type label = { coord : int; colored : bool; };;
type bsp = R of color option | L of label * bsp * bsp;;

let rec ajout e b = match b with
	| R (a) -> L (e, R None, R None)
	| L (l,_,_) when e=l ->b
	| L (l,g,d) when l<e -> L (l, g, (ajout e d))
	| L (l,g,d) -> L (l, (ajout e g), d);;


let rec hauteur = function
	| R (a) -> 0
	| L(_,g,d) -> 1 + (max (hauteur g) (hauteur d));;
	
let white = rgb 255 255 255;;
let blue  = rgb 30 25 ;;
let red = rgb 255 10 0;;

let rec colorier c b = match b with	
	| R(a) -> if R(a) <> R None then R(c) else R(a) 
	| L(l, g, d) -> l.colored:=true;;