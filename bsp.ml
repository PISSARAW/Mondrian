
type label = { coord : int; colored : bool; };;
type bsp = R of color option | L of label * bsp * bsp;;

(* Hauteur du bsp *)
let rec hauteur = function
	| R (a) -> 0
	| L(_,g,d) -> 1 + (max (hauteur g) (hauteur d));;
	

(* Ajoute un label dans un bsp *)

let ajout e b = 
	let rec add n bs i= 
		match b with
		| R(a) -> L(e, R None, R None)
		(* verticale *)
		| L(l,g,d) -> if (i mod 2) <>0 then L(l, (add n g (hauteur bs)), d)
					else L(l, g, (add n d (hauteur bs)))
	in add e b (hauteur b)
;;


let rec ajout e b = match b with
	| R (a) -> L (e, R None, R None)
	| L (l,_,_) when e=l ->b
	| L (l,g,d) when l<e -> L (l, g, (ajout e d))
	| L (l,g,d) -> L (l, (ajout e g), d);;


let rec add e = function 
	| R(a) -> L (e, R None, R None)
	| L (l,g,d) -> if (rn e)<(rn l) then L (l, add e g, d)
					else L (l, g, add e d)
;;

let rec ajoutS e b i p= match b with
	| R(a) -> L (e, R None, R None)
	| L (l,g,d) -> if (i mod 2) <> 0 then 
		if (rn e)<(bspn b) then L (l, (ajoutS e g (hauteur g) b), d)
					else L (l, g, (ajoutS e d (hauteur d) b))
		else 
			ajoutC e b i p
and ajoutC e b i p = match b with
	| R(a) -> L (e, R None, R None)
	| L (l,g,d) -> if (i mod 2) = 0 then 
		if (rn e)<(bspn b) then L (l, (ajoutC e g (hauteur g) b), d)
					else L (l, g, (ajoutC e d (hauteur d) b))
		else 
			ajoutS e b i p 
;;

let ajout e bsp = 
	let pater = ref R None and par = ref 0 in 
		let aux add b c f = 
			match c with
				| R(a) -> L(c, R None, R None)
				| L(l,g,d) -> if 


let aj e b = ajoutS e b (hauteur b) (R None);;
(ajout (n 500) (ajout (n 600) (ajout (n 750) (ajout (n 125) (ajout (n 200) (ajout (n 345) (ajout (n 760) (ajout (n 545) (R None) ))))))));;
(add (n 500) (add (n 600) (add (n 750) (add (n 125) (add (n 200) (add (n 345) (add (n 760) (add (n 545) (R None) ))))))));;
(aj (n 500) (aj (n 600) (aj (n 750) (aj (n 125) (aj (n 200) (aj (n 345) (aj (n 760) (aj (n 545) (R None) ))))))));;
(addl (n 500) (addl (n 600) (addl (n 750) (addl (n 125) (addl (n 200) (addl (n 345) (addl (n 760) (addl (n 545) (R None) ))))))));;

(* Ajouter un label *)
let lab b = match b with
    | R(a) -> { coord =0; colored= false; }
    | L(l,g,d) -> l;;


let n a = {coord=a; colored=false};;
let rn a = a.coord;;
let bspn = function
	| R(b)-> 0
	| L(l, g,d) -> rn l;;
			
ajout (n 1) (R None) ;;
(* diese initial necessaire *)

(* diese initial necessaire *)

(* diese initial necessaire *)

(* diese initial necessaire *) 