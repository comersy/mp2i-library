#####################
#######LISTES########
#####################




(* Recherche élement liste *) 

let rec mem l e = match l with
    |[] -> false
    |e1::q -> e1 = e || mem q e;;



(* Ordre croissant? *) 

let rec croissant l = match l with
    |[] -> true
    |[e] -> true
    |e1::e2::q -> e2 >= e1 && croissant (e2::q);;



(* List.rev *) 

let rev l = 
    let rec aux acc = function
        |[] -> acc
        |e::q -> aux (e::acc) q
        in aux [] l;;
 
 
 
 (* List.map *)
 
 let rec map f = function
    |[] -> []
    |e::q -> f(e)::(map f q);;
 
 
 
  (* Fonction @ *)
 
 let rec concat l1 l2 = match l1 with
    |[] -> l2
    |e::q -> e::(concat q l2);;



 (* Tri Fusion *) 
 
 let rec split = function
    |[] -> [],[]
    |[e] -> [e],[]
    |e1::e2::q -> let l1,l2 = split q in e1::l1,e2::l2;;
 
 let rec fusion l1 l2 = match l1,l2 with
    |_,[] -> l1
    |[],_ -> l2
    |e1::q1, e2::q2 when e1 < e2 -> e1::(fusion q1 l2)
    |e1::q1, e2::q2 -> e2::(fusion l1 q2);;
 
 let rec tri = function
    |[] -> []
    |[e] -> [e]
    |l -> let l1,l2 = split l in fusion (tri l1) (tri l2);;
 
 
 
 (* Tri Rapide *)
 
 let rec partition p = function
    |[] -> [],[]
    |e::q -> let l1, l2 = partition p q in (if e < p then e::l1,l2 else l1,e::l2);;
 
 let rec quickshort = function
    |[] -> []
    |e::q -> let l1,l2 = partition e q in (quickshort l1) @ (e::quickshort l2);;   (* On utilise comme pivot le premier élement de la liste : e *)



(* Tri par insertion *) 

let rec inser e l = match l with
    |[] -> [e]
    |x::q -> if x > e then e::l else x::(inser e q);;

let rec tri = function
    |[] -> []
    |e::q -> insere e (tri q)
    
    

(* Dichotomie *)

let dichotomie e t = 
    let rec aux i j = 
        let m = (i+j+1)/2 in
        if i > j 
            then false
        else
            if t.(m) = e 
                then true
            else
                if t.(m) > e 
                    then aux i (m-1)
                else
                    aux (m+1) j 
    in aux 0 ((Array.length t)-1);;
 
 
 
 (* Trichotomie *)
 
 let trichotomie e t = 
    let rec aux i j = 
        if i > j 
            then false
        else
            let m1 = (2*i + j + 1)/3 in 
            let m2 = (i + 2*j + 1)/3 in
            if t.(m1) = e || t.(m2) = e 
                then true
            else
                if t.(m1) > e 
                    then aux i (m1-1)
                else
                    if t.(m2) < e 
                        then aux (m2+1) j
                    else
                        aux (m1+1) (m2-1)
    in aux 0 (Array.length t-1);;



(* Quadrichotomie *)

let quadricho e t = 
    let rec aux i j = 
        if i > j 
            then false
        else
            let m1 = (3*i + j)/4 in 
            let m2 = (2*i + 2*j)/4 in 
            let m3 = (i + 3*j)/4 in 
            if t.(m1) = e || t.(m2) = e || t.(m3) = e 
                then true
            else 
                if t.(m1) > e 
                    then aux i (m1-1)
                else
                    if t.(m3) < e 
                        then aux (m3+1) j
                    else
                        if t.(m2) < e
                            then aux (m1+1) (m2-1)
                        else
                            aux (m2+1) (m3-1)
    in aux 0 (Array.length t -1);;
   
   
  
  
  
  ####################
  ######TABLEAU#######
  ####################
  
  
  
 (* Inverser Tableau *) 
 
 let inv t = 
    let n = Array.length t - 1 in
    for i = 0 to n/2 do 
        let a = t.(i) in 
        let b = t.(n-i) in 
        t.(i) <- b;
        t.(n-i) <- a
    done;
t;;



(* Doublon Tableau ? *)

let doublon t = 
    let a = ref false in
    for i = 0 to Array.length t -1 do 
        for j = (i+1) to Array.length t -1 do 
            if t.(i) = t.(j) then a:= true
        done;
    done;
!a;;



(* Swap 2 indices d'un tableau *) 

let swap t i j = 
    let a = t.(i) in 
    t.(i) <- t.(j);
    t.(j) <- a;
t;;


(* Tableau en liste *) 

let array_of_list t =
  Array.fold_right List.cons t []



(* Liste en tableau *) 

let list_of_array l = 
    let n = List.length l in 
    let t = Array.make n 0 in
    List.iteri (Array.set t) l;
t;;
    


######################################
#####ARITHMETIQUE CLASSIQUE###########
######################################



(* Exponentiation Rapide *)

let rec exp_rapide1 a n =
    if n = 0 
        then 1
    else 
        let b = exp_rapide a (n/2) in (* pour éviter de faire 2 appels récursifs *)
        if n mod 2 = 0 
            then b*b
        else a*b*b;;


(* PGCD *) 

let rec pgcd a b = 
    if b = 0 
        then a 
    else
        pgcd b (a mod b);; 



(* Hanoi *) 

let rec hanoi n tige1 tige2 = 
    if n = 0 then ()
    else 
        let tige_int = 3-tige1-tige2 in 
        hanoi (n-1) tige1 tige_int;
        print_string ((string_of_int tige1)^"->"^(string_of_int tige2)^"\n");
        hanoi (n-1) tige_int tige2 in hanoi 3 0 2;
        print_newline();;


(* Fibonacci accumulateur *) 

let fibo n = 
    let rec aux n a b = 
        if n = 0 
            then b 
        else aux (n-1) (a+b) a
    in aux n 1 1;;


##########################
########STRUCTURE#########
##########################




(* Table de hachage *) 

type ('a, 'b) table_hachage = {hache: 'a -> int; donnees: ('a * 'b) list array; largeur: int}

let creer h w = {
    hache = h;
    donnees = Array.make w [];
    largeur = w
}

let recherche t k = 
    List.mem k (List.map fst t.donnees.(t.hache k))

let element t k = 
    if not (recherche t k) then failwith "No Key"
    else
        List.map snd t.donnees.(t.hache k)

let ajouter t k e = 
    if recherche t k then failwith "Key already use"
    else
        t.donnees.(t.hache k) <- (k,e)::t.donnees.(t.hache k)

let suppr t k = 
    if not (recherche t k) then failwith "No Key"
    else
        t.donnees.(t.hache k) <- []




(* Zipper *)

type 'a zipper = { left: 'a list; right: 'a list}

let move_right z = match z.right with
            |[] -> failwith "Right est vide" 
            |e::q -> {left = e::z.left; right = q}

let move_left z = match z.left,z.right with
            |[],_ -> failwith "Left est vide" 
            |e::q,l -> {left = q; right = e::l}

let ajouter z e = {left = z1.left; right = e::(z1.right)}

let supprimer z = match z.right with
    |[] -> failwith "Right vide"
    |e::q -> {left = z.left; right = q}

let list_of_zipper z = 
    List.rev (z.left) @ z.right
    
    
    
    
    
#################
#######TREE######
#################


type 'a binary_tree = 
    |E
    |N of 'a * 'a binary_tree * 'a binary_tree;;


let rec size tree = match tree with
    |E -> 0;
    |N(r,g,d) -> 1 + size g + size d;;


let rec mem tree e = match tree with
    |E -> false
    |N(r,g,d) -> r = e || mem g e || mem d e;;
