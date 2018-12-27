
type label = { coord : int; colored : bool; };;
type bsp = R of color option | L of label * bsp * bsp;;

(* Hauteur du bsp *)
let rec hauteur = function
	| R (a) -> 0
	| L(_,g,d) -> 1 + (max (hauteur g) (hauteur d));;
	

(* diese initial necessaire *)

let rec ajout e b = match b with
	| R (a) -> L (e, R None, R None)
	| L (l,_,_) when e=l ->b
	| L (l,g,d) when l<e -> L (l, g, (ajout e d))
	| L (l,g,d) -> L (l, (ajout e g), d);;


let ajout e b = 
	let add n bs i= 
		match b with
		| R(a) -> L(e, R None, R None)
		(* verticale *)
		| L(l,g,d) -> if ((i mod 2) <>0 then
			L(l, (add n g (hauteur bs)), d)
			else (L(l, d, (add n d (hauteur bs))
	in add e b (hauteur b)
;;
			

(* diese initial necessaire *)

(* diese initial necessaire *)

(* diese initial necessaire *)

(* diese initial necessaire *) 