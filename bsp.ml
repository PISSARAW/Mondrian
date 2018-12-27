
type label = { coord : int; colored : bool; };;
type bsp = R of color option | L of label * bsp * bsp;;

(* Hauteur du bsp *)
let rec hauteur = function
	| R (a) -> 0
	| L(_,g,d) -> 1 + (max (hauteur g) (hauteur d));;
	

(*fonction ramdom qui determine quel noeud contruire, 0->vertical et 1->horizontal*)
let random_noeud() = match (Random.int(2)) with
  |0 -> "vert"
  |_ -> "hor"
;;

(*fonction ramdom qui determinera vers quel fils aller, 0-->fils gauche et 1->fils droite*)
let leftorright() = Random.int(2);;

(*fonction qui construit une feuille d'un arbre bsp, prend un string(noeud)->type du noeud, un int(x)->valeur à ajouter, un arbre bsp(a)*)
let ajout_Bsp noeud x a =
  let rec aux x a parite = match a with
    |R _ -> L({coord = x; colored = false}, R None, R None)
    |L(c, l, r) ->
      if noeud = "vert" then
	 if (parite mod 2) = 0 then
	   if c.coord = x then a
	   else if x<c.coord then match l with
	    |R _ -> a
	    |L(,,_) -> L(c, aux x l (parite+1), r)
	   else match r with
	    |R _ -> a
	    |L(,,_) -> L(c, l, aux x r (parite+1))
	 else match l,r with
	   |R ,R _|L(,_,_),L(,,_) ->
	     if (leftorright()) = 0 then 
	       L(c, aux x l (parite+1), r)
	     else
	       L(c, l, aux x r (parite+1))
	   |R ,L(,_,_) -> L(c, aux x l (parite+1), r)
	   |L(,,_),R _ -> L(c, l, aux x r (parite+1))
      else
	if (parite mod 2) <> 0 then	   
	   if c.coord = x then a
	   else if x<c.coord then match l with
	    |R _ -> a
	    |L(,,_) -> L(c, aux x l (parite+1), r)
	   else match r with
	    |R _ -> a
	    |L(,,_) -> L(c, l, aux x r (parite+1)) 
	else match l,r with
	   |R ,R _|L(,_,_),L(,,_) ->
	     if (leftorright()) = 0 then 
	       L(c, aux x l (parite+1), r)
	     else
	       L(c, l, aux x r (parite+1))
	   |R ,L(,_,_) -> L(c, aux x l (parite+1), r)
	   |L(,,_),R _ -> L(c, l, aux x r (parite+1))	      				  
  in aux x a 0
;;

(*fonction contruire un arbre bsp, prend un parametre int qui sera le nombre de fois qu'on repetera l'operation*)
let cons_Bsp iter =
  let rec aux a iter =
    let noeud = random_noeud() in
  match iter with
  |(-1) -> a
  |_ -> ajout_Bsp noeud (Random.int(1000)) (aux a (iter-1))
  in aux (R None) iter 
;;








let rectangle x t w h l = 
	let (a,b) = Graphics.currentt_point() and x1=x+w and y1 = y+h in
		Graphics.moveto x y;
		Grpahics.lineto x y1; Graphics.lineto x1 y1;
		Graphics.lineto x1 y ; Graphics.lineto x y;
		Graphics.moveto a b;
		(a,b, x1, y1)::l;;
	

type rect =  int * int * int * int * bsp;;

type ligne = int * int *int * int;;

Graphics.lineto 100 100;;

let getLine = 
	let (a,b) = Graphics.current_point() in 
		let aux = 
			

(* Dessiner un rectangle *)
let rectangle1 x0 y0 w h l = 
	let (a,b) = Graphics.current_point() and x1 = x0+w and y1 = y0+h in 
		Graphics.moveto x0 y0; 
		Graphics.lineto x0 y1; 
		Graphics.lineto x1 y1; Graphics.lineto x1 y0; 
		Graphics.lineto x0 y0; Graphics.moveto a b; 
		(x0,y0, x1, y1, R None)::l;;


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
